<?php

namespace App\Controller\Admin;

use App\Entity\Chambre;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ChambreCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Chambre::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('titre'),
            TextareaField::new('description_courte'),
            TextareaField::new('description_longue'),
            //creation
            ImageField::new('photo')->setUploadDir('public/upload/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->onlyWhenCreating(),
            //modification
            ImageField::new('photo')->setUploadDir('public/upload/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->setFormTypeOptions(['required' => false])->onlyWhenUpdating(),
            //affichage
            ImageField::new('photo')->setBasePath('upload/')->hideOnForm(),
            NumberField::new('prix_journalier'),
            DateTimeField::new('date_enregistrement')->hideOnForm(),
            
        ];
    }
    public function createEntity (string $entityFqcn)
    {
        $chambre = new $entityFqcn;
        $chambre->setDateEnregistrement(new \DateTime());
        return $chambre;
    }
    
}
