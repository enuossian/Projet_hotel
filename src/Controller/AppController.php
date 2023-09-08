<?php

namespace App\Controller;

use App\Entity\Chambre;
use App\Entity\Commande;
use App\Form\CommandeType;
use App\Repository\ChambreRepository;
use App\Repository\SliderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AppController extends AbstractController
{
    #[Route('/', name: 'accueil')]
    public function index(SliderRepository $repo): Response
    {
        $slider = $repo->findAll();
        return $this->render('app/index.html.twig', [
            'slider' => $slider
        ]);
    }

    #[Route('/chambres', name:"chambres")]
    public function blog(ChambreRepository $repo) : Response
    {
        $chambres = $repo->findAll();
        return $this->render('app/chambres.html.twig', [
            'chambres' => $chambres
        ]);
    }

    #[Route('/commande', name:"commande")]
    public function form(Request $request, EntityManagerInterface $manager) 
    {
        $commande = new Commande;
        $form = $this->createForm(CommandeType::class, $commande);
        $form->handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid()) {
            $commande->setDateEnregistrement(new \DateTime());

            $depart= $commande->getDateDepart();
        
            if ($depart->diff($commande->getDateArrivee())->invert == 1) {
                $this->addFlash('danger', 'Une période de temps ne peut pas être négative.');
                return $this->redirectToRoute('accueil');
            }

            $days = $depart->diff($commande->getDateArrivee())->days;
            $prixTotal = ($commande->getChambre()->getPrixJournalier()* $days) + $commande->getChambre()->getPrixJournalier();

            $commande->setPrixTotal($prixTotal);

            $manager->persist($commande);
            $manager->flush();
            $this->addFlash('success', 'La commande a bien été ajoutée !');
            return $this->redirectToRoute('accueil');

        }

        return $this->render('app/form.html.twig', [
            'form' => $form,
        ]);   
    }
    #[Route('/restaurant', name: 'restaurant')]
    public function restau(): Response
    {
        return $this->render('app/restau.html.twig');
    }
    #[Route('/spa', name: 'spa')]
    public function spa(): Response
    {
        return $this->render('app/spa.html.twig');
    }

}
