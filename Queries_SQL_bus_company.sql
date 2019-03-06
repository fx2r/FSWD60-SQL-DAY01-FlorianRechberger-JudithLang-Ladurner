
-- connects city with fk_steet name and number

SELECT city_name, street_name, street_number
FROM `city`
INNER JOIN `street`ON fk_street_id = street_id;

--return everything from above as well as zip-number

SELECT city, street_name, street_number, zip_number
FROM `city`
INNER JOIN `street` ON fk_street_id = street_id
INNER JOIN `zip_code` ON fk_zip_code_id = zip_code_id;

--better way to write queries--

SELECT city.city_name, street.street_name, street.street_number, zip_code.zip_number
FROM `city`
INNER JOIN `street` ON city.fk_street_id = street.street_id
INNER JOIN `zip_code` ON city.fk_zip_code_id = zip_code.zip_code_id;

-- start at busstops and connect the rest

SELECT busstops.busstop_name, routes.route_name, bus.model, driver.first_name, driver.last_name
FROM busstops
INNER JOIN routes_connection on busstops.busstop_id = routes_connection.fk_busstop_id
INNER JOIN routes ON routes_connection.fk_routes_id= routes.routes_id
INNER JOIN bus ON routes.fk_bus_id = bus.bus_id
INNER JOIN driver ON bus.fk_driver_id = driver.driver_id

-- start at cities and connect and show the data below

SELECT busstops.busstop_name, city.city_name, street.street_name, street.street_number, zip_code.zip_number
FROM city
Inner JOIN busstops ON busstops.fk_city_id = city.city_id
INNER JOIN street ON city.fk_street_id = street.street_id
INNER JOIN zip_code ON city.fk_zip_code_id = zip_code.zip_code_id