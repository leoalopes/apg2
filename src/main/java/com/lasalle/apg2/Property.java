package com.lasalle.apg2;

public class Property {
    public int id;
    public String address;
    public String title;
    public String image;
    public String neighborhood;
    public String city;
    public String state;
    public String country;
    public float price;
    public String realtor;
    public String owner;
    public String owner_email;
    public String owner_phone;
    public Boolean funded;
    public Boolean owns;
    public Boolean trade;
    public Boolean not_updated;

    public Property(
        int id,
        String address,
        String title,
        String image,
        String neighborhood,
        String city,
        String state,
        String country,
        float price,
        String owner,
        String owner_email,
        String owner_phone,
        Boolean funded,
        Boolean owns,
        Boolean trade,
        Boolean not_updated
    ) {
        this.id = id;
        this.address = address;
        this.title = title;
        this.image = image;
        this.neighborhood = neighborhood;
        this.city = city;
        this.state = state;
        this.country = country;
        this.price = price;
        this.owner = owner;
        this.owner_email = owner_email;
        this.owner_phone = owner_phone;
        this.funded = funded;
        this.owns = owns;
        this.trade = trade;
        this.not_updated = not_updated;
    }
}
