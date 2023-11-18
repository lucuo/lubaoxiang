module person_type_module
        implicit none
        private
        
        public :: person

!定义派生类型
       type :: person
               character(len = 12)::name1 = ''
               character(len = 4):: sex
               integer   :: age
       contains

               procedure,pass::set_info
               procedure,pass::print_my_duty
       endtype


contains

    subroutine print_my_duty(this)
            class(person)::this
            write(*,*)"person  我是",this%name1
            endsubroutine



    subroutine set_info(this,name1,sex,age)
        class(person)::this
        character(len=*)::name1
        character(len=*)::sex
        integer   ::age

        integer::nerror

        nerror = 0

        !检查-有关字符串
        if(trim(sex)/='男' .and. trim(sex)/= '女')then
                write(*,*)"Error：sex is not 男 or 女"
                nerror = nerror +1
        endif

        !检查-数字变量检查
        if(age<0 .or. age>150)then
                write(*,*)"Error:age is less than 0 or larger than 150"
                nerror = nerror + 1
        endif       
        
        !检查无误后计算
        if(nerror == 0)then
                this%name1 = name1
                this%sex = sex
                this%age = age
        else
                write(*,*)"please check the inpute of set_info()"//&
                        "some wrong input is provided"
        endif
    endsubroutine

endmodule



