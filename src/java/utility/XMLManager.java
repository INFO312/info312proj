/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;


/**
 *
 * @author Kadin Boyle
 * Just a class i whipppped up to make some XML files for thread conversations
 * between supervisors and that. UNFINISHED
 */
public class XMLManager {
    
    protected DocumentBuilderFactory docFactory;
    protected DocumentBuilder docBuilder;
    
    public XMLManager() throws ParserConfigurationException{
        
    }
    
    public class XMLDocument extends XMLManager {
        private Document doc;
        private Element rootElement;
        
        private DocumentBuilderFactory docFactory;
        private DocumentBuilder docBuilder;
        
        public XMLDocument(String rootElementStr) throws ParserConfigurationException{
            docFactory = DocumentBuilderFactory.newInstance();
            docBuilder = docFactory.newDocumentBuilder();
            doc = docBuilder.newDocument();
            this.rootElement = doc.createElement(rootElementStr);
            doc.appendChild(this.rootElement);
        }
        
        //@returns a reference to the newly appended elements
        public Element appendToRoot(String newElementStr, String textContent){
            Element newElement = doc.createElement(newElementStr);   
            rootElement.appendChild(newElement);
            return newElement;
        }
        
        //@Returns a reference to the newly appended element
        public Element appendElement(Element targetElement, String newElementStr){
            Element newElement = doc.createElement(newElementStr);
            targetElement.appendChild(newElement);
            return newElement;
        }
        //Append with text content i.e <newlementname>textcontent here</newlementname>
        //@Returns a reference to the newly appended element
        public Element appendElement(Element targetElement, String newElementStr, String textContent){
            Element newElement = doc.createElement(newElementStr);
            if(!textContent.isEmpty()){
                newElement.appendChild(doc.createTextNode(textContent));
            }
            targetElement.appendChild(newElement);
            return newElement;
        }
        
        
        
    }
    
    
    
    
}
