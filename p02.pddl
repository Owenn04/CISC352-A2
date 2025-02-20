(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
      (hero-at loc-2-2)
      (hand_free)

    ; Locationg <> Corridor Connections
      (connection c2122 loc-2-1 loc-2-2)
      (connection c2122 loc-2-2 loc-2-1)
      ; location has corridors
      (loc_cor loc-2-1 c2122)
      (loc_cor loc-2-2 c2122)

      (connection c1222 loc-1-2 loc-2-2)
      (connection c1222 loc-2-2 loc-1-2)
      ; location has corridors
      (loc_cor loc-1-2 c1222)
      (loc_cor loc-2-2 c1222)

      (connection c2232 loc-2-2 loc-3-2)
      (connection c2232 loc-3-2 loc-2-2)
      ; location has corridors
      (loc_cor loc-2-2 c2232)
      (loc_cor loc-3-2 c2232)

      (connection c3242 loc-3-2 loc-4-2)
      (connection c3242 loc-4-2 loc-3-2)
      ; location has corridors
      (loc_cor loc-3-2 c3242)
      (loc_cor loc-4-2 c3242)

      (connection c2223 loc-2-2 loc-2-3)
      (connection c2223 loc-2-3 loc-2-2)
      ; location has corridors
      (loc_cor loc-2-2 c2223)
      (loc_cor loc-2-3 c2223)

    ; Key locations
      (key-at key1 loc-2-1) ; green
      (key-at key2 loc-1-2) ; rainbow
      (key-at key3 loc-2-2) ; purple
      (key-at key4 loc-2-3) ; yellow

    ; Locked corridors
      (locked c2122 purple)
      (locked c1222 yellow)
      (locked c2232 yellow)
      (locked c3242 rainbow)
      (locked c2223 green)

    ; Risky corridors

    ; Key colours
      (key_is key1 green)
      (key_is key2 rainbow)
      (key_is key3 purple)
      (key_is key4 yellow)

    ; Key usage properties (one use, two use, etc)
      (has_1_use key1)
      (has_uses key1)
      
      (has_1_use key2)
      (has_uses key2)
      
      (has_1_use key3)
      (has_uses key3)
      
      (has_2_uses key4)
      (has_uses key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
        (hero-at loc-4-2)
    )
  )

)
