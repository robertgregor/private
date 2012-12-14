package com.rg.homeManager.pocketHome;

public class Hex {

	private static final String hexChars = "ABCDEFabcdef0123456789";
	final static char[] digits = {
	'0' , '1' , '2' , '3' , '4' , '5' ,
	'6' , '7' , '8' , '9' , 'A' , 'B' ,
	'C' , 'D' , 'E' , 'F' };


	/**
	 * removes whitespaces from String. For definition
	 * of whiteSpaces see{ @link java.lang.Character#isWhitespace isWhitespace}
	 */
	public static String omitWhiteSpaces(String s){
		char ch;
	        StringBuffer sb = new StringBuffer();

		for (int i=0;i<s.length();i++){
			if ( !Character.isWhitespace((ch = s.charAt(i)))) sb.append(ch);
		}
		return sb.toString();
	}


	/**
	 * test if given string is valid hexaString, i.e., if it contains
  	 * only characters ABCDEFabcdef0123456789.
	 */
	public static boolean isValidHexa(String s){
		for (int i=0;i<s.length();i++){
    			if (hexChars.indexOf(s.charAt(i))==-1){
        			return false;
		    	}
		}
		return true;
	}


	/**
	 * converts byte to hexadecimal string. The resulting string 
         * is in uppercase with leading zero.
	 */
	public static String toString(byte b){
		int mask = 0x0F;
		char[] buff = new char[2];
		buff[1] = digits[ b & mask ];
		b >>>= 4;
		buff[0] = digits[ b & mask ];
		return new String(buff,0,2);
	}

	/**
	 * converts byte's wrapper java.lang.Byte to hexadecimal string. The resulting string 
         * is in uppercase with leading zero.
	 */

        public static String toString(Byte b){
                return toString(b.byteValue());
        }

        
	/**
	 * converts integer to hexadecimal string. 
	 */
	public static String toString(int i){
		return toString((byte)((i & 0xFF000000) >> 24))+
                       toString((byte)((i & 0x00FF0000) >> 16))+
                       toString((byte)((i & 0x0000FF00) >> 8))+
		       toString((byte)( i & 0x000000FF));
	}

	/**
	 * converts the wrapper java.lang.Integer to hexadecimal string. 
	 */
	public static String toString(Integer i){
		return toString(i.intValue());
	}


        /**
	 * converts short number to hexadecimal string. 
	 */

	public static String toString(short s){
		return toString((byte)((s & 0xFF00) >> 8 ))+toString((byte)(s & 0x00FF));
	}

	/**
	 * converts the wrapper java.lang.Short to hexadecimal string. 
	 */
	public static String toString(Short s){
		return toString(s.shortValue());
	}

 	/**
	 * converts <CODE>long</CODE> to <CODE>String</CODE> in hexa representation.
	 * Example: toString(12L,5) returns "000000000C"
	 * @param <CODE>long l</CODE> number to be converted
	 * @param <CODE>int len</CODE> length of result (pairs of characters)
	 * @return <CODE>String</CODE> each byte is represented by two characters.
	 */
	public static String toHexString(long l,int len){
		StringBuffer result = new StringBuffer(Long.toHexString(l).toUpperCase());
		while (result.length() < (2*len)) result.insert(0,"0");
		return result.toString();
	}


 	/**
	 * converts array of bytes to hexadecimal string.
	 */
	public static String toString(byte[] data) {
        	
        	return toString(data,0,data.length);
 	}

 	/**
	 * converts array of bytes to hexadecimal string.
	 */
	public static String toString(byte[] data, int offset, int len){
	        byte b;
		int mask = 0x0F;

		if (offset+len>data.length) len = data.length - offset;
		char[] buff = new char[2*len];

		for ( int i=offset;i<len;i++){
			b = data[i];
			buff[2*i+1-offset] = digits[ b & mask ];
			b >>>= 4;
			buff[2*i-offset] = digits[ b & mask ];
		}
		return new String(buff,0,buff.length);


	}


	 /**
	 *  converts string to its hexadecimal ASCII representation.
	 * <BR> Example: fromString2AsciiString("1234") returns "31323334"
	 * @param <CODE>String s</CODE> simple string to be converted
	 * @return <CODE>String</CODE> ascii representation
	 */
	public static String toHexString(String s){
	 	return toString(s.getBytes());
	}



	private static int c2i(char c){
		int x=0;
		switch( c ){
			 	case '0': x=0;break;
			 	case '1': x=1;break;			
			 	case '2': x=2;break;
			 	case '3': x=3;break;
			 	case '4': x=4;break;
			 	case '5': x=5;break;
			 	case '6': x=6;break;
			 	case '7': x=7;break;
			 	case '8': x=8;break;
			 	case '9': x=9;break;
			 	case 'A':
				case 'a': x=10;break;
			 	case 'B':
				case 'b': x=11;break;
			 	case 'C':
				case 'c': x=12;break;
			 	case 'D':
				case 'd': x=13;break;
			 	case 'E': 
				case 'e': x=14;break;
			 	case 'F':
				case 'f': x=15;
			}
		return x;
	}


	/**
	 * converts hexadecimal string into array of bytes
	 */
	public static byte[] fromString(String byteString) {
		int l = byteString.length();
		if ( l%2!=0 ) throw new IllegalArgumentException("Length is not divisible by 2.");
		char[] buff = new char[l];
		byte[] res  = new byte[l/2];
		byteString.getChars(0,l,buff,0);

		for(int i=0;i<l;i+=2){
	                 res[i/2]=(byte)(((c2i(buff[i])<<4) + c2i(buff[i+1]))&0x00FF);
		}
		return res;
	}		


        
        public static String pad(String data){
                StringBuffer sb = new StringBuffer(data);
	    	if ((data.length()/2)%8!=0){
		        int remaining_bytes=8-(data.length()/2)%8;
			for (int i=0;i<remaining_bytes;i++){
				sb.append("FF");
			}
                }

                return sb.toString();
        }


        public static int pad(StringBuffer data){
		int remaining_bytes=0;

	    	if ((data.length()/2)%8!=0){
		        remaining_bytes=8-(data.length()/2)%8;
			for (int i=0;i<remaining_bytes;i++){
				data.append("FF");
			}
                }

                return remaining_bytes;
        }

        public static int pad(StringBuffer data, String padding){
		int remaining_bytes=0;

	    	if ((data.length()/2)%8!=0){
		        remaining_bytes=8-(data.length()/2)%8;
			for (int i=0;i<remaining_bytes;i++){
				data.append(padding);
			}
                }

                return remaining_bytes;
        }


}
