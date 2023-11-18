SET(SOURCE_FILES
	test_person.f90
	../src/subroutine.f90
	../src/extends_sub.f90
	)
ADD_EXECUTABLE(test_person ${SOURCE_FILES})
ADD_TEST(NAME unitTest_person COMMAND test_person)
