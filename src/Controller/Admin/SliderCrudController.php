<?php

namespace App\Controller\Admin;

use App\Entity\Slider;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class SliderCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Slider::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            // création
            ImageField::new('photo')->setUploadDir('public/upload/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->onlyWhenCreating(),
            // modification
            ImageField::new('photo')->setUploadDir('public/upload/')->setUploadedFileNamePattern('[timestamp]-[slug].[extension]')->setFormTypeOptions(['required' => false])->onlyWhenUpdating(),
            // affichage
            ImageField::new('photo')->setBasePath('upload/')->hideOnFOrm(),
            IntegerField::new('ordre'),
            DateTimeField::new('date_enregistrement')->hideOnForm(),
        ];
    }
    public function createEntity (string $entityFqcn)
    {
        $slider = new $entityFqcn;
        $slider->setDateEnregistrement(new \DateTime());
        return $slider;
    }
    
}
