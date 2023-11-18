module student_type_module
        use person_type_module
        implicit none
        private

        public :: student

        !扩展派生类型
        type,extends(person) :: student

               character(len = 10)::dorm ="东20-206"
        contains
                procedure,pass :: print_my_duty
        
        endtype student


contains


    subroutine print_my_duty(this)
            class(student)::this

                    write(*,*)"student  我是",this%name1,",我的宿舍在",this%dorm
                    write(*,*)"我的任务是"
    endsubroutine

endmodule student_type_module

