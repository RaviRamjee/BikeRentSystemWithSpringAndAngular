package com.spring.utils;

public class StringUtil {

	public static boolean hasLength(String str) {
		return (str != null && str.length() > 0);
	}

	public static boolean isEmpty(final CharSequence cs) {
		return cs == null || cs.length() == 0;
	}

	public static boolean isNoneEmpty(final CharSequence... css) {
		return !isAnyEmpty(css);
	}

	public static boolean isNotEmpty(final CharSequence cs) {
		return !isEmpty(cs);
	}

	public static boolean isAnyEmpty(final CharSequence... css) {
		if (css != null && css.length == 0) {
			return false;
		}
		for (final CharSequence cs : css) {
			if (isEmpty(cs)) {
				return true;
			}
		}
		return false;
	}

	public static boolean isAllEmpty(final CharSequence... css) {
		if (css != null && css.length == 0) {
			return true;
		}
		for (final CharSequence cs : css) {
			if (isNotEmpty(cs)) {
				return false;
			}
		}
		return true;
	}

	public static boolean isBlank(final CharSequence cs) {
		int strLen;
		if (cs == null || (strLen = cs.length()) == 0) {
			return true;
		}
		for (int i = 0; i < strLen; i++) {
			if (!Character.isWhitespace(cs.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	public static int compare(final String str1, final String str2, final boolean nullIsLess) {
		if (str1 == str2) {
			return 0;
		}
		if (str1 == null) {
			return nullIsLess ? -1 : 1;
		}
		if (str2 == null) {
			return nullIsLess ? 1 : -1;
		}
		return str1.compareTo(str2);
	}

	public static int compareIgnoreCase(final String str1, final String str2) {
		return compareIgnoreCase(str1, str2, true);
	}

	public static int compareIgnoreCase(final String str1, final String str2, final boolean nullIsLess) {
		if (str1 == str2) {
			return 0;
		}
		if (str1 == null) {
			return nullIsLess ? -1 : 1;
		}
		if (str2 == null) {
			return nullIsLess ? 1 : -1;
		}
		return str1.compareToIgnoreCase(str2);
	}

	public static boolean isAlphanumeric(final CharSequence cs) {
		if (isEmpty(cs)) {
			return false;
		}
		final int sz = cs.length();
		for (int i = 0; i < sz; i++) {
			if (!Character.isLetterOrDigit(cs.charAt(i))) {
				return false;
			}
		}
		return true;
	}

	public static String getDigits(final String str) {
		if (isEmpty(str)) {
			return str;
		}
		final int sz = str.length();
		final StringBuilder strDigits = new StringBuilder(sz);
		for (int i = 0; i < sz; i++) {
			final char tempChar = str.charAt(i);
			if (Character.isDigit(tempChar)) {
				strDigits.append(tempChar);
			}
		}
		return strDigits.toString();
	}

}
