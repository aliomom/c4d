<?php

namespace App\Repository;

use App\Entity\AcceptedOrderEntity;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use App\Entity\CaptainProfileEntity;
use App\Entity\OrderEntity;
use Doctrine\ORM\Query\Expr\Join;

/**
 * @method AcceptedOrderEntity|null find($id, $lockMode = null, $lockVersion = null)
 * @method AcceptedOrderEntity|null findOneBy(array $criteria, array $orderBy = null)
 * @method AcceptedOrderEntity[]    findAll()
 * @method AcceptedOrderEntity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AcceptedOrderEntityRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AcceptedOrderEntity::class);
    }

    // public function getOrderStatusForCaptain($captainID, $orderId)
    // {
    //     return $this->createQueryBuilder('AcceptedOrderEntity')
    //         ->select('AcceptedOrderEntity.id','AcceptedOrderEntity.captainID', 'AcceptedOrderEntity.orderID', 'AcceptedOrderEntity.date', 'orderEntity.source', 'orderEntity.destination', 'orderEntity.date as orderDate', 'orderEntity.note as orderNote', 'orderEntity.payment ', 'orderEntity.state', 'orderEntity.updateDate as orderUpdateDate')
          
    //         ->join(OrderEntity::class, 'orderEntity', Join::WITH, 'orderEntity.id = AcceptedOrderEntity.orderID')

    //         ->andWhere('AcceptedOrderEntity.captainID = :captainID')
    //         ->andWhere('AcceptedOrderEntity.orderID = :orderId')
    //         ->setParameter('captainID', $captainID)
    //         ->setParameter('orderId', $orderId)
    //         ->getQuery()
    //         ->getOneOrNullResult();
    // }

    public function countOrdersDeliverd($captainID)
    {
        return $this->createQueryBuilder('AcceptedOrderEntity')
            ->select("count(AcceptedOrderEntity.id) as countOrdersDeliverd ")
            ->andWhere("AcceptedOrderEntity.state = 'deliverd'")
            ->andWhere('AcceptedOrderEntity.captainID = :captainID')
            ->setParameter('captainID', $captainID)
            ->getQuery()
            ->getOneOrNullResult();
    }
    
    public function getAcceptedOrderByOrderId($orderId)
    {
        return $this->createQueryBuilder('AcceptedOrderEntity')
            ->select('AcceptedOrderEntity.id', 'AcceptedOrderEntity.date as acceptedOrderDate', 'AcceptedOrderEntity.captainID', 'AcceptedOrderEntity.duration', 'AcceptedOrderEntity.state', 'captainProfileEntity.name as captainName', 'captainProfileEntity.car',  'captainProfileEntity.image')

            ->join(CaptainProfileEntity::class, 'captainProfileEntity', Join::WITH, 'captainProfileEntity.captainID = AcceptedOrderEntity.captainID')

            ->andWhere('AcceptedOrderEntity.orderID = :orderId')
            ->andWhere('captainProfileEntity.captainID = AcceptedOrderEntity.captainID')
            ->setParameter('orderId', $orderId)
            ->getQuery()
            ->getResult();
    }
    
    public function getAcceptedOrderByCaptainId($captainID)
    {
        return $this->createQueryBuilder('AcceptedOrderEntity')
            ->select('AcceptedOrderEntity.id', 'AcceptedOrderEntity.date as acceptedOrderDate', 'AcceptedOrderEntity.captainID', 'AcceptedOrderEntity.duration', 'AcceptedOrderEntity.state',  'AcceptedOrderEntity.orderID')

            ->andWhere('AcceptedOrderEntity.captainID = :captainID')
            ->setParameter('captainID', $captainID)
            ->getQuery()
            ->getResult();
    }

    public function countAcceptedOrder($captainId)
    {
        return $this->createQueryBuilder('AcceptedOrderEntity')
            ->select('count(AcceptedOrderEntity.orderID) as countOrdersDeliverd')

            ->join(OrderEntity::class, 'orderEntity', Join::WITH, 'orderEntity.id = AcceptedOrderEntity.orderID')

            ->andWhere('AcceptedOrderEntity.orderID = orderEntity.id')
            ->andWhere('AcceptedOrderEntity.captainID = :captainId')
            ->andWhere("orderEntity.state = 'deliverd'")
            ->setParameter('captainId', $captainId)
            ->getQuery()
            ->getResult();
    }

    public function getByOrderId($orderId)
    {
        return $this->createQueryBuilder('AcceptedOrderEntity')

            ->andWhere('AcceptedOrderEntity.orderID = :orderId')
            ->setParameter('orderId', $orderId)
            ->getQuery()
            ->getOneOrNullResult();
    }
    
    public function getTop5Captains()
    {
        return $this->createQueryBuilder('AcceptedOrderEntity')

            ->select('AcceptedOrderEntity.captainID', 'count(AcceptedOrderEntity.captainID) countOrdersDeliverd', 'captainProfileEntity.name', 'captainProfileEntity.car', 'captainProfileEntity.age', 'captainProfileEntity.salary', 'captainProfileEntity.bounce')
            
            ->leftJoin(CaptainProfileEntity::class, 'captainProfileEntity', Join::WITH, 'captainProfileEntity.captainID = AcceptedOrderEntity.captainID')

            ->andWhere("AcceptedOrderEntity.state ='deliverd'")
            ->andWhere('captainProfileEntity.captainID = AcceptedOrderEntity.captainID')
           
            ->addGroupBy('AcceptedOrderEntity.captainID')
          
            ->addGroupBy('captainProfileEntity.name')
            ->addGroupBy('captainProfileEntity.car')
            ->addGroupBy('captainProfileEntity.age')
            ->addGroupBy('captainProfileEntity.salary')
            ->addGroupBy('captainProfileEntity.bounce')
            
            ->having('count(AcceptedOrderEntity.captainID) > 0')
            ->setMaxResults(5)
            ->addOrderBy('countOrdersDeliverd','DESC')
            ->getQuery()
            ->getResult();
    }
}
