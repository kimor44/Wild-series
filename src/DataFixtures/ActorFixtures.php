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

    public function load(ObjectManager $manager)
    {
        foreach (self::ACTORS as $key => $actorName) {
            $actor = new Actor();
            $slug = new Slugify();
            $slug = $slug->generate($actorName);
            $actor->setName($actorName);
            $actor->setSlug($slug);
            $name = 'program_' . rand(0, 9);
            $actor->addProgram($this->getReference($name));
            $manager->persist($actor);
        }
        $faker = Faker\Factory::create('fr_FR');
        for ($i = 0; $i < 50; $i++) {
            $actor = new Actor();
            $slug = new Slugify();
            $slug = $slug->generate($actorName);
            $actor->setName($faker->name);
            $actor->setSlug($slug);
            for ($ii = 0; $ii < 3; $ii++) {
                $name = 'program_' . rand(0, 9);
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
