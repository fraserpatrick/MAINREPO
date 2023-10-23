Select dvdfilm.title
From dvdfilm, dvdlanguage
Where dvdfilm.language_id = dvdlanguage.language_id and dvdlanguage.name != 'English';

From dvdactor, dvdfilm, dvdfilm_actor
Where dvdactor.actor_id = dvdfilm_actor.actor_id and dvdfilm_actor.film_id = dvdfilm.film_id
and dvdactor.last_name = 'Willis';

Select distinct dvdfilm_actor.film_id, dvdactor.last_name
From dvdfilm_actor
Full outer join dvdactor on dvdfilm_actor.actor_id = dvdactor.actor_id;

Select distinct dvdactor.first_name, dvdactor.last_name
From dvdactor,dvdfilm,dvdcategory,dvdfilm_actor,dvdfilm_category
Where dvdactor.actor_id = dvdfilm_actor.actor_id and dvdfilm.film_id = dvdfilm_actor.film_id and dvdfilm.film_id = dvdfilm_category.film_id and dvdfilm_category.category_id = dvdcategory.category_id
and dvdcategory.name = 'Comedy';
