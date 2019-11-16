/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author maimaimai
 */
public class RamdomPasswordGenerator {

    private static final byte[] secretKeys = "anh_se_om_em_den_het_mua_hoa_roi".getBytes();

    public String makePassowrd() {
        int length = 10;
        String password = "";
        for (int i = 0; i < length - 2; i++) {
            password = password + randomChar("abcdefghijklmnopqrstvwxyzABCDEFGHIJKLMNOPQRSTVWXYZ");
        }
        String randomDigit = randomChar("1234567890");
        password = insertAtRandom(password, randomDigit);
        String randomSpecialChar = randomChar("!@#$%^&*-+");
        password = insertAtRandom(password, randomSpecialChar);

        return password;
    }

    public String passwordHashMD5(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] hash = md.digest(password.getBytes());
        return DatatypeConverter.printHexBinary(hash).toLowerCase();
    }

    public String randomChar(String character) {
        int n = character.length();
        int r = (int) (n * Math.random());
        return character.substring(r, r + 1);
    }

    public String insertAtRandom(String str, String toInsert) {
        int n = str.length();
        int r = (int) ((n + 1) * Math.random());
        return str.substring(0, r) + toInsert + str.substring(r);
    }
}
