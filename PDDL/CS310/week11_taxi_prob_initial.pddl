;; Simplest version of problem 
;; 5 locations

(define (problem taxi1)
    (:domain taxi_simplest)
    (:objects
        ;; 1 taxi, 5 locations, 3 people
        taxi_1 taxi_2 - taxi
        livingstone_tower royal_college graham_hills tic barony_hall - location
        scott rajesh lingjie Bill Kate Sarah - person
        )
    (:init
        (taxiEmpty taxi_1)
        (taxiEmpty taxi_2)
        ;;Set all to be outside taxi and at different locations
        (outsidetaxi scott)
        (plocation scott livingstone_tower)

        (outsidetaxi Bill)
        (plocation Bill tic)

        (outsidetaxi Kate)
        (plocation Kate livingstone_tower)

        (outsidetaxi Sarah)
        (plocation Sarah livingstone_tower)

        (outsidetaxi rajesh)
        (plocation rajesh graham_hills)

        (outsidetaxi lingjie)
        (plocation lingjie barony_hall)

        ;;set taxi location
        (tlocation taxi_1 tic)
        (tlocation taxi_2 livingstone_tower)
        
        ;; Simple connections
        ;; Initially going to assume simple binary connections (i.e. a circle)
        ;; liv - royal - gra - tic - barony -- liv
        (connects livingstone_tower royal_college)
        (connects royal_college livingstone_tower)
        (connects royal_college graham_hills)
        (connects graham_hills royal_college)
        (connects graham_hills tic)
        (connects tic graham_hills)
        (connects tic barony_hall)
        (connects barony_hall tic)
        (connects barony_hall livingstone_tower)
        (connects livingstone_tower barony_hall)
        )
    
    (:goal
        (and
            (outsidetaxi scott)
            (outsidetaxi rajesh)
            (outsidetaxi lingjie)
            (outsidetaxi Bill)
            (outsidetaxi Kate)
            (outsidetaxi Sarah)
            (plocation scott graham_hills)
            (plocation rajesh barony_hall)
            (plocation lingjie livingstone_tower)
            (plocation Bill royal_college)
            (plocation Kate tic)
            (plocation Sarah graham_hills)
        ))
)