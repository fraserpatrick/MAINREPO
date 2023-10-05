\d hmolicence;

/*Select licence_number
From hmolicence
Where occupant_capacity > ((number_of_bedrooms/2)+number_of_bedrooms);*/

/*Select expiry_date, living_accommodation
From hmolicence
Where expiry_date > '31-Dec-2019' and expiry_date < '01-Jan-2021';*/

Select licence_number, ward, occupant_capacity
From hmolicence
Where licence_holder like '%Orchid%';
