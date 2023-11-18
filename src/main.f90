program test_person
        use person_type_module
        use student_type_module

        class(person),pointer::person_ptr =>null()
        integer :: nerror = 0,nerror_temp = 0

        allocate(person::person_ptr)


        call person_ptr%set_info('小明妈妈','女',33)

        write(*,*)person_ptr%name1,person_ptr%sex,person_ptr%age

        deallocate(person_ptr)
        allocate(student::person_ptr)
        call person_ptr%set_info('小华妈妈','女',49)
        call person_ptr%print_my_duty()

endprogram test_person

