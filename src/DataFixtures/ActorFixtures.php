<?php

namespace App\DataFixtures;

use App\Entity\Actor;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

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

    public function getDependencies()

    {

        return [ProgramFixtures::class];

    }

    public function load(ObjectManager $manager)
    {
        foreach (self::ACTORS as $key => $actorName) {
            $actor = new Actor();
            $actor->setName($actorName);
            $manager->persist($actor);
            $this->addReference('actor_'.$key, $actor);
        }
        $manager->flush();
    }
}
