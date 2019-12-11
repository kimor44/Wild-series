<?php

namespace App\DataFixtures;

use App\Entity\Actor;
use App\Service\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Faker;

class ActorFixtures extends Fixture implements DependentFixtureInterface
{
    const ACTORS = [
        'Norman Reedus',
        'Andrew Lincoln',
        'Lauren Cohan',
        'Danai Gurira',
        'Julien Guibert',
        'Marcel Pattulacci',
        'Robert Robichet',
    ];

    const NUMBER_PROGRAMS_PER_ACTOR = 3;

    public function load(ObjectManager $manager)
    {
        foreach (self::ACTORS as $key => $actorName) {
            $actor = new Actor();
            $slug = new Slugify();
            $slug = $slug->generate($actorName);
            $actor->setName($actorName);
            $actor->setSlug($slug);
            $name = 'program_' . rand(0, ProgramFixtures::NUMBER_PROGRAMS-1);
            $actor->addProgram($this->getReference($name));
            $manager->persist($actor);
        }
        $faker = Faker\Factory::create('fr_FR');
        for ($i = 0; $i < SeasonFixtures::NUMBER_SEASONS-1; $i++) {
            $actor = new Actor();
            $slug = new Slugify();
            $actorName = $faker->name;
            $slug = $slug->generate($actorName);
            $actor->setName($actorName);
            $actor->setSlug($slug);
            for ($ii = 0; $ii < self::NUMBER_PROGRAMS_PER_ACTOR; $ii++) {
                $name = 'program_' . rand(0, ProgramFixtures::NUMBER_PROGRAMS-1);
                $actor->addProgram($this->getReference($name));
                $manager->persist($actor);
            }
        }
        $manager->flush();
    }

    public function getDependencies()

    {

        return [ProgramFixtures::class];

    }

}
