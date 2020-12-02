program colegiosystem
    use alumno
    implicit none
    
    CALL set_alumno('Brayan Alexander', 'Lipe Huamani', '73028080', 24)
    CALL get_alumno()
    CALL set_alumno('Pedro Luis', 'Fernandes Apaza', '12345678', 23)
    CALL get_alumno()
    CALL set_alumno('Diana Carolina', 'Chavez Lopez', '24245689', 19)
    CALL get_alumno()
    CALL set_alumno('Pepe Lucas', 'Arias Astete', '12457889', 20)
    CALL get_alumno()
    CALL set_alumno('Jorge Luis', 'Machego Pinto', '89562312', 21)
    CALL get_alumno()
    CALL set_alumno('Juan Roberto', 'Suca Mendoza', '20408978', 22)
    CALL get_alumno()
end program colegiosystem
