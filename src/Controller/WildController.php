<?php

namespace App\Controller;

use App\Entity\Program;
use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/wild", name="wild_")
 */
class WildController extends AbstractController
{
    /**
     * @Route("/", name="index")
     * @return Response A response instance
     */
    public function index(): Response
    {
        $programs = $this->getDoctrine()->getRepository(Program::class)->findAll();
        if (!$programs) {
            throw $this->createNotFoundException('No program found in program\'s table.');
        }
        return $this->render('wild/index.html.twig', [
            'website' => 'Wild Séries',
            'programs' => $programs,
        ]);
    }

    /**
     * Getting a program with a formatted slug for title
     * @Route("/show/{slug}", requirements={"slug"="^[0-9a-z-]+$"}, methods={"GET"}, defaults={"slug": null}, name="show")
     * @param string $slug The slugger
     * @return Response
     */
    public function show(string $slug): Response
    {
        if (!$slug) {
            throw $this->createNotFoundException('No slug has been sent to find a program in program\'s table.');
        }
        $slug = preg_replace(
            '/-/',
            ' ', ucwords(trim(strip_tags($slug)), "-")
        );
        $program = $this->getDoctrine()->getRepository(Program::class)->findOneBy(['title' => mb_strtolower($slug)]);
        if (!$program) {
            throw $this->createNotFoundException('No program with ' . $slug . ' title, found in program\'s table.');
        }
        return $this->render('wild/show.html.twig', [
            'program' => $program
        ]);
    }


    /**
     * Getting programs with a formatted slug for category
     * @Route("/category/{categoryName}", requirements={"categoryName"="^[0-9a-z-]+$"}, defaults={"categoryName": null}, name="show_category")
     * @param string $categoryName The category
     * @return Response A category
     */
    public function showByCategory(string $categoryName): Response
    {
        if (!$categoryName) {
            throw $this->createNotFoundException('No category has been sent to find programs in program\'s table.');
        }
        $categoryName = preg_replace(
            '/-/',
            ' ', trim(strip_tags($categoryName))
        );
        $category = $this->getDoctrine()->getRepository(Category::class)->findOneBy(['name' => mb_strtolower($categoryName)]);
        if (!$category) {
            throw $this->createNotFoundException('No programs with ' . $categoryName . ' category, found in category\'s table.');
        }
        $programs = $this->getDoctrine()->getRepository(Program::class)->findBy(
            ['category' => $category->getId()],
            ['id' => 'desc'], 3, 0);
        return $this->render('wild/category.html.twig', [
            'category' => $category,
            'programs' => $programs
        ]);
    }
}