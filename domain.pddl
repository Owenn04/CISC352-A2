(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
        :equality
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        (hero-at ?loc - location)

        ; key location
        (key-at ?k - key ?loc - location)

        ; if hero is holding a key 
        (holding ?k - key)

        ; corridor lock status and colour
        (locked ?cor - corridor ?col - colour)

        ; corridor connection predicate
        (connection ?cor - corridor ?loc1 - location ?loc2 - location)
        
        ; if location has corridor
        (loc_cor ?loc - location ?cor - corridor)

        ; if a corridor is risky
        (is_risky ?cor - corridor)

        ; if a location is messy
        (is_messy ?loc - location)

        ; key uses remaining
        (has_uses ?key - key)
        (has_2_uses ?key - key)
        (has_1_use ?key - key)
        
        ; treasure location
        (treasure_at ?loc - location)

        ; if heros hand is free
        (hand_free)

        ; keys colour
        (key_is ?key - key ?col - colour)


    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and
            
            ; hero is at current location
            (hero-at ?from)
            ; corridor exists
            (connection ?cor ?from ?to)

            ; corridor is unlocked
            (not (locked ?cor yellow))
            (not (locked ?cor red))
            (not (locked ?cor green))
            (not (locked ?cor rainbow))
            (not (locked ?cor purple))
        )

        :effect (and
            
            ; move the hero
            (not (hero-at ?from))
            (hero-at ?to)

            ; if corridor is risky collapse + make messy
            (when (is_risky ?cor) (not (connection ?cor ?from ?to)))
            (when (is_risky ?cor) (not (connection ?cor ?to ?from)))
            (when (is_risky ?cor) (is_messy ?to))

        )
    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; hero is at location
            (hero-at ?loc)
            ; key is at location
            (key-at ?k ?loc)
            ; hero's hands are free
            (hand_free)
            ; location is not messy
            (not (is_messy ?loc))

        )

        :effect (and

            ; holding the key
            (holding ?k)
            (not (hand_free))
            ; remove key from location
            (not (key-at ?k ?loc))

        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; hero holding a key
            (holding ?k)
            ; hero at location
            (hero-at ?loc)

        )

        :effect (and

            ; not holding key
            (not (holding ?k))
            (hand_free)
            ; put key in location
            (key-at ?k ?loc)

        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and

            ; hero is at location
            (hero-at ?loc)
        
            ; corridor is locked with colour
            (locked ?cor ?col)
        
            ; hero is holding the key
            (holding ?k)
        
            ; key color matching
            (key_is ?k ?col)
            ; (and 
            ;     (not (and (is_red ?k) (not (= ?col red))))
            ;     (not (and (is_yellow ?k) (not (= ?col yellow))))
            ;     (not (and (is_green ?k) (not (= ?col green))))
            ;     (not (and (is_purple ?k) (not (= ?col purple))))
            ;     (not (and (is_rainbow ?k) (not (= ?col rainbow))))
            ; )
        
            ; key has uses
            (has_uses ?k)
        
            ; corridor is connected to location hero is at
            (loc_cor ?loc ?cor)

        )

        :effect (and

            ; unlock the corridor
            (not (locked ?cor ?col))
            
            ; update key usage
            (when (has_1_use ?k) 
                (and 
                    (not (has_1_use ?k))
                    (not (has_uses ?k))
                )
            )
            (when (has_2_uses ?k) 
                (and 
                    (not (has_2_uses ?k))
                    (has_1_use ?k)
                )
            )

        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and

            ; hero is at location
            (hero-at ?loc)

            ; location is messy
            (is_messy ?loc)

        )

        :effect (and

            ; location is no longer messy
            (not (is_messy ?loc))

        )
    )

)
