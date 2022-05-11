#!/usr/bin/env bash

# This script will create a file.[hpp/cpp] with an orthodox canonical form:

#	- Default constructor
#	- Copy constructor
#	- Copy assignment operator
#	- Destructor

# Just run "sh createClass.sh name_of_class"

# ------------ CREATE .HPP HEADER FILE -----------

printf "#ifndef " > $1.hpp
echo "${1}_HPP" | tr '[a-z]' '[A-Z]' >> $1.hpp
printf "# define " >> $1.hpp
echo "${1}_HPP" | tr '[a-z]' '[A-Z]' >> $1.hpp

echo "
#include <iostream>

class ${1}
{
	private:

	public:
		${1}(void);
		${1}(${1} const &toCopy);
		~${1}(void);
		${1} &operator = (${1} const &toCopy);
};

//std::ostream    &operator<<(std::ostream &out, ${1} const &toCopy);

#endif" >> $1.hpp

# ------------ CREATE .CPP FILE -----------

echo "#include \"${1}.hpp\"

${1}::${1}(void)
{

}

${1}::${1}(${1} const &toCopy)
{
	*this = toCopy;
}

${1} &${1}::operator = (${1} const &toCopy)
{
	return *this;
}

${1}::~${1}(void)
{

}

//std::ostream &operator<<(std::ostream &out, ${1} const &toCopy)
//{
//	return out;
//}" > $1.cpp