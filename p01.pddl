(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)
    (hand_free)

    ; Locationg <> Corridor Connections

    ;row 2
    (connection c1222 loc-1-2 loc-2-2)
    (connection c1222 loc-2-2 loc-1-2)
    (loc_cor loc-1-2 c1222)  
    (loc_cor loc-2-2 c1222)  

    (connection c2232 loc-2-2 loc-3-2)
    (connection c2232 loc-3-2 loc-2-2)
    (loc_cor loc-2-2 c2232)
    (loc_cor loc-3-2 c2232)

    (connection c3242 loc-3-2 loc-4-2)
    (connection c3242 loc-4-2 loc-3-2)
    (loc_cor loc-3-2 c3242)
    (loc_cor loc-4-2 c3242)

    ; Row 3
    (connection c2333 loc-2-3 loc-3-3)
    (connection c2333 loc-3-3 loc-2-3)
    (loc_cor loc-2-3 c2333)
    (loc_cor loc-3-3 c2333)

    ; Row 4
    (connection c2434 loc-2-4 loc-3-4)
    (connection c2434 loc-3-4 loc-2-4)
    (loc_cor loc-2-4 c2434)
    (loc_cor loc-3-4 c2434)

    (connection c3444 loc-3-4 loc-4-4)
    (connection c3444 loc-4-4 loc-3-4)
    (loc_cor loc-3-4 c3444)
    (loc_cor loc-4-4 c3444)

    ; Column 2
    (connection c2223 loc-2-2 loc-2-3)
    (connection c2223 loc-2-3 loc-2-2)
    (loc_cor loc-2-2 c2223)
    (loc_cor loc-2-3 c2223)

    (connection c2324 loc-2-3 loc-2-4)
    (connection c2324 loc-2-4 loc-2-3)
    (loc_cor loc-2-3 c2324)
    (loc_cor loc-2-4 c2324)

    ; Column 3
    (connection c3132 loc-3-1 loc-3-2)
    (connection c3132 loc-3-2 loc-3-1)
    (loc_cor loc-3-1 c3132)
    (loc_cor loc-3-2 c3132)

    (connection c3233 loc-3-2 loc-3-3)
    (connection c3233 loc-3-3 loc-3-2)
    (loc_cor loc-3-2 c3233)
    (loc_cor loc-3-3 c3233)

    (connection c3334 loc-3-3 loc-3-4)
    (connection c3334 loc-3-4 loc-3-3)
    (loc_cor loc-3-3 c3334)
    (loc_cor loc-3-4 c3334)
    
    ; Key locations
    (key-at key1 loc-2-2) ;red
    (key-at key2 loc-2-4) ;yellow
    (key-at key3 loc-4-2) ;rainbow
    (key-at key4 loc-4-4) ;purple

    ; Locked corridors
    (locked c2324 red) 
    (locked c2434 red)
    (locked c3444 yellow)
    (locked c3242 purple)
    (locked c3132 rainbow)
    
    ; Risky corridors
    (is_risky c2324);
    (is_risky c2434);

    ; Key colours
    (key_is key1 red)
    (key_is key2 yellow)
    (key_is key3 rainbow)
    (key_is key4 purple)

    ; Key usage properties (one use, two use, etc)
    (has_uses key1) ;red key

    (has_2_uses key2) ;yellow key
    (has_uses key2)

    (has_1_use key3) ;rainbow key
    (has_uses key3)

    (has_1_use key4) ;purple key
    (has_uses key4)

  )
  (:goal
    (and
      (hero-at loc-3-1)
    )
  )

)
