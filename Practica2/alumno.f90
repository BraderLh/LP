module alumno
    implicit none
    CHARACTER (LEN = 16), PRIVATE :: nombres
    CHARACTER (LEN = 16), PRIVATE :: apellidos 
    CHARACTER (LEN = 8), PRIVATE :: dni 
    integer :: edad = 0
    
    PUBLIC :: set_alumno, get_alumno

contains
    subroutine set_alumno(n, a, d, e)
        implicit none
        CHARACTER (LEN=16), INTENT(IN) :: n
        CHARACTER (LEN=16), INTENT(IN) :: a 
        CHARACTER (LEN = 8), INTENT(IN) :: d
        INTEGER, INTENT(IN) ::  e
        INTEGER :: i
        INTEGER :: len_ap
        INTEGER :: len_a
        nombres = TRIM(n)
        apellidos = TRIM(a)
        len_a =  LEN_TRIM(a)
        
        dni = d
        edad = e
    end subroutine set_alumno

    subroutine get_alumno()
        print *, "DNI: ", TRIM(dni)
        print *, "Nombres: ", TRIM(nombres)
        print *, "Apellidos: ", TRIM(adjustl(apellidos))
        print *, "Edad ", edad
    end subroutine get_alumno

end module alumno