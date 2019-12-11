<?php

namespace App\DataFixtures;

use App\Entity\Episode;
use App\Service\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Faker;

class EpisodeFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $faker = Faker\Factory::create('fr_FR');
        for ($i = 0; $i < 250; $i++) {
            $episode = new Episode();
            $slug = new Slugify();
            $title = $faker->text(25);
            $slug = $slug->generate($title);
            $episode->setTitle($title);
            $episode->setSynopsis($faker->paragraph);
            $episode->setNumber($faker->numberBetween(1,5));
            $episode->setSlug($slug);
            $episode->setSeason($this->getReference('season_'.rand(0,49)));
            $manager->persist($episode);
        }
        $manager->flush();
    }

    public function getDependencies()

    {

        return [SeasonFixtures::class];

    }

}
