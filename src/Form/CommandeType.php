<?php

namespace App\Form;

use App\Entity\Chambre;
use App\Entity\Commande;
use Doctrine\ORM\Mapping\Entity;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CommandeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('date_arrivee')
            ->add('date_depart')
            //->add('prix_total')
            ->add('prenom')
            ->add('nom')
            ->add('telephone')
            ->add('email')
            //->add('date_enregistrement')
            ->add('chambre', EntityType::class, [
                'class' => Chambre::class,
                'choice_label'=> 'titre',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Commande::class,
        ]);
    }
}
