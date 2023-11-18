PROGRAM test_person
        use person_type_module
        use student_type_module

        type(person),pointer::per1 => null()

        allocate(per1)
        call per1%set_info('小明','男',3)
        write(*,*)"test:",per1%name1,per1%sex
        deallocate(per1)
endprogram

