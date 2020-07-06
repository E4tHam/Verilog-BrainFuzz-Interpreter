// rom_builder.cpp

#include <fstream>
#include <iostream>
#include <string.h>

#define _MEMORY_ 16

using namespace std;

class InvalidCharacterException { } ;

string to_mem( string ) ;

int main() {

    string file =  "" , line =  "error" ;
    ifstream ifs( "instruction.bf" ) ;
    string output =  "ROM.mem" ;
    ofstream ofs( output );

    while ( ifs.good() ) {
        getline( ifs, line );
        size_t i = line.find( "//" ) ;
        if ( i != -1 )
            line = line.substr( 0, i ) ;

	    line.erase(std::remove_if(line.begin(), line.end(), ::isspace), line.end());

        file += line;
    }

    cout << "Instructions from file \"instruction.bf\":\n" ;
    cout << file << "\n\n" ;
    cout << "  + ::: 0 \n  - ::: 1 \n  < ::: 2 \n  > ::: 3 \n  [ ::: 4 \n  ] ::: 5 \n  . ::: 6 \n  " ;
    cerr << "N" ;
    cout << " ::: 7 \n\n" ;

    ofs << to_mem( file ) ; 

    cout << "File \"" << output << "\" created.\n" ;
    return 0;
}

string to_mem( string in ) {
    string out =  "" ;

    for ( size_t i = 0; i < in.length(); i++ ) switch( in.at(i) ) {
        case '+': out += "000\n" ; break ;
        case '-': out += "001\n" ; break ;
        case '<': out += "010\n" ; break ;
        case '>': out += "011\n" ; break ;
        case '[': out += "100\n" ; break ;
        case ']': out += "101\n" ; break ;
        case '.': out += "110\n" ; break ;
        default: throw InvalidCharacterException();
    }
    while ( out.length() < _MEMORY_*4 ) out += "111\n";

    return out.substr( 0, out.length()-1 );
}
