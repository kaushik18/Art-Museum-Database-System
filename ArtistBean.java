/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import ejb.ArtistEJB;
import entity.Artist;
import entity.Staff;
import entity.TicketType;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Sunny
 */
@Named(value = "artistBean")
@RequestScoped
public class ArtistBean {

    @EJB
    private ArtistEJB artistEJB;
    private Artist artist = new Artist();
    private Staff staffMember = new Staff();
    private TicketType ticket = new TicketType();
    private String result;
    
    
    public ArtistBean() {
    }

    public Artist getArtist() {
        return artist;
    }

    public void setArtist(Artist artist) {
        this.artist = artist;
    }

    public String getResult() {
        return result;
    }

    public Staff getStaffMember() {
        return staffMember;
    }

    public void setStaffMember(Staff staffMember) {
        this.staffMember = staffMember;
    }

    public TicketType getTicket() {
        return ticket;
    }

    public void setTicket(TicketType ticket) {
        this.ticket = ticket;
    }

    public void setResult(String result) {
        this.result = result;
    }
    public void addArtist(){
        artistEJB.persist(artist);
        result = "Successfully added " + artist.getName();
    }
     public List<Staff> getStaffList()
    {
        return artistEJB.findAllStaff();
    }
     public List<TicketType> getTicketList(){
         return artistEJB.findAllTicket();
     }
    public void removeStaffMemeber(Staff staff){
        this.staffMember = staff;
        artistEJB.remove(staffMember);
        result = "Successfully removed ";
    }
    public void updateTicket(TicketType ticket){
        this.ticket = ticket;
        artistEJB.modify(ticket);
        result = "Successfully modified";
    }
    
      public String showPrice() {
      FacesContext fc = FacesContext.getCurrentInstance();
      Map<String,String> params = 
        fc.getExternalContext().getRequestParameterMap();
      String type =  params.get("type"); 
      ticket = artistEJB.getTicket(type);
      return "page3.xhtml";
    }
//    public List<TicketType> getUdatedTicketList()
//    {
//        return artistEJB.updatePrice("");
////        if (ticket != null){
////            String type = ticket.getType();
////            return artistEJB.updatePrice(type);
////        }
////        else
////           return null;
//    }
    
    
     public String showStaff(Staff staff) {
        this.staffMember = staff;
        return "page1.xhtml";
    }
     public String showTicket(TicketType ticket){
         this.ticket = ticket;
         return "page2.xhtml";
     }
    public String page1(){
        return "page1.xhtml";
    }
    public String page2(){
        return "page2.xhtml";
    }
    public String page3(){
        artistEJB.updatePrice();
        return "page3.xhtml";
    }
    
}
