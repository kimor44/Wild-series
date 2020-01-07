<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserFixtures extends Fixture
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
    }

    public function load(ObjectManager $manager)
    {
        $subscriber = new User();
        $subscriber->setEmail('guibtrash@gmail.com');
        $subscriber->setRoles(['ROLE_SUBSCRIBER']);
        $subscriber->setPseudo('trash');
        $subscriber->setPassword($this->passwordEncoder->encodePassword(
            $subscriber,
            'subscriberpassword'));
        $manager->persist($subscriber);

        $admin = new User();
        $admin->setEmail('julien.guibert24@sfr.fr');
        $admin->setRoles(['ROLE_ADMIN']);
        $admin->setPseudo('Guib\'');
        $admin->setPassword($this->passwordEncoder->encodePassword(
            $admin,
            'adminpassword'
        ));
        $manager->persist($admin);

        $manager->flush();
    }
}
