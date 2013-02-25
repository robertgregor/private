/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.remoteHome.gui;

import java.io.IOException;

/**
 *
 * @author pt596
 */
public class AddNewDevice extends AbstractWebService {
    
    @Override
    public void init() {}
    
    @Override
    public byte[] processRequest() throws IOException {
        return sendAjaxAnswer("OK added: "+requestParameters);
    }
}