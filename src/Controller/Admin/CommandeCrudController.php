<?php

namespace App\Controller\Admin;

use App\Entity\Commande;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class CommandeCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Commande::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnDetail(),
            DateField::new('date_depart', 'Date de départ'),
            DateField::new('date_arrivee', 'Date d\'arrivée'),
            NumberField::new('prix_total', 'Prix total'),
            TextField::new('nom'),
            TextField::new('prenom', 'Prénom'),
            TextField::new('telephone', 'Téléphone'),
            TextField::new('email', 'E-mail'),
            DateTimeField::new('date_enregistrement')->hideOnForm(),
        ];
    }
    public function createEntity (string $entityFqcn)
    {
        $commande = new $entityFqcn;
        $commande->setDateEnregistrement(new \DateTime());
        return $commande;
    }
    
}
