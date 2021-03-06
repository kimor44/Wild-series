<?php

namespace App\Controller;

use App\Entity\Actor;
use App\Entity\Comment;
use App\Entity\Episode;
use App\Entity\Program;
use App\Entity\Category;
use App\Entity\Season;
use App\Form\CommentType;
use App\Form\ProgramSearchType;
use App\Repository\CommentRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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
    public function index(Request $request): Response
    {
        $form = $this->createForm(
            ProgramSearchType::class,
            null,
            ['method' => Request::METHOD_GET]
        );
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            $data = $form->getData();
            $programsResult = $this->getDoctrine()->getRepository(Program::class)->findBySearch($data);
            return $this->render('wild/index.html.twig', [
                'website' => 'Wild Séries',
                'programs' => $programsResult,
                'form' => $form->createView(),
            ]);
        }

        $programs = $this->getDoctrine()->getRepository(Program::class)->findAll();
        if (!$programs) {
            throw $this->createNotFoundException('No program found in program\'s table.');
        }
        return $this->render('wild/index.html.twig', [
            'website' => 'Wild Séries',
            'programs' => $programs,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Getting a program with a formatted slug for title
     * @Route("/show/{slug}", methods={"GET"}, defaults={"slug": null}, name="show")
     * @param string $slug The slugger
     * @return Response
     */
    public function show(string $slug): Response
    {
        if (!$slug) {
            throw $this->createNotFoundException('No slug has been sent to find a program in program\'s table.');
        }

        $program = $this->getDoctrine()->getRepository(Program::class)->findOneBy(['slug' => $slug]);
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

    /**
     * Getting programs with a formatted slug for category
     * @Route("/program/{programName}", requirements={"programName"="^[0-9a-z-]+$"}, defaults={"programName": null}, name="show_program")
     * @param string $programName The program
     * @return Response A program
     */
    public function showByProgram(string $programName): Response
    {
        if (!$programName) {
            throw $this->createNotFoundException('No program has been sent to find seasons in season\'s table');
        }
        $programName = preg_replace(
            '/-/',
            ' ', trim(strip_tags($programName))
        );
        $program = $this->getDoctrine()->getRepository(Program::class)->findOneBy(['title' => mb_strtolower($programName)]);
        if (!$program) {
            throw $this->createNotFoundException('No program with ' . $programName . ' program, found in program\'s table.');
        }
        $seasons = $this->getDoctrine()->getRepository(Season::class)->findBy(
            ['program' => $program->getId()]
        );
        return $this->render('wild/program.html.twig', [
            'seasons' => $seasons,
            'program' => $program,
        ]);
    }

    /**
     * Getting episodes with an Id
     * @Route("/season/{id}", requirements={"id"="^[0-9]+$"}, defaults={"id"=null}, name="show_season")
     * @param int $id
     * @return Response A season
     */
    public function showBySeason(int $id): Response
    {
        if (!$id) {
            throw $this->createNotFoundException('No id has been sent to find seasons in season\'s table');
        }
        $season = $this->getDoctrine()->getRepository(Season::class)->find($id);
        if (!$season) {
            throw $this->createNotFoundException('No season with ' . $id . ' id, found in season\'s table.');
        }
        return $this->render('wild/season.html.twig', [
            'program' => $season->getProgram(),
            'episodes' => $season->getEpisodes(),
        ]);
    }

    /**
     * Getting Episode with an Id
     * @Route("/episode/{slug}", name="show_episode")
     * @param Episode $episode
     * @param Request $request
     * @param CommentRepository $commentRepository
     * @return Response A episode
     */
    public function showEpisode(Episode $episode, Request $request, CommentRepository $commentRepository): Response
    {
        $comment = new Comment();
        $comments = $commentRepository->findBy(
            ['episode' => $episode->getId()],
            ['id' => 'ASC']
        );
        $form = $this->createForm(
            CommentType::class,
            null,
            ['method' => Request::METHOD_POST]
        );
        $form->handleRequest($request);
        $season = $episode->getSeason();
        $program = $season->getProgram();
        if ($form->isSubmitted() && $form->isValid()) {
            $commentPost = $form->getData();
            $user = $this->getUser();
            $entityManager = $this->getDoctrine()->getManager();
            $comment->setAuthor($user);
            $comment->setEpisode($episode);
            $comment->setComment($commentPost->getComment());
            $comment->setRate($commentPost->getRate());
            $entityManager->persist($comment);
            $entityManager->flush();
            $this->addFlash(
                'success',
                'Merci pour votre commentaire !'
            );
            return $this->redirectToRoute('wild_show_episode', [
                'slug' => $episode->getSlug(),
            ]);
        }
        return $this->render('wild/episode.html.twig', [
            'episode' => $episode,
            'season' => $season,
            'program' => $program,
            'comments' => $comments,
            'commentForm' => $form->createView(),
        ]);
    }

    /**
     * Getting Actor with an Id
     * @Route("/actor/{slug}", name="show_actor")
     * @param Actor $actor
     * @return Response An actor
     */
    public function showActor(Actor $actor): Response
    {
        $programs = $actor->getPrograms();
        return $this->render('wild/actor.html.twig', [
            'actor' => $actor,
            'programs' => $programs,
        ]);

    }
}
