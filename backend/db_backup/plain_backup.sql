--
-- PostgreSQL database dump
--

\restrict qaMlhbXW1yoq07NANrbcQ5aYLjzIZjZhxAlBOchumiUM3oMSd5WlddmPdIW0tqX

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-04-09 23:26:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 16466)
-- Name: public; Type: SCHEMA; Schema: -; Owner: grocery_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO grocery_user;

--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: grocery_user
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16498)
-- Name: basket_items; Type: TABLE; Schema: public; Owner: grocery_user
--

CREATE TABLE public.basket_items (
    id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.basket_items OWNER TO grocery_user;

--
-- TOC entry 223 (class 1259 OID 16497)
-- Name: basket_items_id_seq; Type: SEQUENCE; Schema: public; Owner: grocery_user
--

CREATE SEQUENCE public.basket_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.basket_items_id_seq OWNER TO grocery_user;

--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 223
-- Name: basket_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grocery_user
--

ALTER SEQUENCE public.basket_items_id_seq OWNED BY public.basket_items.id;


--
-- TOC entry 222 (class 1259 OID 16485)
-- Name: products; Type: TABLE; Schema: public; Owner: grocery_user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    price real NOT NULL,
    category text,
    image_url text,
    is_alcohol boolean DEFAULT false
);


ALTER TABLE public.products OWNER TO grocery_user;

--
-- TOC entry 221 (class 1259 OID 16484)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: grocery_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO grocery_user;

--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grocery_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 226 (class 1259 OID 16519)
-- Name: reviews; Type: TABLE; Schema: public; Owner: grocery_user
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    product_id integer NOT NULL,
    author text NOT NULL,
    rating real NOT NULL,
    comment text
);


ALTER TABLE public.reviews OWNER TO grocery_user;

--
-- TOC entry 225 (class 1259 OID 16518)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: grocery_user
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO grocery_user;

--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 225
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grocery_user
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 220 (class 1259 OID 16468)
-- Name: users; Type: TABLE; Schema: public; Owner: grocery_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    fav_products text DEFAULT ''::text,
    purchased_products text DEFAULT ''::text,
    avatar text
);


ALTER TABLE public.users OWNER TO grocery_user;

--
-- TOC entry 219 (class 1259 OID 16467)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: grocery_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO grocery_user;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grocery_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4876 (class 2604 OID 16501)
-- Name: basket_items id; Type: DEFAULT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.basket_items ALTER COLUMN id SET DEFAULT nextval('public.basket_items_id_seq'::regclass);


--
-- TOC entry 4874 (class 2604 OID 16488)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 16522)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 4871 (class 2604 OID 16471)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5043 (class 0 OID 16498)
-- Dependencies: 224
-- Data for Name: basket_items; Type: TABLE DATA; Schema: public; Owner: grocery_user
--

COPY public.basket_items (id, product_id, quantity, user_id) FROM stdin;
\.


--
-- TOC entry 5041 (class 0 OID 16485)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: grocery_user
--

COPY public.products (id, name, description, price, category, image_url, is_alcohol) FROM stdin;
1	Oranges		0.89	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Oranges.jpg	f
2	Loose Pears		1.2	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Loose_Pears.jpg	f
3	Cherries		2.5	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Cherries.jpg	f
4	Nectarines		1.5	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Nectarines.jpg	f
5	Galia Melon		1.8	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Galia_Melon.jpg	f
6	Plums		1.6	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Plums.jpg	f
7	Easy Peelers		1.1	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Easy_Peelers.jpg	f
8	Lemons		0.6	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Lemons.jpg	f
9	Loose Mango		1.5	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Loose_Mango.jpg	f
10	Gala Apples		2	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Gala_Apples.jpg	f
11	Braeburn Apples		2	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Braeburn_Apples.jpg	f
12	Funsize Apples		1.8	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Funsize_Apples.jpg	f
13	Pink Lady Apples		2.5	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Pink_Lady_Apples.jpg	f
14	Granny Smith Apples		2	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Granny_Smith_Apples.jpg	f
15	Jazz Apples		2.3	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Jazz_Apples.jpg	f
16	Avocados Pack Of 2		1.7	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Avocados_Pack_Of_2.jpg	f
17	Loose Red Pepper		0.9	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Loose_Red_Pepper.jpg	f
18	Deluxe Piccolo Tomatoes		1.8	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Piccolo_Tomatoes.jpg	f
19	Celery		0.7	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Celery.jpg	f
20	Spring Onions		0.5	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Spring_Onions.jpg	f
21	Spinach		1	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Spinach.jpg	f
22	Garlic		0.4	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Garlic.jpg	f
23	Baby Leaf Salad		1.2	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Baby_Leaf_Salad.jpg	f
24	Ginger		0.6	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ginger.jpg	f
25	Red Onions		0.7	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Red_Onions.jpg	f
26	Cauliflower		1	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Cauliflower.jpg	f
27	Baby Corn		1.2	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Baby_Corn.jpg	f
28	Large Flat Mushrooms		1.1	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Large_Flat_Mushrooms.jpg	f
29	Carrots		0.7	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Carrots.jpg	f
30	Finger Chillies		0.8	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Finger_Chillies.jpg	f
31	Mixed Leaf Salad		1.2	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Mixed_Leaf_Salad.jpg	f
32	Tenderstem Broccoli		1.5	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Tenderstem_Broccoli.jpg	f
33	Aubergine		1	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Aubergine.jpg	f
34	Courgettes		1.3	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Courgettes.jpg	f
35	Sweet Potatoes		1.7	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Sweet_Potatoes.jpg	f
36	Potatoes		1.5	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Potatoes.jpg	f
37	Asparagus		1.8	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Asparagus.jpg	f
38	Baby Button Mushrooms		1	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Baby_Button_Mushrooms.jpg	f
39	Kale		1	Fresh Vegetables	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Kale.jpg	f
40	Vemondo Barista Oat Milk		1.39	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Barista_Oat_Milk.jpg	f
41	Vemondo Soya Drink Unsweetened		0.5	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Soya_Drink_Unsweetened.jpg	f
42	Vemondo Soya Drink Sweetened		0.99	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Soya_Drink_Sweetened.jpg	f
43	Vemondo Almond Drink Original		0.99	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Almond_Drink_Original.jpg	f
44	Vemondo Organic Almond Drink Unsweetened		0.99	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Organic_Almond_Drink_Unsweetened.jpg	f
45	Vemondo Oat Milk Unsweetened		1.09	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Oat_Milk_Unsweetened.jpg	f
46	Vemondo Vegan Sausage Rolls		1.19	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Vegan_Sausage_Rolls.jpg	f
47	Vemondo Bio Tofu		1.99	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Bio_Tofu.jpg	f
48	Vemondo Falafel		1.25	Meat Free	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Vemondo_Falafel.jpg	f
49	Birchwood British Lean Beef Steak Mince 5% Fat		3.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Lean_Beef_Steak_Mince_5__Fat.jpg	f
50	Birchwood Grass Fed British Lean Beef Steak Mince 5% Fat		3.69	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Grass_Fed_British_Lean_Beef_Steak_Mince_5__Fat.jpg	f
51	Birchwood British Reduced Fat Beef Mince 10% Fat		3.09	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Reduced_Fat_Beef_Mince_10__Fat.jpg	f
52	Birchwood British Beef Mince 18% Fat		4.19	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Beef_Mince_18__Fat.jpg	f
53	Birchwood British Beef Mince 25% Fat		2.29	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Beef_Mince_25__Fat.jpg	f
54	Birchwood Grass Fed British Reduced Fat Beef Mince 10% Fat		3.29	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Grass_Fed_British_Reduced_Fat_Beef_Mince_10__Fat.jpg	f
55	Birchwood British Beef and Pork Mince 23% Fat		3.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Beef_and_Pork_Mince_23__Fat.jpg	f
56	Birchwood British Lean Diced Beef Steak		4.19	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Lean_Diced_Beef_Steak.jpg	f
57	Birchwood 12 British Beef Meatballs		2.29	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_12_British_Beef_Meatballs.jpg	f
58	Birchwood Quarter Pounders		2.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Quarter_Pounders.jpg	f
59	Strathvale Scotch Beef Quarter Pounders		2.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Strathvale_Scotch_Beef_Quarter_Pounders.jpg	f
60	Birchwood 4 Welsh Quarter Pounders		2.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_4_Welsh_Quarter_Pounders.jpg	f
61	Birchwood Welsh Lean Diced Beef		4.19	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Welsh_Lean_Diced_Beef.jpg	f
62	Deluxe Dry Aged Aberdeen Angus Ribeye Steak		5.79	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Dry_Aged_Aberdeen_Angus_Ribeye_Steak.jpg	f
63	Strathvale Grass Fed Sirloin		5.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Strathvale_Grass_Fed_Sirloin.jpg	f
64	Birchwood 2 Beef Ribeye Steaks		9.79	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_2_Beef_Ribeye_Steaks.jpg	f
65	Birchwood British 2 Beef Sirloin Steaks		8.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_2_Beef_Sirloin_Steaks.jpg	f
66	Birchwood British 3 Beef Frying Steaks		3.69	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_3_Beef_Frying_Steaks.jpg	f
67	Birchwood British 2 Beef Rump Steaks		6.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_2_Beef_Rump_Steaks.jpg	f
68	Birchwood 2 Welsh Beef Fillet Steaks		9.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_2_Welsh_Beef_Fillet_Steaks.jpg	f
69	Birchwood 2 Welsh Beef Ribeye Steaks		9.79	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_2_Welsh_Beef_Ribeye_Steaks.jpg	f
70	Birchwood 2 Welsh Beef Sirloin Steaks		8.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_2_Welsh_Beef_Sirloin_Steaks.jpg	f
71	Birchwood Grass Fed 10oz British Beef 36-Day Matured Rump Steak		4.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Grass_Fed_10oz_British_Beef_36-Day_Matured_Rump_Steak.jpg	f
72	Birchwood Grass Fed Lean Diced British Beef		3.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Grass_Fed_Lean_Diced_British_Beef.jpg	f
73	Birchwood Grass Fed 7oz British Beef 36-Day Matured Fillet Steak		6.89	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Grass_Fed_7oz_British_Beef_36-Day_Matured_Fillet_Steak.jpg	f
74	Birchwood Grass Fed 10oz British Beef 36-Day Matured Ribeye Steak		6.39	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Grass_Fed_10oz_British_Beef_36-Day_Matured_Ribeye_Steak.jpg	f
75	Birchwood Grass Fed 10oz British Beef 36-Day Matured Sirloin Steak		5.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Grass_Fed_10oz_British_Beef_36-Day_Matured_Sirloin_Steak.jpg	f
76	Birchwood 2 Welsh Beef Rump Steaks		6.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_2_Welsh_Beef_Rump_Steaks.jpg	f
77	Strathvale Beef Frying Steak		3.69	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Strathvale_Beef_Frying_Steak.jpg	f
78	Birchwood British 4 Pork Loin Steaks		2.89	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_4_Pork_Loin_Steaks.jpg	f
79	Birchwood British 4 Pork Shoulder Steaks		3.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_4_Pork_Shoulder_Steaks.jpg	f
80	Birchwood British Pork Loin Chops		5.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Pork_Loin_Chops.jpg	f
81	Birchwood British Lean Pork Mince 5% Fat		2.59	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Lean_Pork_Mince_5__Fat.jpg	f
82	Deluxe RSPCA Dry Cured Streaky Bacon		2.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_RSPCA_Dry_Cured_Streaky_Bacon.jpg	f
83	Deluxe RSPCA Dry Cured British Back Bacon		2.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_RSPCA_Dry_Cured_British_Back_Bacon.jpg	f
84	Deluxe RSPCA Pork Sausages		2.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_RSPCA_Pork_Sausages.jpg	f
85	Deluxe Flavoured Pork Sausages		2.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Flavoured_Pork_Sausages.jpg	f
86	Deluxe Corn Fed Free Range British Whole Chicken		4.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Corn_Fed_Free_Range_British_Whole_Chicken.jpg	f
87	Birchwood Roast in Bag Garlic & Herb Chicken		4.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Roast_in_Bag_Garlic___Herb_Chicken.jpg	f
88	Birchwood Chicken Thigh Fillet		3.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Chicken_Thigh_Fillet.jpg	f
89	Birchwood Chicken Wings		1.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Chicken_Wings.jpg	f
90	Birchwood British Turkey Breast Steaks		3.49	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Turkey_Breast_Steaks.jpg	f
91	Birchwood British Lean Turkey Mince 7%		2.69	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_British_Lean_Turkey_Mince_7_.jpg	f
92	Birchwood Lean Turkey Breast Mince 2% Fat		3.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_Lean_Turkey_Breast_Mince_2__Fat.jpg	f
93	Birchwood 6 Minted Lamb Kebabs		3.99	Meat & Poultry	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Birchwood_6_Minted_Lamb_Kebabs.jpg	f
94	Lighthouse Bay 2 Cod Fillets		3.59	Fish	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Lighthouse_Bay_2_Cod_Fillets.jpg	f
95	Deluxe MSC Cod Loins		4.59	Fish	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_MSC_Cod_Loins.jpg	f
96	Deluxe Melt In The Middle Fishcakes		1.99	Fish	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Melt_In_The_Middle_Fishcakes.jpg	f
97	Ocean Sea MSC Cod Fish Fingers		1.65	Fish	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ocean_Sea_MSC_Cod_Fish_Fingers.jpg	f
98	Cheese Twist		0.8	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Cheese_Twist.jpg	f
99	Seeded Sourdough Loaf		2	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Seeded_Sourdough_Loaf.jpg	f
100	Petit Pain		0.4	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Petit_Pain.jpg	f
101	Large French Baguette		1	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Large_French_Baguette.jpg	f
102	White Crusty Roll		0.3	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/White_Crusty_Roll.jpg	f
103	Tiger Bloomer		1.5	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Tiger_Bloomer.jpg	f
104	Low GI Multiseed Cob		1.8	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Low_GI_Multiseed_Cob.jpg	f
105	Tiger Baton		1	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Tiger_Baton.jpg	f
106	Italian Style Panini Roll		1.2	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Italian_Style_Panini_Roll.jpg	f
107	Lemon Loaf Cake		2.5	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Lemon_Loaf_Cake.jpg	f
108	Pain au Double Choc with Hazelnut		1.5	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Pain_au_Double_Choc_with_Hazelnut.jpg	f
109	Jam Filled Doughnut		0.7	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Jam_Filled_Doughnut.jpg	f
110	Belgian Bun		1.2	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Belgian_Bun.jpg	f
111	Pink Iced Ring Doughnut		0.8	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Pink_Iced_Ring_Doughnut.jpg	f
112	Chocolate & Hazelnut Filled Doughnut		0.9	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chocolate___Hazelnut_Filled_Doughnut.jpg	f
113	Ultimate Chocolate Brownie		1.5	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ultimate_Chocolate_Brownie.jpg	f
114	Filled Muffins		1	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Filled_Muffins.jpg	f
115	All Butter Croissant		1	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/All_Butter_Croissant.jpg	f
116	Pastel del Nata		1	Bakery	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Pastel_del_Nata.jpg	f
117	Deluxe Somerset Cheddar Assorted		2.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Somerset_Cheddar_Assorted.jpg	f
118	Milbona Edam Slices		2.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_Edam_Slices.jpg	f
119	Deluxe Mature Blue Stilton		2.69	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Mature_Blue_Stilton.jpg	f
120	Valley Spire Welsh Mature Cheddar		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Valley_Spire_Welsh_Mature_Cheddar.jpg	f
121	Milbona Emmental Slices		2.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_Emmental_Slices.jpg	f
122	Woodcote 6 Medium Free Range Eggs		1.2	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodcote_6_Medium_Free_Range_Eggs.jpg	f
123	Woodcote 6 Large Free Range Eggs		1.4	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodcote_6_Large_Free_Range_Eggs.jpg	f
124	Woodcote 6 Very Large Free Range Eggs		1.6	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodcote_6_Very_Large_Free_Range_Eggs.jpg	f
125	Woodcote 6 Organic Eggs		2	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodcote_6_Organic_Eggs.jpg	f
126	Woodcote 12 Large Free Range Eggs		2.8	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodcote_12_Large_Free_Range_Eggs.jpg	f
127	Milbona Gouda Slices		2.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_Gouda_Slices.jpg	f
128	Deluxe Continental Cheese Assorted		2.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Continental_Cheese_Assorted.jpg	f
129	Deluxe Parmigiano Reggiano		3.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Parmigiano_Reggiano.jpg	f
130	Valley Spire Red Leicester		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Valley_Spire_Red_Leicester.jpg	f
131	Valley Spire British Mature Cheddar		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Valley_Spire_British_Mature_Cheddar.jpg	f
132	Milbona Halloumi		2.15	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_Halloumi.jpg	f
133	Woodcote 12 Welsh Medium Free Range Eggs		2.5	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodcote_12_Welsh_Medium_Free_Range_Eggs.jpg	f
134	Woodcote 12 Medium Free Range Eggs		2.5	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodcote_12_Medium_Free_Range_Eggs.jpg	f
135	Woodcote 15 Mixed Sized Free Range Eggs		3	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodcote_15_Mixed_Sized_Free_Range_Eggs.jpg	f
136	Meadow Fresh Antipasti Assorted		1.69	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Meadow_Fresh_Antipasti_Assorted.jpg	f
137	Meadow Fresh Greek Olives Assorted		1.59	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Meadow_Fresh_Greek_Olives_Assorted.jpg	f
138	Deluxe Premium Olives Assorted		1.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Premium_Olives_Assorted.jpg	f
139	Deluxe Topped Houmous Assorted		1.39	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Topped_Houmous_Assorted.jpg	f
140	Meadow Fresh Sour Cream & Chive Dip		0.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Meadow_Fresh_Sour_Cream___Chive_Dip.jpg	f
141	Meadow Fresh Smashed Avocado Assorted		0.85	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Meadow_Fresh_Smashed_Avocado_Assorted.jpg	f
142	Deluxe Premium Coleslaw		1.25	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Premium_Coleslaw.jpg	f
143	Chef Select Quiche Assorted		1.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Quiche_Assorted.jpg	f
144	Deluxe Premium Pies Assorted		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Premium_Pies_Assorted.jpg	f
145	Chef Select Mini Melton Mowbray Pork Pies		1.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Mini_Melton_Mowbray_Pork_Pies.jpg	f
146	Chef Select Classic Crust BBQ Chicken and Bacon Pizza		3.79	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Classic_Crust_BBQ_Chicken_and_Bacon_Pizza.jpg	f
147	Chef Select Stuffed Crust Cheese Feast Pizza		3.79	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Stuffed_Crust_Cheese_Feast_Pizza.jpg	f
148	Chef Select Classic Crust Meat Feast Pizza		3.79	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Classic_Crust_Meat_Feast_Pizza.jpg	f
149	Chef Select Garlic & Herb Dip		0.65	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Garlic___Herb_Dip.jpg	f
150	Chef Select Mini Garlic Pizza Bread		1.29	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Mini_Garlic_Pizza_Bread.jpg	f
151	Chef Select Hot & Spicy Mini Fillets		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Hot___Spicy_Mini_Fillets.jpg	f
152	Chef Select Southern Fried Chicken Pops		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Southern_Fried_Chicken_Pops.jpg	f
153	Deluxe Single Serve Woodfire Sourdough Assorted		2.59	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Single_Serve_Woodfire_Sourdough_Assorted.jpg	f
154	Deluxe Sourdough Spicy Chicken Arrabbiata		3.79	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Sourdough_Spicy_Chicken_Arrabbiata.jpg	f
155	Deluxe Sourdough Ham Mascarpone & Mushroom		3.79	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Sourdough_Ham_Mascarpone___Mushroom.jpg	f
156	Chef Select Cheesy Garlic Toasties		1.25	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Cheesy_Garlic_Toasties.jpg	f
157	Deluxe Premium Filled Fresh Pasta Assorted		2.19	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Premium_Filled_Fresh_Pasta_Assorted.jpg	f
158	Chef Select Tortelloni Pesto & Pine Nut		1.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Tortelloni_Pesto___Pine_Nut.jpg	f
159	Chef Select Tortelloni Ham		1.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Tortelloni_Ham.jpg	f
160	Chef Select Tortelloni Porcini Mushroom		1.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Tortelloni_Porcini_Mushroom.jpg	f
161	Chef Select Chinese Ready Meals Assorted		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Chinese_Ready_Meals_Assorted.jpg	f
162	Deluxe Premium Meal for One Assorted		3.45	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Premium_Meal_for_One_Assorted.jpg	f
163	Deluxe Premium Meal for Two Assorted		4.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Premium_Meal_for_Two_Assorted.jpg	f
164	Chef Select Ham Mushroom Tagliatelle		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Ham_Mushroom_Tagliatelle.jpg	f
165	Chef Select Italian Spaghetti		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Italian_Spaghetti.jpg	f
166	Chef Select British Potato Layered Pies Assorted		2.79	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_British_Potato_Layered_Pies_Assorted.jpg	f
167	Chef Select Chicken Korma with Rice		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Chicken_Korma_with_Rice.jpg	f
168	Chef Select Thai Chicken Ready Meals Assorted		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Chef_Select_Thai_Chicken_Ready_Meals_Assorted.jpg	f
169	Milbona Cr??me Caramel		1.25	Chilled		f
170	Milbona Twin Sponge Pudding Assorted		1.75	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_Twin_Sponge_Pudding_Assorted.jpg	f
171	Milbona Strawberry Trifles		1.39	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_Strawberry_Trifles.jpg	f
172	Milbona Family Italian Dessert Assorted		2.69	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_Family_Italian_Dessert_Assorted.jpg	f
173	Milbona High Protein Pudding ??? Chocolate		0.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_High_Protein_Pudding___Chocolate.jpg	f
174	Milbona High Protein Pudding Assorted ??? Vanilla		0.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_High_Protein_Pudding_Assorted___Vanilla.jpg	f
175	Milbona Desserts Assorted		1.29	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Milbona_Desserts_Assorted.jpg	f
176	Deluxe Freshly Squeezed Orange Juice With Bits		2.39	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Freshly_Squeezed_Orange_Juice_With_Bits.jpg	f
177	Naturis Smoothies Assorted Flavours		1.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Naturis_Smoothies_Assorted_Flavours.jpg	f
178	Naturis Pure Squeezed Orange Juice Smooth 2		1.69	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Naturis_Pure_Squeezed_Orange_Juice_Smooth_2.jpg	f
179	Naturis Smoothies Assorted		1.59	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Naturis_Smoothies_Assorted.jpg	f
180	Naturis Pure Squeezed Orange Juice Bits		1.69	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Naturis_Pure_Squeezed_Orange_Juice_Bits.jpg	f
181	Naturis Kids Smoothies Assorted		1.99	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Naturis_Kids_Smoothies_Assorted.jpg	f
182	Deluxe Freshly Squeezed Orange Juice Smooth		2.49	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Freshly_Squeezed_Orange_Juice_Smooth.jpg	f
183	Naturis Tropical Juice		1.69	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Naturis_Tropical_Juice.jpg	f
184	Naturis Apple & Mango Juice		1.69	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Naturis_Apple___Mango_Juice.jpg	f
185	Naturis Pure Pressed Apply Juice Cloudy		1.69	Chilled	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Naturis_Pure_Pressed_Apply_Juice_Cloudy.jpg	f
186	Freshona Frozen Fruit Mixes Assorted		1.89	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Freshona_Frozen_Fruit_Mixes_Assorted.jpg	f
187	Freshona Raspberries/Strawberries		1.89	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Freshona_Raspberries_Strawberries.jpg	f
188	Freshona Fruit Smoothie Mixes Assorted		1.69	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Freshona_Fruit_Smoothie_Mixes_Assorted.jpg	f
189	Freshona Pineapple Chunks/Cherries/Mango		1.99	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Freshona_Pineapple_Chunks_Cherries_Mango.jpg	f
190	Ocean Sea Fish in Sauce Assorted		1.79	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ocean_Sea_Fish_in_Sauce_Assorted.jpg	f
191	Ocean Sea Breaded Wholetail Scampi		2.49	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ocean_Sea_Breaded_Wholetail_Scampi.jpg	f
192	Ocean Sea King Prawns		4.99	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ocean_Sea_King_Prawns.jpg	f
193	Trattoria Alfredo Margherita Pizza 3 Pack		4.15	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Trattoria_Alfredo_Margherita_Pizza_3_Pack.jpg	f
194	Simply Pepperoni Pizza		1.95	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Simply_Pepperoni_Pizza.jpg	f
195	Double Ice Cream Caramel Sticks		3.29	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Double_Ice_Cream_Caramel_Sticks.jpg	f
196	Rocket Lollies		1.49	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Rocket_Lollies.jpg	f
197	Ice Cream Bars		2.99	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ice_Cream_Bars.jpg	f
198	Mini Ice Creams		2.99	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Mini_Ice_Creams.jpg	f
199	Bon Gelati Ice Cream Cones 6 Pack		1.99	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Bon_Gelati_Ice_Cream_Cones_6_Pack.jpg	f
200	Gelatelli Classic Ice Cream Lollies		2.65	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Gelatelli_Classic_Ice_Cream_Lollies.jpg	f
201	Bon Gelati Classic Almond Ice Cream		2.65	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Bon_Gelati_Classic_Almond_Ice_Cream.jpg	f
202	Exotic Fruit Ice		1.35	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Exotic_Fruit_Ice.jpg	f
203	Gelatelli Real Fruit Splits		1.19	Frozen Foods	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Gelatelli_Real_Fruit_Splits.jpg	f
204	Maribel Premium Strawberry Conserve		1.85	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Maribel_Premium_Strawberry_Conserve.jpg	f
205	Maribel Premium Blueberry Conserve		1.85	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Maribel_Premium_Blueberry_Conserve.jpg	f
206	Maribel Orange Marmalade		0.99	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Maribel_Orange_Marmalade.jpg	f
207	Maribel Peanut Butter		1.25	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Maribel_Peanut_Butter.jpg	f
208	Mister Choc Biscuit Spread		1.99	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Mister_Choc_Biscuit_Spread.jpg	f
209	Choco Nussa Chocolate Hazelnut Spread		1.69	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Choco_Nussa_Chocolate_Hazelnut_Spread.jpg	f
210	Mister Choc Chocolate Duo Spread		1.59	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Mister_Choc_Chocolate_Duo_Spread.jpg	f
211	Deluxe Manuka Honey		4.89	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Manuka_Honey.jpg	f
212	Deluxe Speciality Honeys Assorted		2.69	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Speciality_Honeys_Assorted.jpg	f
213	Highgate Fayre Clear Honey		1.45	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Highgate_Fayre_Clear_Honey.jpg	f
214	Highgate Fayre Squeezy Honey		1.09	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Highgate_Fayre_Squeezy_Honey.jpg	f
215	Highgate Fayre Squeezy Clear Honey		2.25	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Highgate_Fayre_Squeezy_Clear_Honey.jpg	f
216	Baresa Spaghetti		0.75	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Baresa_Spaghetti.jpg	f
217	Baresa Fusilli		1.29	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Baresa_Fusilli.jpg	f
218	Taste of Basmati Rice		1.75	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Taste_of_Basmati_Rice.jpg	f
219	Taste of Microwaveable Rice Assorted		0.42	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Taste_of_Microwaveable_Rice_Assorted.jpg	f
220	Taste of China Medium Egg Noodles		0.95	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Taste_of_China_Medium_Egg_Noodles.jpg	f
221	Knightsbridge Peppermint Tea		0.85	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Knightsbridge_Peppermint_Tea.jpg	f
222	Deluxe Fairtrade Earl Grey Tea		0.95	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Fairtrade_Earl_Grey_Tea.jpg	f
223	Knightsbridge Green Tea Assorted		0.59	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Knightsbridge_Green_Tea_Assorted.jpg	f
224	Knightsbridge Red Label Tea 240 pack		2.19	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Knightsbridge_Red_Label_Tea_240_pack.jpg	f
225	Deluxe Single Origin Freeze Dried Coffee Assorted		2.49	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Single_Origin_Freeze_Dried_Coffee_Assorted.jpg	f
226	Bellarom Gold Instant Coffee RFA		2.25	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Bellarom_Gold_Instant_Coffee_RFA.jpg	f
227	Bellarom Coffee Beans Assorted		3.99	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Bellarom_Coffee_Beans_Assorted.jpg	f
228	Deluxe Espresso Pods Colombia		2.09	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Deluxe_Espresso_Pods_Colombia.jpg	f
229	Bellarom Gold Blend Ground Coffee		4.29	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Bellarom_Gold_Blend_Ground_Coffee.jpg	f
230	Bellarom French & Italian Ground Coffee		1.89	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Bellarom_French___Italian_Ground_Coffee.jpg	f
231	Bellarom Barista Instant Coffee		2.59	Food Cupboard	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Bellarom_Barista_Instant_Coffee.jpg	f
232	Perlenbacher Pils Alcohol-Free		2.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Perlenbacher_Pils_Alcohol-Free.jpg	t
233	Perlenbacher Pilsner Lager		1.29	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Perlenbacher_Pilsner_Lager.jpg	t
234	Stella Artois Premium Lager		5.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Stella_Artois_Premium_Lager.jpg	t
235	Stella Artois		9.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Stella_Artois.jpg	t
236	Carlsberg Carling Lager		4.19	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Carlsberg_Carling_Lager.jpg	t
237	S??tma Strawberry & Lime Cider		1.79	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/S_tma_Strawberry___Lime_Cider.jpg	t
238	S??tma Swedish Mixed Fruit Cider		1.79	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/S_tma_Swedish_Mixed_Fruit_Cider.jpg	t
239	Woodgate Cloudy Apple Cider		2.89	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodgate_Cloudy_Apple_Cider.jpg	t
240	Woodgate Apple Ros?? Cider		3.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodgate_Apple_Ros__Cider.jpg	t
241	Carling Lager		13.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Carling_Lager.jpg	t
242	Corona Extra		10.49	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Corona_Extra.jpg	t
243	San Miguel 5%		11.49	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/San_Miguel_5_.jpg	t
244	Corona		16.49	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Corona.jpg	t
245	Guinness Draught Stout		5.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Guinness_Draught_Stout.jpg	t
246	S??tma Mixed Fruit Cider 4%		3.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/S_tma_Mixed_Fruit_Cider_4_.jpg	t
247	Woodgate Dark Fruit Cider		3.59	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodgate_Dark_Fruit_Cider.jpg	t
248	Woodgate Pear Cider		1.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodgate_Pear_Cider.jpg	t
249	Woodgate Somerset Scrumpy Apple Cider		3.49	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodgate_Somerset_Scrumpy_Apple_Cider.jpg	t
250	Woodgate Dry Amber Cider		1.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodgate_Dry_Amber_Cider.jpg	t
251	Woodgate Premium West Country Vintage Cider		1.49	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Woodgate_Premium_West_Country_Vintage_Cider.jpg	t
252	Finton's Special London Dry Gin		11.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Finton_s_Special_London_Dry_Gin.jpg	t
253	Hortus Artisan London Dry Gin		15.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Hortus_Artisan_London_Dry_Gin.jpg	t
254	Ignis French Grain Vodka		16.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ignis_French_Grain_Vodka.jpg	t
255	Finton's Pink Gin		13.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Finton_s_Pink_Gin.jpg	t
256	Ignis Raspberry French Grain Vodka		16.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ignis_Raspberry_French_Grain_Vodka.jpg	t
257	Ben Bracken Speyside Single Malt Scotch Whisky		17.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ben_Bracken_Speyside_Single_Malt_Scotch_Whisky.jpg	t
258	Ben Bracken Islay Single Malt Scotch Whisky		17.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ben_Bracken_Islay_Single_Malt_Scotch_Whisky.jpg	t
259	Ben Bracken Highland Single Malt Scotch Whisky		17.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Ben_Bracken_Highland_Single_Malt_Scotch_Whisky.jpg	t
260	Abrachan Blended Peated Malt Whisky		17.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Abrachan_Blended_Peated_Malt_Whisky.jpg	t
261	Reverie Finest French Brandy XO 2		16.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Reverie_Finest_French_Brandy_XO_2.jpg	t
262	Hortus Rhubarb & Ginger Gin Liqueur		8.49	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Hortus_Rhubarb___Ginger_Gin_Liqueur.jpg	t
263	Hortus Rhubarb & Ginger Gin		1.29	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Hortus_Rhubarb___Ginger_Gin.jpg	t
264	Finton's Special London Dry Pink Gin & Tonic		0.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Finton_s_Special_London_Dry_Pink_Gin___Tonic.jpg	t
265	Hortus Premium Pink Gin & Diet Lemonade 5%		1.29	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Hortus_Premium_Pink_Gin___Diet_Lemonade_5_.jpg	t
266	Western Gold Bourbon Whiskey		14.49	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Western_Gold_Bourbon_Whiskey.jpg	t
267	Libert?? White Rum		10.49	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Libert__White_Rum.jpg	t
268	Balmuir 3-Year Blended Scotch Whisky		12.89	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Balmuir_3-Year_Blended_Scotch_Whisky.jpg	t
269	Balmuir Blended Scotch Whisky 1L		16.89	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Balmuir_Blended_Scotch_Whisky_1L.jpg	t
270	Single Grain Scotch Whisky 3 Years		12.99	Alcohol	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Single_Grain_Scotch_Whisky_3_Years.jpg	t
271	W5 Sponge Cloths		1.79	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Sponge_Cloths.jpg	f
272	W5 All Purpose Cleaner assorted		0.95	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_All_Purpose_Cleaner_assorted.jpg	f
273	W5 Sponge Scourers		0.75	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Sponge_Scourers.jpg	f
274	W5 Limescale / Degreaser Cleaner Assorted		1.29	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Limescale___Degreaser_Cleaner_Assorted.jpg	f
275	W5 Dishcloths		1.49	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Dishcloths.jpg	f
276	W5 Thick Bleach Assorted		0.65	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Thick_Bleach_Assorted.jpg	f
277	W5 All Purpose Cleaner		0.85	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_All_Purpose_Cleaner.jpg	f
278	W5 Dishwasher Cleaning Liquid		1.99	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Dishwasher_Cleaning_Liquid.jpg	f
279	W5 Toilet Cleaner		0.45	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Toilet_Cleaner.jpg	f
280	Formil Washing Powder Non Bio 40 Washes		3.75	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Formil_Washing_Powder_Non_Bio_40_Washes.jpg	f
281	Formil 3 in 1 Liquidtabs Non Bio / Lavender		3.59	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Formil_3_in_1_Liquidtabs_Non_Bio___Lavender.jpg	f
282	Formil Oxi Stain Remover Assorted		2.75	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Formil_Oxi_Stain_Remover_Assorted.jpg	f
283	Formil Laundry Gel Assorted		2.89	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Formil_Laundry_Gel_Assorted.jpg	f
284	W5 Air Freshener Assorted		0.65	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Air_Freshener_Assorted.jpg	f
285	W5 Gel Air Freshener		0.69	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Gel_Air_Freshener.jpg	f
286	W5 Liquid Airfreshener Assorted		1.99	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Liquid_Airfreshener_Assorted.jpg	f
287	W5 Plug In Airfreshener refill 2 pack		3.99	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Plug_In_Airfreshener_refill_2_pack.jpg	f
288	Reed Diffuser with Balls Assorted		2.79	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Reed_Diffuser_with_Balls_Assorted.jpg	f
289	W5 Shower / Window & Glass Cleaner Assorted		0.85	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Shower___Window___Glass_Cleaner_Assorted.jpg	f
290	W5 Antibacterial Multi-Action Cleaner		0.85	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Antibacterial_Multi-Action_Cleaner.jpg	f
291	W5 Furniture Polish Assorted		0.85	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Furniture_Polish_Assorted.jpg	f
292	W5 Dishwasher Tablets Lemon		4.09	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Dishwasher_Tablets_Lemon.jpg	f
293	W5 Rinse Aid		2.39	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Rinse_Aid.jpg	f
294	W5 Dishwasher Salt		1.69	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/W5_Dishwasher_Salt.jpg	f
295	Luxury Collection Reed Diffuser		3.15	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Luxury_Collection_Reed_Diffuser.jpg	f
296	Purio Heavy Duty Refuse Sacks		1.99	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Purio_Heavy_Duty_Refuse_Sacks.jpg	f
297	Purio Black Drawstring Refuse Sacks 40		3.29	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Purio_Black_Drawstring_Refuse_Sacks_40.jpg	f
298	Purio Recycle Refuse Sack TieTop		2.09	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Purio_Recycle_Refuse_Sack_TieTop.jpg	f
299	Purio Biodegradable Caddy Liners		1.99	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Purio_Biodegradable_Caddy_Liners.jpg	f
300	Aromata Kitchen Foil		3.59	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Aromata_Kitchen_Foil.jpg	f
301	Aromata Food & Freezer Bags		1.39	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Aromata_Food___Freezer_Bags.jpg	f
302	Aromata Zip Seal Freezer Bags		0.85	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Aromata_Zip_Seal_Freezer_Bags.jpg	f
303	Aromata Sandwich Bags		1.19	Cleaning House	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Aromata_Sandwich_Bags.jpg	f
304	Coshida Premium Cat Food, assorted		0.37	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Coshida_Premium_Cat_Food__assorted.jpg	f
305	Coshida Selection Cat Food Assorted		0.55	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Coshida_Selection_Cat_Food_Assorted.jpg	f
306	Coshida Super Premium Dry Cat Food Assorted		2.69	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Coshida_Super_Premium_Dry_Cat_Food_Assorted.jpg	f
307	Coshida Premium Cat Food Chunks		3.99	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Coshida_Premium_Cat_Food_Chunks.jpg	f
308	Coshida Cat Food Pouches Assorted		2.55	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Coshida_Cat_Food_Pouches_Assorted.jpg	f
309	Orlando Premium Dog Food, assorted		0.65	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Premium_Dog_Food__assorted.jpg	f
310	Orlando Super Premium Dog Food Assorted		0.49	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Super_Premium_Dog_Food_Assorted.jpg	f
311	Orlando Dog Food Can		0.65	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Dog_Food_Can.jpg	f
312	Orlando Premium Moist & Meaty Complete		4.99	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Premium_Moist___Meaty_Complete.jpg	f
313	Orlando Natural Dog Food Assorted		3.49	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Natural_Dog_Food_Assorted.jpg	f
314	Coshida Cat Chew Sticks Assorted		0.99	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Coshida_Cat_Chew_Sticks_Assorted.jpg	f
315	Orlando Dog Snacks Assorted		0.75	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Dog_Snacks_Assorted.jpg	f
316	Orlando Meaty Strips for Dogs Assorted		0.49	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Meaty_Strips_for_Dogs_Assorted.jpg	f
317	Orlando Premium Dog Snacks Pig Ears / Mini		2.59	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Premium_Dog_Snacks_Pig_Ears___Mini.jpg	f
318	Orlando Dog Dental Sticks		0.65	Pet Care	https://seleniumwebsites.fra1.digitaloceanspaces.com/grocery/Orlando_Dog_Dental_Sticks.jpg	f
\.


--
-- TOC entry 5045 (class 0 OID 16519)
-- Dependencies: 226
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: grocery_user
--

COPY public.reviews (id, product_id, author, rating, comment) FROM stdin;
1	1	John	5	These oranges are the sweetest I've ever tasted. Highly recommend!
2	1	Emily	4	The oranges are juicy and flavorful, but a bit pricey.
3	1	David	3	The oranges are okay, but not as fresh as I expected.
4	1	Sarah	5	I love these oranges! They're perfect for snacking and adding to salads.
5	1	Michael	2	The oranges were not as good as I hoped. They were sour and not very juicy.
6	2	John Doe	4	These pears are great for snacking on. They're not too soft and not too hard, just right.
7	2	Jane Smith	5	I love these loose pears! They're so juicy and flavorful. I can't get enough of them.
8	2	Bob Johnson	3	The pears are okay, but they could be a bit fresher. I wouldn't mind trying them again, though.
9	2	Sarah Lee	5	These loose pears are the best I've ever had. They're so sweet and delicious. I can't wait to buy them again.
10	3	John	5	These cherries are the sweetest I've ever tasted. Highly recommend!
11	3	Emily	4	The cherries were fresh and delicious, but a few were slightly underripe.
12	3	David	5	I love using these cherries in my baking. They hold their shape and add a great flavor.
13	3	Sarah	3	The cherries were okay, but not as juicy as I had hoped.
14	3	Michael	5	These cherries are perfect for snacking on or adding to salads. Highly recommend!
15	4	John	5	These nectarines are the sweetest I've ever tasted. Highly recommend!
16	4	Emily	4	The nectarines were ripe and juicy, but I wish they were a bit bigger.
17	4	David	3	The nectarines were okay, but not as flavorful as I had hoped.
18	4	Sarah	5	I love the convenience of buying nectarines already packaged. Makes my life so much easier!
19	4	Michael	2	The nectarines were not as fresh as I expected. They were a bit mushy
20	5	John Doe	5	This Galia Melon is the sweetest and juiciest I've ever had. Highly recommend!
21	5	Jane Smith	4	The Galia Melon was very tasty and had a nice balance of sweetness and acidity. It was a bit on the softer side, but still enjoyable.
22	5	Michael Brown	3	The Galia Melon was okay. It wasn't as sweet as I had hoped, but it had a nice texture.
23	5	Emily Davis	2	I was disappointed with the Galia Melon. It was very bland and lacked flavor.
24	6	John	5	These plums are the sweetest I've ever tasted. Highly recommend!
25	6	Emily	4	The plums were fresh and juicy, but a bit tart for my taste.
26	6	David	5	I love plums and these did not disappoint. Perfect for snacking or adding to salads.
27	6	Sarah	3	The plums were okay, but not as flavorful as I had hoped.
28	6	Michael	5	These plums are the perfect addition to my morning yogurt bowl. Highly recommend!
29	7	John	5	These Easy Peelers are a game changer! I used to struggle with peeling fruits and vegetables, but now it's a breeze. Highly recommend!
30	7	Emily	4	I love using Easy Peelers for my daily meals. They make peeling so much easier and faster. The only downside is that they can be a bit expensive.
31	7	Michael	5	I've tried other peelers in the past, but nothing compares to Easy Peelers. They're durable, easy to use, and make my life so much easier in the kitchen.
32	7	Sarah	3	Easy Peelers are a good product, but I find them a bit difficult
33	8	John	5	These lemons are always fresh and juicy. I use them in all my recipes.
34	8	Emily	4	I love using lemons in my cooking, but sometimes they can be a bit pricey. Overall, they're worth it.
35	8	David	3	The lemons I bought were okay, but not as fresh as I would have liked. I might try a different brand next time.
36	8	Sarah	5	I use lemons in my daily detox drink and these are the best I've found. They're always plump and juicy.
37	9	John	5	The Loose Mango is the best mango I've ever tasted. It's sweet, juicy, and has just the right amount of tartness.
38	9	Jane	4	I really enjoyed the Loose Mango. It was very flavorful and had a great texture. The only downside was that it was a bit expensive.
39	9	Mike	3	The Loose Mango was okay. It wasn't the best mango I've had, but it wasn't bad either. The flavor was a bit bland and it wasn't as juicy as I would have liked.
40	9	Emily	5	I absolutely love the Loose Mango. It's my go
41	10	John	5	These Gala Apples are the best I've ever tasted. They are sweet and crisp, and perfect for snacking or adding to salads.
42	10	Emily	4	I really enjoy Gala Apples. They are a great snack and I love their sweet flavor. The only downside is that they can get a little mushy if not eaten right away.
43	10	David	5	Gala Apples are my favorite! They are always juicy and flavorful, and I love their crisp texture. I highly recommend them.
44	10	Sarah	3	The Gala Apples were okay. They were a bit tart for my taste, but they were still good for snacking. I
45	11	John	5	These Braeburn Apples are the best I've ever tasted. They are crisp, juicy, and have a perfect balance of sweetness and tartness.
46	11	Emily	4	I really enjoy Braeburn Apples. They are a great snack and are perfect for adding to salads or baking in desserts.
47	11	David	3	Braeburn Apples are okay. They are not my favorite, but they are still a good choice for snacking or cooking.
48	11	Sarah	5	I love Braeburn Apples. They are my go-to apple for snacking and I think they are the best for making applesauce.
49	12	John	5	These funsize apples are perfect for snacking on the go. They're small enough to fit in my pocket and the variety of flavors keeps things interesting.
50	12	Emily	4	I love the convenience of these funsize apples, but I wish they were a little cheaper. They're still a great snack option though.
51	12	Mike	5	These funsize apples are a game changer. They're the perfect size for a quick snack and the different flavors keep things interesting. Highly recommend!
52	12	Sarah	3	The funsize apples are a fun concept, but I found the quality to be a bit lacking. Some of the apples were bruised
53	13	John Doe	5	These apples are the best I've ever tasted. They are crisp, juicy, and have a perfect balance of sweetness and tartness.
54	13	Jane Smith	4	I really enjoy Pink Lady Apples. They are a great snack and I love their sweet and tangy flavor.
55	13	Mike Johnson	3	The Pink Lady Apples are okay. They are not as sweet as I would like, but they are still a decent snack.
56	13	Emily Davis	5	I love Pink Lady Apples. They are my favorite type of apple and I always look forward to their season.
57	14	John Doe	5	These apples are always crisp and juicy, perfect for snacking or adding to salads.
58	14	Jane Smith	4	I love the tart flavor of Granny Smith apples, they're great for baking and make a delicious pie.
59	14	Mary Johnson	3	The apples were a bit smaller than I expected, but they were still tasty and fresh.
60	14	David Lee	5	These are my favorite apples, they're perfect for eating raw or using in recipes that call for a tart flavor.
61	14	Emily Davis	2	The apples were
62	15	John	5	These Jazz Apples are the best I've ever tasted. They're sweet and juicy, and the unique flavor is a delightful surprise.
63	15	Emily	4	I really enjoyed the Jazz Apples. They have a nice crunch and a sweet, tangy flavor that I haven't experienced in other apples.
64	15	David	3	The Jazz Apples were okay. They were a bit tart for my taste, but they had a nice texture and were a good snack.
65	15	Sarah	5	I love Jazz Apples! They're my favorite apple variety. They're crisp, sweet, and have a unique flavor that I can't get enough of.
66	16	John	5	These avocados are always ripe and perfect for my morning toast.
67	16	Jane	4	I love the convenience of having two avocados at once, it makes my meal prep so much easier.
68	16	Mike	3	The avocados were okay, but not as fresh as I would have liked.
69	16	Emily	5	These avocados are always so creamy and delicious, I can't get enough of them!
70	16	David	2	I was disappointed with the quality of these avocados, they were overripe and not very tasty.
71	17	John	5	This is the best red pepper I've ever had. It's so flavorful and adds a great kick to any dish.
72	17	Sarah	4	I really like this red pepper. It's not too spicy and adds a nice depth of flavor to my meals.
73	17	Michael	3	The red pepper is okay. It's not the best I've had, but it's not bad either. It adds a little bit of heat to my food.
74	17	Emily	5	I love this red pepper! It's perfect for adding some heat to my dishes without being too overpowering.
75	18	John Doe	5	These are the best piccolo tomatoes I've ever had. They are so fresh and flavorful.
76	18	Jane Smith	4	I really enjoy using these piccolo tomatoes in my salads. They are small enough to be bite-sized and add a nice pop of color.
77	18	Michael Johnson	3	The Deluxe Piccolo Tomatoes are okay. They are a bit pricey for what they are, but they do add a nice touch to my dishes.
78	18	Emily Davis	5	I love using these piccolo tomatoes in my cooking. They are so versatile and add a burst of flavor to any dish.
79	19	John	5	I love celery! It's a great snack and it's really healthy for you.
80	19	Jane	4	Celery is a good addition to any salad or sandwich. It's a bit bland on its own, but it's very versatile.
81	19	Mike	3	Celery is okay, but it's not my favorite vegetable. It's a bit too crunchy for my taste.
82	19	Emily	5	Celery is a great way to add some crunch to any dish. It's also really low in calories, so it's perfect for anyone watching their weight.
83	20	John	5	These spring onions are the freshest I've ever had. They're perfect for adding a little zing to any dish.
84	20	Emily	4	I love using spring onions in my cooking. They add a nice flavor and texture to my dishes.
85	20	Michael	3	The spring onions were okay. They didn't have as much flavor as I was hoping for.
86	20	Sarah	5	I'm a big fan of spring onions. They're a great addition to any meal and these ones are top-notch.
87	20	David	2	The spring
88	21	John	5	I love spinach! It's a great source of iron and it's so versatile. I add it to my smoothies, salads, and even my pasta dishes.
89	21	Emily	4	Spinach is a great addition to any meal. It's low in calories and high in nutrients. I usually saut???? it with garlic and serve it as a side dish.
90	21	David	3	Spinach is okay. It's not my favorite vegetable, but it's definitely better than some others. I usually just steam it and eat it with a little bit of salt and pepper.
91	21	Sarah	5	Spinach is my go-to vegetable
92	22	John	5	I love using garlic in my cooking. It adds so much flavor to my dishes.
93	22	Emily	4	Garlic is a great addition to any meal. It's also great for your health.
94	22	David	3	Garlic can be overpowering if you use too much. I like to use it sparingly.
95	22	Sarah	5	Garlic is a staple in my kitchen. I use it in almost everything I cook.
96	22	Michael	2	I don't really like the taste of garlic. It's too strong for my liking
97	23	John	5	This baby leaf salad is so fresh and tasty. It's perfect for a light lunch or dinner. Highly recommend!
98	23	Emily	4	I love adding baby leaf salad to my meals. It's a great way to add some greens to my diet and it's not too overpowering in flavor.
99	23	David	3	The baby leaf salad is okay. It's not the best I've had, but it's not the worst. It could use a bit more flavor.
100	23	Sarah	5	This baby leaf salad is the best! It's so crisp and fresh. I love adding it to my salads or eating it as a side dish
101	24	John	5	Ginger is a great product. It has helped me with my digestion and I feel more energized throughout the day.
102	24	Emily	4	I like using ginger in my cooking. It adds a nice flavor to my dishes and it's also good for your health.
103	24	David	3	Ginger is a versatile ingredient. I use it in my tea, smoothies, and even in my workouts. It's a great natural remedy for nausea and motion sickness.
104	24	Sarah	5	I love ginger! It's a great natural remedy for colds and flu. I always keep some in my pantry.
105	25	John	5	These red onions are the best I've ever tasted. They are sweet and mild, and they add a great flavor to any dish.
106	25	Emily	4	I really like red onions. They are a great addition to salads and sandwiches. The only downside is that they can make me cry when I chop them.
107	25	David	3	Red onions are okay. They don't have much flavor, but they are good for adding color to a dish.
943	243	John	4	Great beer for a hot day. Refreshing and light.
108	25	Sarah	5	I love red onions. They are sweet and add a great flavor to any dish. I use them in everything from salads to stir-fries.
109	26	John	5	I love cauliflower! It's a great source of vitamins and minerals, and it's very versatile in the kitchen. I use it in salads, stir-fries, and even as a pizza crust.
110	26	Sarah	4	Cauliflower is a healthy vegetable that I enjoy eating. It's low in calories and high in fiber, which makes it a great addition to any diet. I like to roast it with some garlic and herbs for a tasty side dish.
111	26	Michael	3	Cauliflower is okay, I guess. It's not my favorite vegetable, but it's not bad. I usually just steam it and add some salt and pepper.
112	27	John	5	I love baby corn! It's a great snack and a healthy addition to any meal. Highly recommend!
113	27	Emily	4	Baby corn is a tasty and versatile vegetable. It's great in stir-fries, salads, and as a snack on its own. Highly recommend!
114	27	David	3	Baby corn is a decent vegetable, but it's not my favorite. It's a bit bland on its own, but it's good in stir-fries and other dishes. Not bad, but not great.
115	27	Sarah	5	Baby corn is one of my favorite vegetables! It's so versatile and delicious. High
116	28	John	5	These mushrooms are perfect for grilling and add a great flavor to any dish.
117	28	Sarah	4	I love using these mushrooms in my stir-fry recipes. They cook quickly and have a great texture.
118	28	Michael	3	These mushrooms are a bit pricey, but they are worth it for the quality.
119	28	Emily	5	I've tried many different types of mushrooms, but these are by far my favorite. They have a great taste and are perfect for saut????ing.
120	28	David	2	These mushrooms were not as fresh
121	29	John	5	These carrots are always fresh and delicious. I use them in all my recipes.
122	29	Emily	4	I love the crunch of these carrots. They are perfect for snacking and add a great texture to salads.
123	29	David	3	The carrots are okay. They are not the best I've had, but they are not the worst either.
124	29	Sarah	5	These carrots are the best I've ever had. They are so sweet and tender. I can't get enough of them.
125	29	Michael	2	I was disappointed
126	30	John Doe	5	These Finger Chillies are amazing! They add a great kick to any dish I make. Highly recommend!
127	30	Jane Smith	4	I love using Finger Chillies in my cooking. They are so convenient and add just the right amount of heat.
128	30	Mike Johnson	3	The Finger Chillies are okay. They do add some heat to my food, but I find them a bit too spicy for my taste.
129	30	Emily Davis	5	I'm a huge fan of Finger Chillies. They are the perfect way to add some heat to my meals without having to chop up fresh chilies.
130	31	John	5	This mixed leaf salad is the best I've ever had. The variety of greens is perfect and the dressing is just right.
131	31	Jane	4	I really enjoy this mixed leaf salad. It's a great addition to any meal and the different greens add a nice variety of flavors.
132	31	Mike	3	The mixed leaf salad is okay. It's not the best I've had, but it's not bad either. The dressing could be a bit better though.
133	31	Emily	5	I love this mixed leaf salad. It's so fresh and the different greens make it interesting. The dressing is perfect and I always look forward to having it.
134	32	John	5	I love Tenderstem Broccoli! It's so versatile and healthy. I use it in stir-fries, salads, and even as a pizza topping. Highly recommend!
135	32	Emily	4	Tenderstem Broccoli is a great alternative to regular broccoli. It's sweeter and more tender, which makes it a hit with my kids. I usually steam it and serve it with a little bit of butter and lemon juice.
136	32	David	3	I'm not a big fan of Tenderstem Broccoli. It's a bit too soft for my taste and doesn't have the same crunch as regular broccoli. I prefer to stick with the traditional variety.
137	33	John Doe	5	I absolutely love Aubergine! It's my go-to product for all my needs.
138	33	Jane Smith	4	Aubergine is a great product, but it could use some improvements in the user interface.
139	33	Mike Johnson	3	Aubergine is okay, but there are better products out there.
140	33	Sarah Lee	5	I've been using Aubergine for years and it's never let me down. Highly recommend!
141	33	David Brown	2	Aubergine didn't meet my expectations. I expected more from a
142	34	John Doe	5	These courgettes are the best I've ever had. They are fresh, crisp and full of flavor. Highly recommend!
143	34	Jane Smith	4	I really enjoyed these courgettes. They were a bit more expensive than other brands, but they were definitely worth it. Great quality!
144	34	Mary Johnson	3	The courgettes were okay. They were a bit bland and not as fresh as I would have liked. Not bad, but not great.
145	34	David Brown	2	I was disappointed with these courgettes. They were not as crisp as I had hoped and lacked flavor. I won't be buying these again.
146	35	John	5	I love sweet potatoes! They are so versatile and delicious. I use them in both sweet and savory dishes.
147	35	Emily	4	Sweet potatoes are a great alternative to regular potatoes. They are healthier and have a unique flavor.
148	35	David	3	Sweet potatoes are okay. They are not my favorite but they are a good source of vitamins and minerals.
149	35	Sarah	5	I can't get enough of sweet potatoes! They are my go-to side dish and I love them in casseroles and soups.
150	35	Michael	2	
151	36	John	5	I love potatoes! They are so versatile and can be cooked in so many different ways.
152	36	Jane	4	Potatoes are a great source of carbohydrates and fiber. They also have a mild flavor that pairs well with many different dishes.
153	36	Mike	3	While potatoes are a staple in many diets, they are also high in carbohydrates and can cause blood sugar spikes for some people.
154	36	Emily	5	Potatoes are a delicious and filling food that can be enjoyed in many different ways. They are also relatively inexpensive and easy to prepare.
155	37	John	5	I love asparagus! It's a great source of fiber and nutrients. I always make sure to include it in my diet.
156	37	Emily	4	Asparagus is a delicious vegetable. I like to grill it with some olive oil and lemon juice. It's a bit pricey, but it's worth it.
157	37	David	3	Asparagus is okay. It's not my favorite vegetable, but it's healthy. I prefer it steamed or roasted.
158	37	Sarah	5	Asparagus is my go-to vegetable. I love the crispiness and the slightly bitter taste. I usually eat it with
159	38	John	5	These mushrooms are perfect for saut????ing and add a great flavor to any dish.
160	38	Emily	4	I love using baby button mushrooms in my stir-fries. They cook quickly and have a great texture.
161	38	David	3	The baby button mushrooms were fresh and tasty, but I wish they were a bit bigger.
162	38	Sarah	5	These mushrooms are perfect for stuffing and baking. They have a great meaty texture and flavor.
163	38	Michael	2	I was disappointed with the baby button mushrooms. They were small and had
164	39	John	5	Kale is a great source of vitamins and minerals. It's also low in calories and high in fiber, making it a great addition to any diet.
165	39	Jane	4	I love adding kale to my smoothies. It's a great way to get some extra greens in my diet.
166	39	Mike	3	Kale can be a bit tough to chew, but it's definitely a healthy vegetable. I like to saut???? it with some garlic and olive oil.
167	39	Emily	5	Kale chips are my favorite snack. They're crunchy, salty, and so good for you.
168	40	John	5	This oat milk is perfect for my morning coffee. It froths up really well and has a great taste.
169	40	Emily	4	I like using this oat milk in my smoothies. It's creamy and has a nice texture.
170	40	David	3	The oat milk is okay. It's not the best I've tried, but it's not bad either.
171	40	Sarah	5	I'm impressed with the quality of this oat milk. It's perfect for making lattes and cappuccinos.
172	41	John	5	This soy drink is amazing! It's unsweetened, so it has a natural taste that I love. It's also really creamy and smooth.
173	41	Emily	4	I really like this unsweetened soy drink. It's a great alternative to dairy milk and it has a nice, nutty flavor.
174	41	David	3	The unsweetened soy drink is okay. It's not as creamy as I would like, but it's a good option for people who are lactose intolerant.
175	41	Sarah	5	I'm so glad I found this unsweetened soy drink! It's
176	42	John	5	This soy drink is the best I've ever tasted. It's sweet and creamy, and I love that it's made from organic soybeans.
177	42	Emily	4	I really like this soy drink. It's not too sweet and has a nice, nutty flavor. It's also a great alternative to dairy milk.
178	42	David	3	This soy drink is okay. It's not as creamy as I would like, but it's a good source of protein and calcium.
179	42	Sarah	5	I'm allergic to dairy, and this soy drink has been a lifesaver. It
180	43	John	5	This almond drink is the best I've ever tasted. It's creamy and has a great flavor. I use it in my coffee every morning.
181	43	Emily	4	I like this almond drink. It's not too sweet and has a nice nutty flavor. I use it in my smoothies.
182	43	Michael	3	This almond drink is okay. It's not as creamy as I would like and it has a bit of an aftertaste. I prefer other brands.
183	43	Sarah	5	I love this almond drink! It's perfect for my vegan lifestyle and it's so versatile. I use it in
184	44	John	5	This almond drink is amazing! It's unsweetened, so it's perfect for me. I use it in my coffee every morning and it's so creamy and delicious.
185	44	Emily	4	I really like this almond drink. It's unsweetened, which is great for me because I don't like sweet drinks. It's a bit thicker than other almond milks I've tried, but I like that too.
186	44	Michael	3	This almond drink is okay. It's unsweetened, which is good, but it's not as creamy as other almond milks I've tried. I might try a different brand next time.
187	45	John	5	This oat milk is the best I've ever tasted. It's creamy and has a great flavor. I highly recommend it.
188	45	Emily	4	I really like this oat milk. It's unsweetened, which is perfect for my coffee. It's a bit thicker than other oat milks I've tried, but I don't mind that.
189	45	Michael	3	This oat milk is okay. It's unsweetened, which is good, but it's not as creamy as I would like. I might try a different brand next time.
190	45	Sarah	5	I'm so
191	46	John	5	These vegan sausage rolls are amazing! They taste just like the real thing and are perfect for a quick snack or meal. Highly recommend!
192	46	Emily	4	I really enjoyed these vegan sausage rolls. They were flavorful and had a great texture. The only downside was that they were a bit on the small side.
193	46	David	5	These vegan sausage rolls are a game changer! They are so delicious and satisfying. I love that they are made with high-quality ingredients and are perfect for any occasion.
194	46	Sarah	3	The Vemondo Vegan Sausage Rolls were okay. They were not as flavorful as
195	47	John	5	This tofu is amazing! It's so soft and flavorful, I can't get enough of it.
196	47	Emily	4	I really like the Vemondo Bio Tofu. It's a great source of protein and it's very versatile in the kitchen.
197	47	David	3	The Vemondo Bio Tofu is okay. It's not the best tofu I've had, but it's not bad either.
198	47	Sarah	5	I'm a big fan of Vemondo Bio Tofu. It's organic, non-GMO, and it tastes great. Highly recommend!
199	48	John	5	These falafels are the best I've ever had. They are crispy on the outside and soft on the inside. Highly recommend!
200	48	Emily	4	The falafels are delicious and have a great texture. However, the tahini sauce could be a bit creamier.
201	48	David	5	I love the Vemondo Falafel. They are so flavorful and the perfect size for a snack or meal. Highly recommend!
202	48	Sarah	3	The falafels are okay. They could be more flavorful and the texture is a bit off. Not the worst, but not the best.
203	49	John	5	This is the best beef mince I've ever had. It's lean, flavorful, and cooks perfectly every time.
204	49	Sarah	4	I really like this beef mince. It's not too lean, so it's still juicy and flavorful. I use it for spaghetti bolognese and it's always a hit.
205	49	David	3	This beef mince is okay. It's lean, but it lacks flavor. I prefer a fattier mince for more taste.
206	49	Emily	5	I'm really impressed with this beef mince. It'
207	50	John	5	This is the best beef mince I've ever had. It's so lean and full of flavor. I highly recommend it.
208	50	Sarah	4	I really like this beef mince. It's not too lean, so it's still juicy and flavorful. I use it to make bolognese and it's always a hit.
209	50	David	3	This beef mince is okay. It's lean, but it lacks flavor. I prefer a beef mince with a bit more fat.
210	50	Emily	5	I'm a big fan of this beef mince. It
211	51	John	5	This is the best beef mince I've ever tasted. It's so lean and flavorful, I can't believe it's only 10% fat.
212	51	Sarah	4	I really like this beef mince. It's not as fatty as other brands, and it's still really tasty. I use it to make spaghetti bolognese and it's always a hit.
213	51	David	3	This beef mince is okay. It's not as juicy as some other brands, but it's still good for making burgers and shepherd's pie.
214	52	John	5	This is the best beef mince I've ever had. The meat is tender and the fat content is just right. Highly recommended!
215	52	Sarah	4	I really like this beef mince. It's great for making burgers and spaghetti bolognese. The only downside is that it's a bit expensive.
216	52	David	3	The beef mince is okay, but I've had better. It's a bit dry and the fat content is not as high as I would like.
217	52	Emily	5	I love this beef mince. It's perfect for making shepherd's
218	53	John	5	This is the best beef mince I've ever had. The 25% fat content makes it really juicy and flavorful.
219	53	Sarah	4	I really like this beef mince. It's high quality and the fat content is just right. I use it for all my recipes.
220	53	David	3	The beef mince is okay. It's not the best I've had, but it's not bad either. The fat content is a bit too high for my taste.
221	53	Emily	5	I'm a big fan of this beef mince. It's so tasty and the fat content makes it
222	54	John	5	This is the best beef mince I've ever had. It's so lean and flavorful, I can't wait to cook with it again.
223	54	Sarah	4	I really like this beef mince. It's not as fatty as others I've tried, and it cooks up really well. The only downside is the price, but it's worth it for the quality.
224	54	David	3	This beef mince is okay, but I've had better. It's not as tender as some other brands I've tried, and it's a bit expensive for what you get.
225	55	John	5	This mince is of excellent quality and has a great flavor. It's perfect for making bolognese and other dishes.
226	55	Sarah	4	I really like this mince. It's leaner than some other brands I've tried, but still has plenty of flavor. I use it for making meatballs and it always turns out great.
227	55	David	3	This mince is okay, but I've had better. It's a bit dry and doesn't have as much flavor as some other brands I've tried. I might try a different brand next time.
228	55	Emily	5	I love
229	56	John	5	This is the best diced beef steak I've ever had. The quality is excellent and the taste is amazing.
230	56	Emily	4	I really like this product. The beef is tender and the flavor is great. I would definitely recommend it.
231	56	David	3	The beef is lean and the dicing is even, but I found the taste to be a bit bland. It could use some seasoning.
232	56	Sarah	5	I'm very impressed with the quality of this diced beef steak. It's perfect for stir-fries and stews.
233	57	John	5	These meatballs are the best I've ever had. They are juicy, flavorful, and cooked to perfection. Highly recommend!
234	57	Emily	4	The meatballs are good, but they could have been a bit more seasoned. Still, they are a great addition to any meal.
235	57	David	5	I love these meatballs! They are so tender and tasty. Perfect for a quick dinner or a party.
236	57	Sarah	3	The meatballs are okay, but they could have been better. They lacked flavor and were a bit dry.
237	58	John D.	5	These are the best burgers I've ever had. The meat is juicy and flavorful, and the bun is perfectly toasted. Highly recommend!
238	58	Emily L.	4	I love the classic taste of these burgers. They're not too fancy, just good old-fashioned burgers. The fries are also a great side.
239	58	Michael S.	3	The burgers are okay, but nothing special. They're a bit on the small side, and the toppings are pretty basic. The price is reasonable, though.
240	58	Sarah P.	5	I'm a big fan of the Birchwood
241	59	John	5	These are the best burgers I've ever had. The meat is so juicy and flavorful, and the bun is perfectly toasted. Highly recommend!
242	59	Emily	4	I really enjoyed these burgers. The beef was high quality and cooked to perfection. The only downside was that the toppings were a bit lackluster.
243	59	Mike	5	I love these burgers! They're so much better than the frozen ones you can buy at the grocery store. The beef is so fresh and the seasoning is on point.
244	59	Sarah	3	These burgers were okay. The beef was good,
245	60	John Doe	5	These are the best burgers I've ever had. The meat is juicy and flavorful, and the bun is perfectly toasted. Highly recommend!
246	60	Jane Smith	4	The burgers are good, but the fries could be better. They're a bit soggy. Overall, a solid meal.
247	60	Mike Johnson	3	The burgers are okay, but nothing special. The toppings are a bit lackluster. I've had better.
248	60	Emily Davis	5	I love the Welsh rarebit topping on these burgers. It adds a nice kick of flavor. The b
249	61	John	5	This is the best diced beef I've ever had. It's so tender and flavorful. I highly recommend it.
250	61	Sarah	4	I really enjoyed the Birchwood Welsh Lean Diced Beef. It was very lean and had a great flavor. The only downside was that it was a bit expensive.
251	61	Michael	3	The Birchwood Welsh Lean Diced Beef was okay. It was lean and had a good flavor, but it was a bit tough. I don't think I would buy it again.
252	61	Emily	5	I love the Birchwood Welsh Lean Diced Beef
253	62	John	5	This is the best steak I've ever had. The flavor and texture were amazing.
254	62	Sarah	4	The steak was very tender and juicy, but it was a bit too fatty for my taste.
255	62	Michael	5	I love the rich, beefy flavor of this steak. It's definitely worth the price.
256	62	Emily	3	The steak was good, but not as great as I expected. It was a bit chewy and lacked flavor.
257	62	David	5	
258	63	John D.	5	This is the best steak I've ever had. The flavor was incredible and the texture was perfect. Highly recommend!
259	63	Emily S.	4	The Strathvale Grass Fed Sirloin was very tasty and cooked evenly. It was a bit pricey, but worth it for a special occasion.
260	63	Michael W.	3	The Strathvale Grass Fed Sirloin was okay. It wasn't the best steak I've had, but it wasn't bad either. The price was reasonable.
261	63	Sarah L.	5	I love the Strathvale Grass Fed Sirloin. It's always
262	64	John D.	5	These steaks are the best I've ever had. They were tender, juicy, and full of flavor. Highly recommend!
263	64	Sarah L.	4	I was really impressed with the quality of these steaks. They cooked evenly and were very tasty. The only downside was that they were a bit pricey.
264	64	Michael B.	5	I love these steaks! They're always consistent in quality and taste amazing. I always get them when I'm in the mood for a good steak dinner.
265	64	Emily S.	3	The steaks were okay, but not as good as I had hoped. They were
266	65	John D.	5	These steaks are the best I've ever had. They're tender, juicy, and full of flavor. Highly recommend!
267	65	Sarah L.	4	I was really impressed with the quality of these steaks. They cooked evenly and tasted great. The only downside is that they're a bit pricey.
268	65	Michael B.	5	I've tried a lot of different steaks, but these are by far the best. They're so flavorful and juicy, I can't get enough of them.
269	65	Emily S.	3	The steaks were okay, but not amazing. They were a
270	66	John D.	5	These steaks are the best I've ever had. They cook quickly and evenly, and the flavor is amazing. Highly recommend!
271	66	Sarah L.	4	I was really impressed with the quality of these steaks. They were tender and juicy, and the packaging kept them fresh until I was ready to use them.
272	66	Michael B.	3	These steaks were okay, but not the best I've had. They were a bit tough and lacked flavor. I might try a different brand next time.
273	66	Emily S.	5	I love these steaks! They're perfect for a quick weeknight dinner, and the flavor
274	67	John D.	5	These steaks are the best I've ever had. They're tender, juicy, and full of flavor. Highly recommend!
275	67	Sarah L.	4	I was really impressed with the quality of these steaks. They cooked evenly and tasted great. Only downside is the price, but it's worth it for the quality.
276	67	Michael B.	3	The steaks were okay, but not as good as I expected. They were a bit tough and lacked flavor. Not sure if I'd buy them again.
277	67	Emily S.	5	I love these steaks! They're perfect for a quick weeknight
278	68	John	5	These steaks were incredibly tender and flavorful. Cooked them on the grill and they were perfect. Highly recommend!
279	68	Sarah	4	The beef fillet steaks were of good quality and cooked well. They were a bit pricey, but worth it for a special occasion.
280	68	Michael	3	The steaks were okay, but not the best I've had. They were a bit tough and lacked flavor. Not sure if I would buy them again.
281	68	Emily	5	These steaks were amazing! They cooked evenly and had a great flavor. Will definitely be buying these again.
282	69	John	5	These steaks were amazing! Cooked them on the grill and they were juicy and full of flavor. Highly recommend!
283	69	Sarah	4	The steaks were very good, but a bit pricey. Still worth it for a special occasion.
284	69	Mike	3	The steaks were okay, but not the best I've had. They were a bit tough and lacked flavor.
285	69	Emily	5	I was really impressed with the quality of these steaks. They were tender and full of flavor. Definitely worth the price.
286	70	John	5	These steaks were amazing! The flavor was incredible and the texture was perfect. I would definitely recommend these to anyone looking for a high-quality steak.
287	70	Sarah	4	The steaks were very good, but I found them to be a bit on the expensive side. Overall, I would say they were worth the price.
288	70	Michael	3	The steaks were okay, but not great. They were a bit tough and lacked flavor. I don't think I would buy them again.
289	70	Emily	5	These steaks were the best I've ever had! The quality was top-notch and the flavor was out
290	71	John	5	This steak was cooked to perfection. The flavor was amazing and it was very tender. Highly recommend!
291	71	Emily	4	The steak was of good quality and cooked well. It was a bit pricey, but worth it for a special occasion.
292	71	David	5	I was really impressed with the taste and texture of this steak. It was well worth the money and I will definitely buy it again.
293	71	Sarah	3	The steak was okay, but not as good as I expected. It was a bit tough and lacked flavor.
294	72	John	5	This is the best beef I've ever tasted. It's so tender and flavorful.
295	72	Emily	4	The beef is great for stir-fries and stews. It's lean and doesn't have a strong smell.
296	72	David	3	The beef is good quality, but it's a bit expensive for what you get.
297	72	Sarah	5	I love that this beef is grass-fed and lean. It's perfect for my healthy diet.
298	72	Michael	2	The beef is
299	73	John	5	This is the best steak I've ever had. The flavor was incredible and the texture was perfect. Highly recommend!
300	73	Emily	4	The steak was very good, but a bit on the expensive side. Still worth it for a special occasion.
301	73	David	5	I was really impressed with the quality of this steak. It was tender and juicy, and the flavor was amazing. Definitely worth the price.
302	73	Sarah	3	The steak was okay, but not as good as I had hoped. It was a bit chewy and lacked flavor.
303	74	John	5	This is the best steak I've ever had. The flavor was incredible and the texture was perfect. Highly recommend!
304	74	Emily	4	The steak was very good, but a bit on the expensive side. Still worth it for a special occasion.
305	74	David	5	I love the fact that this steak is grass-fed and matured for 36 days. The flavor and texture were both outstanding.
306	74	Sarah	3	The steak was good, but not as tender as I had hoped. Still a decent value for the quality.
307	75	John	5	This steak was cooked to perfection. The flavor was amazing and it was very tender. Highly recommend!
308	75	Emily	4	The steak was of good quality and cooked well. It was a bit pricey but worth it for a special occasion.
309	75	David	5	I was really impressed with the taste and texture of this steak. It was well worth the money and I will definitely be buying again.
310	75	Sarah	3	The steak was okay, but not as good as I had hoped. It was a bit chewy and lacked flavor.
311	76	John	5	These steaks were amazing! Cooked them on the grill and they were juicy and full of flavor. Highly recommend!
312	76	Sarah	4	The steaks were good quality and cooked well. A little pricey but worth it for a special occasion.
313	76	Michael	3	The steaks were okay. Not the best I've had but not the worst. Would buy again if there were no other options.
314	76	Emily	5	These steaks were the best I've ever had! Cooked them on the stovetop and they were perfectly cooked and full of flavor. Will definitely be buying again!
315	77	John	5	These steaks are always tender and juicy. Great value for money!
316	77	Emily	4	I love the convenience of these steaks. They cook quickly and are always delicious.
317	77	David	3	The steaks are okay, but I prefer a more marbled cut.
318	77	Sarah	5	These steaks are the best I've ever had. They're always cooked perfectly and have a great flavor.
319	77	Michael	2	The steaks were tough and not very flavorful. I won't be buying these again.
320	78	John	5	These pork loin steaks are amazing! They are so tender and juicy, and the flavor is incredible. I highly recommend them.
321	78	Sarah	4	I really enjoyed these pork loin steaks. They were easy to cook and had a great flavor. The only downside was that they were a bit on the small side.
322	78	Michael	5	These are the best pork loin steaks I've ever had. They are so flavorful and tender, and they cook up perfectly every time. I can't recommend them enough.
323	78	Emily	3	These pork loin steaks were okay. They were a bit
324	79	John	5	These pork shoulder steaks are amazing! They are tender and juicy, and the flavor is incredible. I highly recommend them.
325	79	Sarah	4	I really enjoyed these pork shoulder steaks. They were well-seasoned and cooked perfectly. The only downside was that they were a bit pricey.
326	79	Michael	3	These pork shoulder steaks were okay. They were not bad, but they were not great either. The flavor was a bit bland and they were a bit tough.
327	79	Emily	5	I love these pork shoulder steaks! They are my go-to for a quick and easy dinner. They are always cooked
328	80	John	5	These pork loin chops are the best I've ever had. They were tender, juicy, and had a great flavor. Highly recommend!
329	80	Emily	4	I really enjoyed these pork loin chops. They were well-seasoned and cooked perfectly. The only downside was that they were a bit pricey.
330	80	Michael	5	I was really impressed with the quality of these pork loin chops. They were thick and juicy, and the flavor was amazing. Definitely worth the price.
331	80	Sarah	3	These pork loin chops were okay. They were a bit dry and lacked flavor.
332	81	John	5	This pork mince is of high quality and has a great taste. It's perfect for making various dishes.
333	81	Emily	4	I like this pork mince as it's lean and has a good texture. It's a bit expensive but worth it.
334	81	David	3	The pork mince is okay but not the best I've tried. It's a bit dry and could use more flavor.
335	81	Sophie	5	I'm really happy with this pork mince. It's perfect for making burgers and meatballs. Highly recommend!
336	82	John	5	This is the best bacon I've ever had. It's so flavorful and the quality is top-notch.
337	82	Emily	4	The bacon is good, but it's a bit expensive. I might try a different brand next time.
338	82	Michael	5	I love that this bacon is from a humane source. It's delicious and I feel good about supporting the RSPCA.
339	82	Sarah	3	The bacon is okay, but it's not the best I've had. It's a bit too salty for my taste.
340	83	John	5	This is the best bacon I've ever had. It's so flavorful and the quality is top-notch.
341	83	Emily	4	The bacon is good, but it's a bit expensive. I might try a different brand next time.
342	83	David	5	I love that this bacon is from RSPCA-approved farms. It's a great way to support animal welfare while enjoying delicious bacon.
343	83	Sarah	3	The bacon is okay, but it's not as crispy as I would like. I might try cooking it differently next time.
344	84	John	5	These sausages are the best I've ever tasted. They're juicy, flavorful, and cooked perfectly. Highly recommend!
345	84	Emily	4	I really enjoyed these sausages. They were tender and had a great flavor. The only downside was that they were a bit on the small side.
346	84	David	5	These sausages are amazing! They're so tasty and have a great texture. I'll definitely be buying them again.
347	84	Sarah	3	The sausages were okay. They were a bit dry and lacked flavor. Not the worst sausages I've had, but not the best
348	85	John	5	These sausages are amazing! They have a great flavor and are very juicy. I would definitely recommend them to anyone.
349	85	Sarah	4	The sausages are tasty and have a good amount of flavor. They are also very filling. The only downside is that they are a bit expensive.
350	85	Michael	3	The sausages are okay. They have a nice flavor but they are a bit dry. I would prefer them if they were a bit juicier.
351	85	Emily	5	These sausages are the best I've ever had! They are so flavorful and juicy. I would definitely buy them again.
352	86	John	5	This is the best chicken I've ever had. It's so juicy and flavorful, and the quality is top-notch.
353	86	Emily	4	I really enjoyed this chicken. It was tender and had a great taste. The only downside was that it was a bit pricey.
354	86	David	5	I was really impressed with the quality of this chicken. It was so much better than the supermarket chickens I've bought in the past. Highly recommend!
355	86	Sarah	3	The chicken was okay, but not amazing. It was a bit dry and lacked flavor. I probably won't buy it again.
356	87	John	5	This is the best chicken I've ever had. The garlic and herb seasoning is perfect and the chicken was cooked to perfection. Highly recommend!
357	87	Sarah	4	I really enjoyed the garlic and herb flavor of this chicken. It was easy to prepare and cooked evenly. The only downside was that it was a bit salty for my taste.
358	87	Michael	5	This is a great product. The chicken was tender and juicy, and the garlic and herb seasoning was delicious. I will definitely be buying this again.
359	87	Emily	3	The chicken was okay. The garlic and herb seasoning was good
408	100	John	5	I love Petit Pain! The bread is always fresh and the croissants are to die for.
360	88	John D.	5	I love the Birchwood Chicken Thigh Fillet. It's so tender and juicy, and the flavor is amazing. I always make sure to keep some in my freezer for when I need a quick and delicious meal.
361	88	Sarah L.	4	The Birchwood Chicken Thigh Fillet is a great product. It's easy to cook and the meat is always moist and flavorful. The only downside is that it can be a bit pricey, but it's worth it for the quality.
362	88	Michael T.	5	I've tried a lot of chicken products, but the Birchwood Chicken Thigh Fillet is by far my favorite. The meat is so tender and the flavor is unbeatable. I always have some in my
363	89	John D.	5	These chicken wings are the best I've ever had. The flavor is amazing and the meat is so tender. Highly recommend!
364	89	Sarah L.	4	The chicken wings at Birchwood are delicious. They have a great balance of spice and flavor. My only complaint is that they could be a bit crispier.
365	89	Michael T.	5	I love the Birchwood Chicken Wings. They are always cooked to perfection and the sauce is incredible. I can't get enough of them!
366	89	Emily S.	3	The chicken wings at Birchwood are okay. They are not the best I've had, but they are not the worst.
367	90	John D.	5	These turkey breast steaks are the best I've ever had. They're so tender and juicy, and the flavor is amazing. Highly recommend!
368	90	Sarah L.	4	I was a bit skeptical about trying turkey breast steaks, but these were actually really good. They cooked up quickly and were very tasty. Will definitely buy again.
369	90	Michael B.	3	The turkey breast steaks were okay, but not the best I've had. They were a bit dry and lacked flavor. Not bad, but not great.
370	90	Emily S.	5	These turkey breast steaks are a game-changer.
371	91	John	5	This turkey mince is so lean and flavorful. It's perfect for making healthy meals without sacrificing taste.
372	91	Emily	4	I really like this turkey mince. It's a great alternative to beef and is much healthier. The only downside is that it can be a bit dry if not cooked properly.
373	91	David	5	I've been using this turkey mince for a while now and it's become a staple in my household. It's so versatile and can be used in so many different dishes.
374	91	Sarah	3	The turkey mince is okay, but I find it a
375	92	John	5	This is the best turkey mince I've ever had. It's lean and has a great flavor. Highly recommend!
376	92	Sarah	4	I really like this turkey mince. It's low in fat and cooks up really well. The only downside is that it's a bit pricey.
377	92	Michael	3	This turkey mince is okay. It's not the best I've had, but it's not bad either. It's a bit dry, but it's still edible.
378	92	Emily	5	I love this turkey mince! It's so
379	93	John	5	These kebabs were amazing! The mint sauce was the perfect complement to the lamb. Highly recommend!
380	93	Emily	4	The kebabs were tasty, but I wish they had come with more mint sauce. Still a great meal though!
381	93	David	3	The kebabs were okay, but not the best I've had. The mint sauce was a bit too sweet for my taste.
382	93	Sarah	5	These kebabs were delicious! The mint sauce was the perfect balance of sweet and tangy. Highly recommend!
383	94	John D.	5	These cod fillets are the best I've ever had. They're so tender and flaky, and the seasoning is perfect. Highly recommend!
384	94	Sarah L.	4	I really enjoyed these cod fillets. They were easy to cook and tasted great. The only downside was that there were only two fillets in the package.
385	94	Michael B.	5	I'm a big fan of cod and these fillets did not disappoint. They were fresh, flavorful, and cooked perfectly. I'll definitely be buying these again.
386	94	Emily S.	3	The cod fillets were okay, but not amazing. They were a bit dry
387	95	John D.	5	These cod loins are the best I've ever had. They are so tender and flaky, and the flavor is amazing. Highly recommend!
388	95	Sarah L.	4	I really enjoyed the Deluxe MSC Cod Loins. They were cooked perfectly and had a great taste. The only downside was that there were only two loins in the package.
389	95	Michael B.	5	I love the Deluxe MSC Cod Loins. They are so easy to cook and always turn out delicious. I've recommended them to all of my friends.
390	95	Emily S.	3	The Deluxe MSC Cod Loins were okay.
391	96	John	5	These fishcakes are amazing! The melt in the middle part is a great touch and the flavor is fantastic.
392	96	Emily	4	These fishcakes are really tasty and the melt in the middle part is a nice surprise. The only downside is that they are a bit pricey.
393	96	David	3	These fishcakes are okay. The melt in the middle part is a nice idea but the fish flavor is a bit overpowering.
394	96	Sarah	5	These fishcakes are the best I've ever had! The melt in the middle part is so delicious and the fish flavor is spot on.
395	97	John	5	These fish fingers are the best I've ever had. They are crispy on the outside and tender on the inside. Highly recommended!
396	97	Emily	4	I really like these fish fingers. They are made from real cod and have a great taste. The only downside is that they are a bit expensive.
397	97	David	3	These fish fingers are okay. They are not the best I've had, but they are not the worst either. The coating is a bit too thick for my taste.
398	97	Sarah	5	I love these fish fingers! They are so convenient and delicious. I always keep a bag in my freezer for those days when I
399	98	John	5	This is the best cheese twist I've ever had. The cheese is perfectly melted and the twist is crispy on the outside.
400	98	Jane	4	I really enjoyed the cheese twist. It was a bit greasy, but the cheese was delicious.
401	98	Mike	3	The cheese twist was okay. It wasn't bad, but it wasn't great either. The cheese was a bit bland.
402	98	Emily	5	I love the cheese twist. It's the perfect snack for when I'm watching TV or reading a book.
403	98	David	2	I
404	99	John	5	This is the best sourdough loaf I've ever had. The seeds add a nice crunch and the flavor is amazing.
405	99	Emily	4	I really enjoyed the Seeded Sourdough Loaf. It was a bit dense, but the flavor was great and the seeds added a nice texture.
406	99	David	3	The Seeded Sourdough Loaf was okay. It was a bit dry and the seeds were a bit too crunchy for my taste.
407	99	Sarah	5	I love this Seeded Sourdough Loaf! It's the perfect balance of sweet and sour, and the seeds add a nice crunch
409	100	Emily	4	Petit Pain has some of the best pastries I've ever had. The only reason I didn't give it a 5 is because it can get pretty crowded.
410	100	David	3	The bread at Petit Pain is good, but I've had better. The service could also be a bit more friendly.
411	100	Sophia	5	Petit Pain is my go-to spot for breakfast. The baguettes are amazing and the staff is always so friendly.
412	101	John Doe	5	This baguette is the best I've ever had. The crust is crispy and the inside is soft and chewy. Highly recommend!
413	101	Jane Smith	4	The Large French Baguette is great for sandwiches. It's a bit dense, but it holds up well with toppings and spreads.
414	101	Mike Johnson	3	The Large French Baguette is okay. It's not the best I've had, but it's not the worst. It could use a bit more flavor.
415	101	Emily Davis	5	I love this baguette! It's perfect for dipping in olive oil and balsamic vinegar
416	102	John	5	These rolls are amazing! They have a great crust and are perfect for sandwiches.
417	102	Emily	4	The rolls are good, but they could be a bit softer. Still, they're great for making sandwiches.
418	102	Mike	3	The rolls are okay, but they're not the best I've had. They could use more flavor.
419	102	Sarah	5	These rolls are perfect for breakfast! They're crusty on the outside and soft on the inside.
420	102	David	2	I didn't like these rolls at all
421	103	John Doe	5	This is the best product I've ever used. It's so comfortable and stylish. Highly recommend it!
422	103	Jane Smith	4	I love the Tiger Bloomer! It's so versatile and can be worn in so many different ways. The only downside is that it's a bit pricey.
423	103	Mike Johnson	3	The Tiger Bloomer is okay. It's not the most comfortable thing I've ever worn, but it looks great. I might try something else next time.
424	103	Emily Davis	5	I'm obsessed with my Tiger Bloomer! It's so unique and eye-catching. I get compliments
425	104	John	5	This is the best low GI snack I've ever had. The multiseed cob is crunchy and flavorful, and it keeps me full for hours.
426	104	Emily	4	I really like the multiseed cob. It's a great alternative to high-carb snacks and it's very filling. The only downside is that it's a bit expensive.
427	104	David	5	I'm a big fan of the low GI multiseed cob. It's a great source of fiber and protein, and it's perfect for a mid-afternoon snack. Highly recommend!
428	104	Sarah	3	The multiseed
429	105	John Doe	5	This is the best baton I've ever used. It's lightweight, durable, and has a great grip. Highly recommend it!
430	105	Jane Smith	4	I really like the Tiger Baton. It's well-balanced and easy to control. The only downside is that it's a bit pricey, but it's worth it for the quality.
431	105	Mike Johnson	3	The Tiger Baton is okay. It does the job, but there are better options out there. I would have liked a bit more weight to it.
432	105	Emily Davis	5	I'm a professional baton twirler and I use the Tiger Bat
433	106	John	5	These panini rolls are amazing! They have a great texture and taste just like I'm in Italy. Highly recommend!
434	106	Sarah	4	I love using these panini rolls for sandwiches. They hold up well and have a nice crust on the outside. The only downside is that they can be a bit salty.
435	106	Michael	5	These are the best panini rolls I've ever had. They're soft on the inside and crispy on the outside. Perfect for making sandwiches or just eating on their own.
436	106	Emily	3	The Italian Style Panini Rolls are okay. They're not the best I've had
437	107	John	5	This lemon loaf cake is the best I've ever had. The lemon flavor is so fresh and the cake is moist and delicious.
438	107	Emily	4	I really enjoyed this lemon loaf cake. It was tangy and sweet at the same time. The only downside was that it was a bit dry.
439	107	David	5	I love lemon loaf cake and this one did not disappoint. It was perfectly moist and the lemon flavor was spot on.
440	107	Sarah	3	This lemon loaf cake was okay. It was not too sweet and had a nice lemon flavor, but it was a bit dense and not as light as I would have liked.
441	108	John	5	This Pain au Double Choc with Hazelnut is absolutely delicious! The perfect balance of sweetness and hazelnut flavor. Highly recommend!
442	108	Emily	4	I really enjoyed the Pain au Double Choc with Hazelnut. The hazelnut flavor was strong and the chocolate was rich. The only downside was that it was a bit dry.
443	108	David	5	This Pain au Double Choc with Hazelnut is a must-try! The combination of chocolate and hazelnut is heavenly. It's the perfect treat for any chocolate lover.
444	108	Sarah	3	The Pain au Double Choc with Hazelnut was okay. The chocolate and
445	109	John	5	These doughnuts are amazing! The jam filling is just the right amount of sweetness and the dough is perfectly fluffy. Highly recommend!
446	109	Emily	4	The jam filled doughnut was delicious! The dough was soft and the jam was sweet and tangy. The only downside was that it was a bit too sweet for my taste.
447	109	Michael	3	The jam filled doughnut was okay. The dough was a bit dry and the jam was too runny. It wasn't bad, but it wasn't great either.
448	109	Sarah	5	I love these jam filled doughnuts! They are the perfect balance of sweet and tangy. The dough is
449	110	John	5	The Belgian Bun is my favorite pastry. It's soft, fluffy, and has a delicious filling. Highly recommend!
450	110	Emily	4	I love the Belgian Bun! It's a bit sweet for my taste, but the texture is amazing. I'd give it a 4 out of 5.
451	110	Michael	3	The Belgian Bun was okay. It wasn't bad, but it wasn't great either. I prefer other pastries over this one.
452	110	Sarah	5	The Belgian Bun is a must-try! It's the perfect balance of sweet and savory. I can't wait to have another one!
453	111	Jane Doe	5	This doughnut is absolutely delicious! The pink icing is the perfect touch and the ring shape makes it easy to eat. Highly recommend!
454	111	John Smith	4	The Pink Iced Ring Doughnut is a great treat. The dough is soft and the icing is sweet, but not too sweet. My only complaint is that it could have been a bit bigger.
455	111	Sarah Lee	5	I love the Pink Iced Ring Doughnut! It's the perfect snack for when I'm craving something sweet. The icing is so tasty and the dough is so fluffy. I can't get enough!
456	111	David Kim	3	
944	243	Jane	3	Not my favorite beer, but it's okay for a casual drink.
457	112	John	5	This doughnut is absolutely delicious! The chocolate and hazelnut filling is perfect and the dough is soft and fluffy. Highly recommend!
458	112	Emily	4	I really enjoyed the chocolate and hazelnut filled doughnut. It was sweet but not too sweet and the filling was rich and creamy. The only downside was that it was a bit too rich for me.
459	112	Michael	3	The chocolate and hazelnut filled doughnut was okay. It was definitely sweet and the filling was tasty, but the dough was a bit dry and the chocolate was a bit too sweet for my taste.
460	112	Sarah	5	This doughnut is amazing! The
461	113	John	5	This is the best brownie I've ever had. It's moist, chocolatey, and has the perfect amount of sweetness.
462	113	Emily	4	The Ultimate Chocolate Brownie is delicious, but it could be a bit fudgier. Still, it's a great treat for chocolate lovers.
463	113	David	5	I'm not usually a fan of brownies, but this one changed my mind. It's rich, decadent, and has the perfect texture.
464	113	Sarah	3	The Ultimate Chocolate Brownie is good, but not amazing. It's a bit too cakey for my taste.
465	114	John	5	These muffins are amazing! The filling is just the right amount and the flavor is perfect.
466	114	Emily	4	The muffins are delicious, but I wish they were a little bigger.
467	114	David	5	These are the best muffins I've ever had. The filling is so tasty and the muffin itself is soft and moist.
468	114	Sarah	3	The muffins are okay, but I prefer ones with more filling.
469	114	Michael	5	These muffins are perfect for a quick breakfast or snack. The filling is a
470	115	John	5	The best croissant I've ever had. The buttery taste and flaky texture were amazing.
471	115	Emily	4	This croissant was delicious, but it could have been a bit flakier.
472	115	David	5	I love the all butter croissant. It's the perfect breakfast treat.
473	115	Sarah	3	The croissant was good, but not as buttery as I had hoped.
474	115	Michael	5	This croissant is the best thing I've ever eaten. The buttery taste and flaky texture were incredible.
475	116	John	5	The Pastel del Nata is the best pastry I've ever had. The flaky crust and the creamy custard filling are a match made in heaven.
476	116	Jane	4	I love the Pastel del Nata! It's a little messy to eat, but it's worth it for the delicious taste.
477	116	Mike	3	The Pastel del Nata is okay. It's not my favorite pastry, but it's still good.
478	116	Emily	5	I'm addicted to Pastel del Nata! I can't get enough of the sweet and creamy filling.
479	117	John	5	This is the best cheddar I've ever tasted. The assorted flavors are all delicious and the quality is top-notch.
480	117	Emily	4	I really enjoyed the Deluxe Somerset Cheddar Assorted. The flavors were unique and the cheese was very high quality. The only downside was that it was a bit pricey.
481	117	Michael	5	I love this cheese! The Deluxe Somerset Cheddar Assorted is perfect for any occasion. The flavors are amazing and the quality is unbeatable.
482	117	Sarah	3	The Deluxe Somerset Cheddar Assorted was good, but not
483	118	John	5	These edam slices are the best! They are so flavorful and have a great texture. Highly recommend!
484	118	Emily	4	I really like the Milbona Edam Slices. They are a great snack and have a nice taste. The only downside is that they can be a bit salty.
485	118	David	5	These edam slices are amazing! They are so tasty and have a great consistency. I would definitely buy them again.
486	118	Sarah	3	The Milbona Edam Slices are okay. They are not bad, but they are not great either. They have a nice flavor, but they are a bit too che
487	119	John	5	This is the best blue cheese I've ever tasted. It's creamy and has a strong, tangy flavor that I love. Highly recommend!
488	119	Emily	4	The Deluxe Mature Blue Stilton is a great cheese. It's a bit strong for my taste, but it's still very tasty. I would definitely buy it again.
489	119	David	5	I'm a big fan of blue cheese and this one is top-notch. It's rich, creamy, and has a wonderful tangy flavor. Highly recommend!
490	119	Sarah	3	The Deluxe Mature Blue Stilton is a good cheese,
491	121	John	5	These cheese slices are amazing! They taste just like real Emmental cheese and are perfect for snacking or adding to sandwiches.
492	121	Sarah	4	I really like these cheese slices. They are convenient and taste good. The only downside is that they are a bit expensive.
493	121	Michael	3	These cheese slices are okay. They are not as flavorful as other cheese slices I have tried, but they are still good for a quick snack.
494	121	Emily	5	I love these cheese slices! They are so convenient and taste just like real cheese. I always have them on hand for snacking or making sandwiches.
495	122	John	5	These eggs are the best I've ever tasted. The yolks are so rich and the whites are so fluffy. I highly recommend them!
496	122	Sarah	4	I love the taste and quality of these eggs. They are definitely worth the price. The only downside is that they are a bit hard to find in my area.
497	122	Michael	5	These eggs are amazing! They are so fresh and delicious. I can taste the difference compared to regular eggs. I will definitely be buying these again.
498	122	Emily	3	The eggs are good, but I expected them to be better considering the price. They are definitely fresher than regular eggs
499	123	John	5	These are the best eggs I've ever had. They taste so fresh and the yolks are so rich and creamy. I highly recommend them!
500	123	Sarah	4	I love the Woodcote 6 Large Free Range Eggs. They are so much better than the regular eggs I used to buy. The only downside is that they are a bit more expensive, but it's worth it for the quality.
501	123	Michael	3	The Woodcote 6 Large Free Range Eggs are okay. They taste fine, but I don't really notice a difference from regular eggs. They are also a bit more expensive, so I'm not sure if I would buy them again.
502	124	John	5	These are the best eggs I've ever had. They are so fresh and delicious. I highly recommend them.
503	124	Sarah	4	I love the taste of these eggs. They are so much better than the ones I get from the supermarket. The only downside is the price, but they are worth it.
504	124	David	3	These eggs are good, but not as good as I expected. They are definitely fresher than store-bought eggs, but I don't think they are worth the extra money.
505	124	Emily	5	I am so glad I found these eggs. They are so much better than the ones I was buying before. They
506	125	John	5	These are the best organic eggs I've ever had. The yolks are bright orange and the eggs taste fresh and delicious.
507	125	Sarah	4	I really like these eggs. They are organic and taste great. The only downside is that they are a bit more expensive than regular eggs.
508	125	Michael	5	I'm a big fan of Woodcote 6 Organic Eggs. They are so much better than the regular eggs I used to buy. The quality is excellent and the taste is amazing.
509	125	Emily	3	These eggs are okay. They are organic and taste fine, but they are not as fresh as I would like them to
510	126	John	5	These are the best eggs I've ever had. They taste so fresh and the yolks are so rich and creamy. I highly recommend them!
511	126	Sarah	4	I love the Woodcote 12 Large Free Range Eggs. They are so much better than the regular eggs I used to buy. The only downside is that they are a bit more expensive, but it's worth it for the quality.
512	126	Michael	3	The Woodcote 12 Large Free Range Eggs are okay. They taste fine, but I don't really notice a difference from regular eggs. I might try a different brand next time.
513	127	John	5	These Gouda slices are amazing! They have a great flavor and are perfect for snacking or adding to sandwiches.
514	127	Emily	4	I really like the Milbona Gouda Slices. They are a great alternative to cheese and are perfect for when I don't have any cheese on hand.
515	127	Michael	3	The Milbona Gouda Slices are okay. They have a nice flavor but they are a bit too soft for my liking.
516	127	Sarah	5	These Gouda slices are the best! They are perfect for adding to sandwiches and they have a great flavor.
517	128	John	5	This is the best cheese assortment I've ever had. The variety of flavors and textures is amazing.
518	128	Emily	4	I really enjoyed the Deluxe Continental Cheese Assorted. The selection of cheeses was great and they all tasted fresh.
519	128	David	3	The Deluxe Continental Cheese Assorted was okay. Some of the cheeses were good, but others were not as tasty.
520	128	Sarah	5	I love the Deluxe Continental Cheese Assorted. It's perfect for entertaining and the cheeses are all high quality.
521	129	John	5	This is the best Parmigiano Reggiano I have ever tasted. The flavor is rich and complex, and the texture is perfect. Highly recommended!
522	129	Sarah	4	I really enjoyed the Deluxe Parmigiano Reggiano. It has a great flavor and melts perfectly. The only downside is that it's a bit pricey, but it's worth it for the quality.
523	129	Michael	5	I love this Deluxe Parmigiano Reggiano. It's so much better than the regular kind. The flavor is amazing and it's perfect for topping pasta dishes or adding to salads.
524	130	John	5	This is the best Red Leicester cheese I've ever tasted. The flavor is rich and the texture is perfect.
525	130	Emily	4	I really enjoy Valley Spire Red Leicester. It's a great cheese for snacking or adding to sandwiches.
526	130	Michael	3	The Valley Spire Red Leicester is okay. It's not the best cheese I've had, but it's not bad either.
527	130	Sarah	5	I love Valley Spire Red Leicester. It's my go-to cheese for cheese boards and cheese platters.
528	131	John	5	This is the best cheddar I've ever tasted. It's sharp and tangy, with a great depth of flavor. Highly recommended!
529	131	Emily	4	I really enjoyed the Valley Spire British Mature Cheddar. It's creamy and has a nice, rich flavor. I would definitely buy it again.
530	131	David	3	The Valley Spire British Mature Cheddar is okay. It's not the best cheddar I've had, but it's not bad either. It has a mild flavor and melts well.
531	131	Sarah	5	I love the Valley Spire British Mature Cheddar
532	132	John	5	This is the best Halloumi I've ever had. It's so creamy and delicious.
533	132	Emily	4	I really like the Milbona Halloumi. It's a great cheese for grilling and it has a nice, slightly salty flavor.
534	132	Michael	3	The Milbona Halloumi is okay. It's not the best I've had, but it's not bad either.
535	132	Sarah	5	I love the Milbona Halloumi. It's perfect for frying and it has a great texture and flavor.
536	133	John	5	These eggs are the best I've ever tasted. The yolks are so rich and the whites are so fluffy. I highly recommend them!
537	133	Emily	4	I love the taste and quality of these eggs. They are definitely worth the price. The only downside is that they are a bit harder to find in my area.
538	133	David	5	These eggs are amazing! They are so fresh and delicious. I would definitely recommend them to anyone looking for high-quality eggs.
539	133	Sarah	3	The eggs are good, but I expected them to be better considering the price. They are definitely better than regular eggs, but not
540	134	John	5	These eggs are the best I've ever tasted. The yolks are so rich and the whites are so fluffy. I highly recommend them!
541	134	Sarah	4	I love the taste and quality of these eggs. They are definitely worth the price. The only downside is that they are a bit hard to find in my area.
542	134	Michael	5	I've been buying these eggs for years and I wouldn't switch to anything else. They are so fresh and delicious. I can taste the difference.
543	134	Emily	3	The eggs are okay, but I've had better. They are a bit pricey for what they
544	135	John	5	These eggs are the best I've ever tasted. The yolks are so rich and the whites are fluffy. I highly recommend them!
545	135	Sarah	4	I love the variety of sizes in this pack. It's great for making different dishes. The eggs are also very fresh and taste great.
546	135	David	3	The eggs are good quality, but I wish they were a bit cheaper. Overall, they're a good value for the money.
547	135	Emily	5	I'm so happy I found these eggs. They're so much better than the ones I used to buy from the supermarket. I'll
548	136	John	5	This is the best antipasti assortment I've ever had. The variety of flavors and textures is amazing.
549	136	Sarah	4	I really enjoyed the Meadow Fresh Antipasti Assorted. It was a great addition to my party and everyone loved it.
550	136	Michael	3	The Meadow Fresh Antipasti Assorted was okay. It was a bit too salty for my taste, but the variety of ingredients was nice.
551	136	Emily	5	I love the Meadow Fresh Antipasti Assorted. It's perfect for a quick snack or a party. The ingredients are fresh and delicious.
552	137	John	5	These olives are the best I've ever had. They are so fresh and flavorful.
553	137	Emily	4	I really enjoyed the variety of olives in this package. They were all delicious.
554	137	David	3	The olives were okay, but not as good as I had hoped. They were a bit too salty for my taste.
555	137	Sarah	5	I love the Meadow Fresh Greek Olives Assorted. They are perfect for snacking or adding to salads.
556	137	Michael	2	The olives were not as fresh
557	138	John D.	5	These olives are the best I've ever had. The variety of flavors and textures is amazing. Highly recommend!
558	138	Sarah L.	4	I love the assorted mix of olives in this package. They are all so fresh and flavorful. The only downside is that they go so quickly!
559	138	Michael B.	5	I'm a big fan of olives and this assorted mix did not disappoint. The quality is top-notch and the variety is perfect for snacking or adding to dishes.
560	138	Emily G.	3	The olives are okay, but not as good as I expected. They are a bit too salty for
561	139	John Doe	5	This is the best houmous I've ever tasted. The assorted toppings add a great variety of flavors and textures.
562	139	Jane Smith	4	I really enjoyed the Deluxe Topped Houmous Assorted. The packaging was attractive and the houmous was fresh and tasty. The only downside was that the toppings were a bit overpowering for my taste.
563	139	Michael Johnson	5	I love this product! The houmous is creamy and delicious, and the toppings add a nice touch of variety. It's perfect for parties or as a snack.
564	140	John	5	This dip is amazing! It has the perfect balance of sour cream and chive flavors. It's great for parties and gets devoured every time I bring it.
565	140	Sarah	4	I really like this dip. It's creamy and has a nice tangy flavor from the sour cream and chives. It's a great addition to any party or gathering.
566	140	Michael	3	This dip is okay. It's not the best I've had, but it's not bad either. The sour cream and chive flavors are there, but they could be stronger.
567	140	Emily	5	I love this dip! It
568	141	John	5	This is the best smashed avocado I've ever had. The texture is perfect and the flavor is amazing.
569	141	Emily	4	I really enjoy the variety of flavors in this assorted pack. It's great for adding to my breakfast toast or using as a dip for my veggies.
570	141	David	3	The smashed avocado is good, but I wish there were more options in the assorted pack. It feels like I'm always getting the same flavor.
571	141	Sarah	5	I love the convenience of this product. It's so easy to just open up the pack and spread it on my toast. The flavors
572	143	John	5	These quiches are amazing! The crust is flaky and the filling is delicious. Highly recommend!
573	143	Emily	4	The quiches are good, but I wish they were a little bigger. Still a great value for the price.
574	143	Mike	3	The quiches are okay, but not the best I've had. They're a bit bland and could use more flavor.
575	143	Sarah	5	These quiches are perfect for a quick breakfast or lunch. They're easy to reheat and taste great.
576	143	David	2	I didn
577	144	John	5	These pies are amazing! The crust is flaky and the filling is delicious. Highly recommend!
578	144	Emily	4	The pies were good, but not the best I've had. The crust was a bit tough, but the filling was tasty.
579	144	Mike	5	These pies are a great value for the price. They taste just like the ones from the fancy bakery down the street, but for a fraction of the cost.
580	144	Sarah	3	The pies were okay. The crust was a bit dry and the filling was just average. Not bad, but not great either.
581	145	John	5	These pork pies are absolutely delicious! The perfect size for a snack or appetizer. Highly recommend!
582	145	Emily	4	I really enjoyed these pork pies. They were flavorful and had a nice texture. The only downside was that they were a bit salty.
583	145	Michael	5	These pork pies are amazing! They are the perfect balance of savory and sweet. I would definitely buy them again.
584	145	Sarah	3	The pork pies were okay. They were not as flavorful as I had hoped. I would try a different brand next time.
585	146	John	5	This pizza is amazing! The BBQ sauce and bacon are a perfect combination. The crust is crispy and the chicken is cooked just right. Highly recommend!
586	146	Sarah	4	I really enjoyed this pizza. The BBQ sauce is flavorful and the chicken and bacon are a great addition. The crust is a bit thicker than I prefer, but overall it's a tasty pizza.
587	146	Michael	3	This pizza is okay. The BBQ sauce is a bit too sweet for my taste and the bacon is a bit overpowering. The chicken is cooked well, but the crust is a bit too soft for my liking.
588	147	John	5	This pizza is amazing! The stuffed crust is so cheesy and the cheese feast topping is delicious. Highly recommend!
589	147	Emily	4	I really enjoyed this pizza. The cheese feast topping was unique and tasty. The only downside was that the crust was a bit too chewy for my liking.
590	147	Mike	3	The pizza was okay. The cheese feast topping was good, but the crust was a bit too greasy. Not my favorite, but not terrible.
591	147	Sarah	5	This is my go-to pizza when I want something cheesy and indulgent. The stuffed cr
592	148	John	5	This pizza is amazing! The crust is perfectly crispy and the toppings are delicious. Highly recommend!
593	148	Sarah	4	I really enjoyed this pizza. The toppings were plentiful and the sauce was flavorful. The only downside was that the crust was a bit too thick for my taste.
594	148	Mike	3	This pizza was okay. The toppings were good but the crust was a bit bland. Not bad, but not great either.
595	148	Emily	5	This is my go-to pizza when I don't feel like cooking. The toppings are always fresh and the crust is perfectly cris
596	149	John	5	This dip is amazing! It has the perfect balance of garlic and herbs and is great for dipping veggies, chips, or bread.
597	149	Sarah	4	I really like this dip. It's not too strong in garlic flavor, which is great for those who don't like strong garlic taste. It's perfect for parties and gatherings.
598	149	Michael	3	The dip is okay. It's not the best garlic and herb dip I've had, but it's not bad either. It's a good option for those who want something simple and easy to make.
599	149	Emily	5	This is my go-to dip
600	150	John	5	These mini garlic pizza breads are amazing! They are perfect for a quick snack or appetizer. The garlic flavor is just right and the bread is soft and fluffy. Highly recommend!
889	226	Sarah	5	I'm a big fan of this instant coffee. It's strong, flavorful, and brews quickly. I highly recommend it.
601	150	Emily	4	I love the convenience of these mini garlic pizza breads. They are perfect for a last-minute dinner or party. The garlic flavor is not too strong, but it adds a nice touch to the bread. The only downside is that they could be a bit bigger.
602	150	Michael	3	These mini garlic pizza breads are okay. The garlic flavor is not very strong, but it is still tasty. The bread is a bit dry, but it is not a deal-breaker. Overall, they are a decent snack, but not the best I have tried.
603	151	John D.	5	These are the best hot and spicy mini fillets I've ever had. The flavor is amazing and the heat level is just right. Highly recommend!
604	151	Sarah L.	4	I really enjoy these hot and spicy mini fillets. They are a great snack and have a nice kick to them. The only downside is that they are a bit pricey.
605	151	Michael B.	5	These are by far the best hot and spicy mini fillets I've ever had. The flavor is incredible and the heat level is perfect. I can't get enough of them!
606	151	Emily S.	3	These hot and spicy mini fillets
607	152	John	5	These chicken pops are amazing! They are perfectly seasoned and cooked to perfection. I would highly recommend them to anyone looking for a delicious snack.
608	152	Sarah	4	These chicken pops are really tasty and easy to make. They are a great snack for when you're on the go. The only downside is that they can be a bit messy to eat.
609	152	Michael	3	These chicken pops are okay. They are not the best I've had, but they are not the worst. The seasoning is a bit bland and they could use more flavor.
610	152	Emily	5	These chicken pops are the best! They are so
611	153	John	5	This is the best sourdough bread I've ever had. The woodfire taste is amazing and the texture is perfect. Highly recommend!
612	153	Emily	4	The bread is good, but I wish there were more variety in the assortment. Still a great value for the price.
613	153	Michael	5	I love the convenience of the single serve size. The bread is always fresh and delicious. Can't ask for anything more!
614	153	Sarah	3	The bread is okay, but not as good as I expected. The woodfire taste is not very strong. I might try a different brand next time.
615	154	John	5	This is the best chicken dish I've ever had. The sourdough breading is a perfect complement to the spicy arrabbiata sauce. Highly recommend!
616	154	Emily	4	The chicken was cooked perfectly and the arrabbiata sauce had just the right amount of spice. The sourdough breading was a nice touch. Would definitely order again.
617	154	Michael	3	The chicken was good but the arrabbiata sauce was a bit too spicy for my taste. The sourdough breading was interesting but I'm not sure it added much to the dish.
618	154	Sarah	5	This is my
619	155	John	5	This is the best sandwich I've ever had. The combination of sourdough, ham, mascarpone, and mushrooms is just perfect.
620	155	Emily	4	I really enjoyed this sandwich. The flavors were well-balanced and the ingredients were fresh. The only thing I would change is the amount of mushrooms, as I prefer more of them.
621	155	David	3	The sandwich was good, but not great. The mascarpone cheese was a nice touch, but I found the mushrooms to be a bit overpowering.
622	155	Sarah	5	This sandwich is a game-changer. The combination of
623	156	John	5	These Cheesy Garlic Toasties are amazing! They are so easy to make and taste delicious. I highly recommend them.
624	156	Emily	4	I love the Chef Select Cheesy Garlic Toasties! They are perfect for a quick snack or appetizer. The garlic flavor is just right.
625	156	Michael	3	The Chef Select Cheesy Garlic Toasties are okay. They are not bad, but they are not great either. The cheese flavor is a bit overpowering.
626	156	Sarah	5	These Cheesy Garlic Toasties are the best! They are so easy to make and taste amazing. I
627	157	John D.	5	I love this pasta! It's so fresh and delicious. The filling is perfect and the pasta itself is cooked to perfection. Highly recommend!
628	157	Sarah L.	4	This pasta is really good. The filling is tasty and the pasta is cooked well. The only downside is that it's a bit pricey, but it's worth it for the quality.
629	157	Michael T.	3	The pasta is okay. The filling is good, but the pasta itself is a bit chewy. It's not bad, but there are better options out there.
630	157	Emily S.	5	I'm a big
631	158	John	5	These tortelloni are delicious! The pesto and pine nut filling is so flavorful and the pasta is cooked perfectly. Highly recommend!
632	158	Emily	4	I really enjoyed these tortelloni. The pesto and pine nut filling is a great combination and the pasta is cooked well. The only downside is that they are a bit pricey.
633	158	Michael	3	These tortelloni are okay. The filling is good but the pasta is a bit chewy. Not bad but not great either.
634	158	Sarah	5	These are my go-to tortelloni. The pesto and pine nut filling is so tasty and
635	159	John	5	This is the best tortelloni ham I've ever had. The flavor is amazing and the texture is perfect.
636	159	Sarah	4	I really enjoyed the Chef Select Tortelloni Ham. It was easy to cook and had a great taste.
637	159	Michael	3	The Chef Select Tortelloni Ham was okay. It wasn't bad, but it wasn't great either. I think there are better options out there.
638	159	Emily	5	I love the Chef Select Tortelloni Ham. It's the perfect combination of savory and sweet. Highly recommend!
639	160	John	5	These tortelloni are amazing! The porcini mushroom flavor is so rich and delicious. Highly recommend!
640	160	Sarah	4	I really enjoyed these tortelloni. The porcini mushroom flavor was subtle but delicious. The pasta itself was cooked perfectly.
641	160	Michael	3	These tortelloni were okay. The porcini mushroom flavor was there, but it wasn't as strong as I had hoped. The pasta was a bit chewy.
642	160	Emily	5	These tortelloni are a game changer! The porcini mushroom flavor is so intense and flavorful. I will definitely be buying these
643	161	John	5	These ready meals are a lifesaver for busy nights. The flavors are authentic and the portions are generous.
644	161	Emily	4	I love the variety of meals in this assortment. They're all delicious and easy to prepare.
645	161	Mike	3	The meals are okay, but I wish there were more vegetarian options.
646	161	Sarah	5	These ready meals are a great way to enjoy Chinese food at home. The quality of the ingredients is top-notch.
647	161	David	2	The meals were disappointing. The flavors
648	162	John	5	This meal was amazing! The variety of dishes was great and the quality of the ingredients was top-notch. I would definitely recommend this to anyone looking for a delicious and convenient meal.
649	162	Emily	4	I really enjoyed the Deluxe Premium Meal for One Assorted. The portions were generous and the flavors were delicious. The only downside was that the meal was a bit salty for my taste.
650	162	Michael	5	This meal was a lifesaver on a busy night. The variety of dishes meant that I didn't get bored and the quality of the food was excellent. I will definitely be buying this again.
651	163	John	5	This meal was amazing! The variety of dishes was great and the quality of the ingredients was top-notch. Highly recommend!
652	163	Emily	4	The meal was delicious and the presentation was beautiful. The only downside was that there was too much food for two people, so we had leftovers.
653	163	Michael	5	This meal was a real treat! The flavors were incredible and the portions were generous. It was a great way to celebrate a special occasion.
654	163	Sarah	3	The meal was okay, but not exceptional. Some of the dishes were better than others, but overall it was a good value for the price.
655	164	John	5	This is the best pasta I've ever had. The ham and mushroom flavors are perfect together and the tagliatelle is cooked to perfection.
656	164	Sarah	4	I really enjoyed the Chef Select Ham Mushroom Tagliatelle. The pasta was cooked well and the sauce was flavorful. The only downside was that it was a bit salty.
657	164	Michael	5	I love this pasta! The ham and mushroom combination is amazing and the tagliatelle is cooked to perfection. It's my go-to pasta dish now.
658	164	Emily	3	The Chef Select Ham Mushroom Tagli
659	165	John	5	This is the best spaghetti I've ever had. The texture is perfect and the taste is amazing.
660	165	Emily	4	I really like this spaghetti. It's not too thick and not too thin. The flavor is great too.
661	165	Michael	3	This spaghetti is okay. It's not the best I've had, but it's not the worst either.
662	165	Sarah	5	I love this spaghetti! It's so authentic and delicious. I always buy it when I want to make a great Italian meal.
663	166	John	5	These pies are amazing! The perfect comfort food for a chilly night.
664	166	Emily	4	I love the variety of flavors in these pies. They're a great addition to any meal.
665	166	Mike	3	The pies were okay, but not as flavorful as I had hoped. Still a decent value for the price.
666	166	Sarah	5	These pies are a lifesaver for busy weeknights. They're so easy to heat up and serve, and the whole family loves them.
667	167	John	5	This is the best chicken korma I've ever had. The flavors are spot on and the rice is perfectly cooked.
668	167	Sarah	4	I really enjoyed this chicken korma. The sauce was creamy and flavorful, and the chicken was tender. The only downside was that there wasn't enough sauce for my taste.
669	167	Michael	3	This chicken korma was okay. The flavors were good, but the chicken was a bit dry. The rice was cooked well, though.
670	167	Emily	5	I love this chicken korma! The sauce is so delicious and the chicken is cooked perfectly. The rice is a great addition
671	168	John	5	These meals are so convenient and delicious. They are perfect for busy nights when I don't have time to cook.
672	168	Emily	4	The Thai chicken meals are a great option for a quick and tasty dinner. The flavors are authentic and the portions are generous.
673	168	Michael	3	The meals are okay, but they could be better. The flavors are a bit bland and the chicken could be more tender.
674	168	Sarah	5	I love these meals! They are so convenient and the flavors are amazing. I always have a few in my freezer for when I need a quick dinner.
675	170	John	5	These puddings are so delicious and easy to make. Perfect for a quick dessert or snack.
676	170	Emily	4	I love the variety of flavors in this assorted pack. They're perfect for satisfying my sweet tooth.
677	170	David	3	The puddings are okay, but they're a bit too sweet for my taste. I prefer something less sugary.
678	170	Sarah	5	These puddings are a great treat for my kids. They love the different flavors and I love how easy they are to make.
679	171	John	5	These trifles are amazing! The strawberry flavor is so authentic and the texture is just perfect. Highly recommend!
680	171	Emily	4	I love the convenience of these trifles. They're perfect for a quick dessert or snack. The strawberry flavor is good, but I wish they were a bit sweeter.
681	171	David	3	These trifles are okay. The strawberry flavor is there, but it's not very strong. They're also a bit dry. Not bad, but not great.
682	171	Sarah	5	These trifles are so delicious! The strawberry flavor is spot on and the creaminess is perfect. I
683	172	John	5	These desserts are amazing! They are perfect for any occasion and everyone loves them.
684	172	Sarah	4	The assorted pack is great because it has a variety of flavors. My favorite is the tiramisu.
685	172	Michael	3	The desserts are good, but they are a bit too sweet for my taste. I prefer something less sugary.
686	172	Emily	5	These are the best Italian desserts I've ever had. They are so authentic and delicious.
687	172	David	2	The packaging is nice, but the desserts
688	175	John	5	These desserts are amazing! They are perfect for any occasion and everyone loves them.
689	175	Emily	4	The assorted desserts are delicious and come in a variety of flavors. They are perfect for a party or gathering.
690	175	David	3	The desserts are okay, but not the best I've had. They are a bit too sweet for my taste.
691	175	Sarah	5	These desserts are so convenient and tasty. They are perfect for when you want something sweet but don't have time to bake.
692	175	Michael	2	
693	176	John	5	This is the best orange juice I've ever had. The bits of pulp and orange rind add a nice texture and flavor to the juice.
694	176	Sarah	4	I really like this orange juice. It's not too sweet and has a nice tangy flavor. The bits of pulp are a nice touch.
695	176	Michael	3	This orange juice is okay. It's not the best I've had, but it's not bad either. The bits of pulp are a bit too chunky for my taste.
696	176	Emily	5	I love this orange juice! It's so fresh and delicious. The bits
945	243	Mike	5	Love this beer! It's perfect for any occasion.
697	177	John	5	These smoothies are amazing! They taste so fresh and natural, and I love that they come in a variety of flavors. Perfect for a quick and healthy breakfast or snack.
698	177	Emily	4	I really enjoy the Naturis Smoothies Assorted Flavours. They are convenient and taste great. I especially like the tropical and berry flavors. The only downside is that they can be a bit pricey.
699	177	Michael	3	The Naturis Smoothies Assorted Flavours are okay. They are easy to make and taste fine, but they are not as filling as I would like. I also think the prices could be lower.
700	178	John	5	This is the best orange juice I've ever tasted. It's so fresh and natural tasting, I feel like I'm drinking freshly squeezed orange juice from a local farmer's market.
701	178	Sarah	4	I really like this orange juice. It's not too sweet and has a nice tangy flavor. It's also very smooth and easy to drink.
702	178	Michael	3	This orange juice is okay. It's not the best I've had, but it's not bad either. It's a bit watery and lacks the flavor I'm looking for in an orange juice.
703	179	John	5	These smoothies are amazing! They taste so fresh and are a great way to start my day.
704	179	Emily	4	I love the variety of flavors in these smoothies. They are perfect for a quick and healthy breakfast.
705	179	Michael	3	The smoothies are okay, but I wish they were a bit thicker. They seem a bit watery to me.
706	179	Sarah	5	These smoothies are a lifesaver for me. I don't have time to make breakfast in the morning, so these are perfect.
707	179	David	2	
708	180	John	5	This is the best orange juice I've ever had. It's so fresh and delicious.
709	180	Emily	4	I really like this orange juice. It's not too sweet and has a great flavor.
710	180	David	3	This orange juice is okay. It's not the best I've had, but it's not bad either.
711	180	Sarah	2	I didn't like this orange juice. It tasted too watery and not very flavorful.
712	180	Michael	1	This is the worst orange
713	181	Jane Doe	5	My kids love these smoothies! They are a great way to get them to eat their fruits and veggies. I also appreciate that they are made with natural ingredients and no added sugars.
714	181	John Smith	4	These smoothies are a convenient and healthy snack for my kids. They are not too sweet and have a good balance of flavors. The only downside is that they can be a bit pricey.
715	181	Sarah Lee	5	I'm impressed with the quality of these smoothies. They taste delicious and are a great way to introduce my kids to new fruits and vegetables. I also like that they are gluten-free and dairy-free.
716	182	John	5	This is the best orange juice I've ever had. It's so fresh and delicious.
717	182	Emily	4	I really enjoy this orange juice. It's not too sweet and has a great flavor.
718	182	David	3	The orange juice is okay. It's not the best I've had, but it's not bad either.
719	182	Sarah	5	I love this orange juice! It's so refreshing and perfect for a hot summer day.
720	182	Michael	2	This orange juice is not very
721	183	John	5	This juice is amazing! It's so refreshing and full of flavor. I love the natural taste and the fact that it's made with real fruit.
722	183	Emily	4	I really enjoy the Naturis Tropical Juice. It's a great way to get my daily dose of fruits and veggies. The only downside is that it's a bit pricey.
723	183	Michael	5	I'm a big fan of the Naturis Tropical Juice. It's a great way to start my day and it's so convenient. I love the variety of flavors and the fact that it's made with natural ingredients.
724	184	John	5	This juice is amazing! The perfect blend of apple and mango flavors. Highly recommend!
725	184	Emily	4	I really enjoy this juice. It's not too sweet and has a nice balance of apple and mango flavors. I would definitely buy it again.
726	184	Michael	3	The juice is okay. It's not the best apple and mango juice I've had, but it's not bad either. I might try something else next time.
727	184	Sarah	5	This is my go-to juice. The flavors are spot on and it's not too sweet. I love having it as a mid-morning snack.
728	186	John D.	5	I love the variety of fruits in this mix. It's perfect for smoothies and adds a great flavor to my yogurt.
729	186	Emily S.	4	The fruits in this mix are very fresh and taste great. However, I wish there were more options for different fruit combinations.
730	186	Michael L.	5	This is a great product for people who want to add more fruits to their diet. The mix is perfect for smoothies and it's very convenient to have frozen fruits on hand.
731	186	Sarah P.	3	The fruits in this mix are okay, but they are not as fresh as I expected. I also found some of the fruits to be too
732	187	John	5	These raspberries and strawberries are the freshest I've ever had. They taste amazing and last for a long time.
733	187	Emily	4	The raspberries and strawberries from Freshona are delicious and have a great texture. They are a bit expensive, but worth it for the quality.
734	187	David	5	I love Freshona's raspberries and strawberries. They are always fresh and flavorful. I highly recommend them.
735	187	Sarah	3	The raspberries and strawberries from Freshona are good, but not the best I've had. They are a bit pricey for what they are.
736	188	Jane Doe	5	I love these smoothie mixes! They are so easy to make and taste delicious. I've tried all the flavors and they are all great.
737	188	John Smith	4	These smoothie mixes are really good. I like that they are made with real fruit and are not too sweet. The only downside is that they can be a bit expensive.
738	188	Sarah Lee	3	The Freshona Fruit Smoothie Mixes are okay. They are easy to make and taste fine, but they are not the best smoothie mixes I've tried. I prefer ones that have more fruit chunks in them.
739	189	John	5	These pineapple chunks are so fresh and juicy, they make a great addition to any fruit salad or smoothie.
740	189	Sarah	4	The cherries are sweet and plump, and the mango is ripe and flavorful. A great mix of tropical fruits.
741	189	Michael	3	The pineapple chunks are good, but the cherries and mango are a bit too sweet for my taste. Still, a decent mix of fruits.
742	189	Emily	5	I love the combination of these three fruits - the pineapple is tangy, the cherries are sweet, and the mango is creamy. A perfect snack!
743	190	John	5	This is the best canned fish I've ever had. The sauce is delicious and the fish is tender and flaky.
744	190	Sarah	4	I really enjoyed the variety of fish in this can. The sauce was a bit salty for my taste, but overall it was a tasty and convenient meal.
745	190	Michael	3	The fish in this can was okay, but the sauce was a bit too spicy for my liking. I prefer a milder sauce.
746	190	Emily	5	This is my go-to canned fish. The sauce is flavorful and the fish is always cooked perfectly. Highly recommend!
747	191	John D.	5	These scampi are amazing! They are perfectly breaded and cooked to perfection. I would highly recommend them to anyone looking for a delicious seafood dish.
748	191	Sarah L.	4	I really enjoyed the Ocean Sea Breaded Wholetail Scampi. They were a bit messy to eat, but the flavor was great. I would definitely buy them again.
749	191	Michael P.	3	The Ocean Sea Breaded Wholetail Scampi were okay. They were a bit bland and the breading was not as crispy as I had hoped. I probably won't buy them again.
750	191	Emily S.	5	These scampi
751	192	John	5	These prawns are the best I've ever had. They are so fresh and flavorful. Highly recommend!
752	192	Emily	4	The prawns are very tasty and cooked perfectly. They are a bit pricey, but worth it for a special occasion.
753	192	Michael	3	The prawns are okay, but not the best I've had. They are a bit tough and not as fresh as I would like.
754	192	Sarah	5	I love these prawns! They are so easy to cook and always turn out delicious. Highly recommend!
755	193	John	5	This is the best Margherita pizza I've ever had. The crust is perfectly crispy and the cheese is melted to perfection. Highly recommend!
756	193	Emily	4	The Trattoria Alfredo Margherita Pizza is delicious. The sauce is flavorful and the cheese is fresh. The only downside is that the crust could be a bit crispier.
757	193	Michael	3	The Trattoria Alfredo Margherita Pizza is okay. It's not the best pizza I've had, but it's not the worst. The crust is a bit too thick and the cheese could be more flavorful.
758	194	John	5	This is the best pepperoni pizza I've ever had. The crust is perfectly crispy and the sauce is just the right amount of tangy.
759	194	Emily	4	The pepperoni pizza from Simply Pizza is really good. The cheese is melted perfectly and the pepperoni is flavorful.
760	194	Michael	3	The Simply Pepperoni Pizza is okay. It's not the best pizza I've had, but it's not bad either. The crust could be a bit crispier.
761	194	Sarah	5	I love the Simply Pepperoni Pizza. The sauce is delicious and the pepperoni is perfectly cooked. It's my go
762	195	John	5	These ice cream caramel sticks are amazing! The perfect combination of ice cream and caramel. Highly recommend!
763	195	Emily	4	I love the double ice cream caramel sticks! They are so creamy and the caramel is just the right amount of sweetness. Highly recommend!
764	195	Michael	3	The double ice cream caramel sticks are good, but not great. The caramel is a bit too sweet for my taste. Still a decent treat though.
765	195	Sarah	5	These ice cream caramel sticks are the best! The perfect snack for a hot summer day. Highly recommend!
766	196	John Doe	5	These rocket lollies are out of this world! They're so tasty and the kids love them.
767	196	Jane Smith	4	The rocket lollies are a fun treat for kids. They're a bit messy to make, but the end result is worth it.
768	196	Mike Johnson	3	The rocket lollies were okay. They didn't taste as good as I expected, but the kids still enjoyed them.
769	196	Emily Davis	5	These rocket lollies are a great way to make a special treat for a birthday party. They're easy to make and everyone loves them.
770	197	John	5	These ice cream bars are the best! They are creamy and delicious, and the perfect treat on a hot summer day.
771	197	Emily	4	I really enjoy these ice cream bars. They are a great size and have a good balance of chocolate and ice cream.
772	197	Michael	3	The ice cream bars are okay. They are not the best I've had, but they are not bad either. The chocolate coating could be a bit thicker.
773	197	Sarah	5	These ice cream bars are my favorite! They are so creamy and have just the right amount of chocolate. I can't get enough of them!
774	198	John	5	These mini ice creams are perfect for a quick treat. They're not too sweet and come in a variety of flavors.
775	198	Emily	4	The mini ice creams are a great size for a small snack. They're a bit pricey, but they're worth it for the convenience.
776	198	David	3	The mini ice creams are okay, but they melt too quickly. I prefer a larger ice cream that lasts longer.
777	198	Sarah	5	These mini ice creams are perfect for a hot summer day. They're the perfect size for a quick snack and come in a variety of flavors.
778	199	John	5	These ice cream cones are the best! The Bon Gelati brand never disappoints.
779	199	Emily	4	The ice cream cones were delicious, but the waffle cone was a bit soggy.
780	199	Michael	5	I love these ice cream cones! They are the perfect size for a sweet treat.
781	199	Sarah	3	The ice cream was good, but the cones were a bit too hard to bite into.
782	199	David	5	These ice cream cones are the perfect way to cool down on a hot summer day.
783	200	John	5	These ice cream lollies are the best! They are so creamy and delicious. I love the classic flavors and the nostalgic feel of these treats.
784	200	Emily	4	I really enjoyed these ice cream lollies. The chocolate coating was a nice touch and the ice cream was smooth and tasty. The only downside was that they melted quickly on a hot day.
785	200	Michael	5	These are the perfect summer treat! The classic flavors brought me back to my childhood and the ice cream was so creamy and delicious. I highly recommend them.
786	200	Sarah	3	These ice cream lollies were okay. The chocolate co
787	201	John	5	This is the best almond ice cream I've ever had. The flavor is rich and creamy, and it's not too sweet. Highly recommend!
788	201	Emily	4	I really enjoyed the Bon Gelati Classic Almond Ice Cream. It has a great balance of sweetness and nuttiness. The only downside is that it melts quickly, so you have to eat it fast!
789	201	Michael	3	The Bon Gelati Classic Almond Ice Cream is okay. It's not the best almond ice cream I've had, but it's not bad either. The texture is a bit icy, which is a bit of a letdown.
790	202	John	5	This is the best ice cream I've ever had. The combination of exotic fruits is amazing and the texture is perfect.
791	202	Emily	4	I really enjoyed the Exotic Fruit Ice. It was refreshing and had a great mix of flavors. The only downside was that it melted a bit too quickly.
792	202	David	5	I love trying new and unique flavors, and this Exotic Fruit Ice did not disappoint. It was a perfect blend of sweet and tangy, and I can't wait to try it again.
793	202	Sophia	3	The Exotic Fruit Ice was okay. It had a nice mix of flavors, but it wasn't as cream
794	203	John	5	These are the best fruit splits I've ever had. The fruit is fresh and the gelato is creamy. Highly recommend!
795	203	Emily	4	I love the variety of fruit flavors in these fruit splits. They're a great treat for when I'm craving something sweet.
796	203	Michael	3	The fruit splits are okay, but I prefer other brands. The fruit flavor could be stronger.
797	203	Sarah	5	These fruit splits are a perfect snack for when I'm on-the-go. They're not too messy and the fruit is delicious.
798	204	John	5	This is the best strawberry conserve I've ever tasted. The flavor is amazing and it's perfect for spreading on toast or using in baking.
799	204	Emily	4	I really enjoy using this strawberry conserve in my recipes. It adds a nice sweetness and the texture is just right.
800	204	David	3	The Maribel Premium Strawberry Conserve is good, but not great. It's a bit too sweet for my taste and I prefer a more tangy flavor in my jams.
801	204	Sarah	5	I love using this strawberry conserve in my morning oatmeal. It adds a delicious fruity flavor and
802	205	John	5	This is the best blueberry conserve I've ever tasted. The flavor is amazing and it's perfect for spreading on toast or pancakes.
803	205	Emily	4	I really enjoy this blueberry conserve. It's not too sweet and has a nice tangy flavor. I use it as a glaze for ham or as a topping for cheesecake.
804	205	Michael	5	I love this conserve! It's the perfect balance of sweet and tart, and it's great on toast or pancakes. I also use it as a topping for ice cream.
805	205	Sarah	3	This blueberry conserve is okay
806	206	John	5	This is the best orange marmalade I've ever tasted. The flavor is amazing and the texture is perfect.
807	206	Emily	4	I really enjoy this marmalade. It's a bit on the sweet side for my taste, but the orange flavor is strong and delicious.
808	206	David	5	I've been buying this marmalade for years and I've never been disappointed. It's the perfect balance of sweet and tangy.
809	206	Sarah	3	This marmalade is okay. It's not the best I've had, but it's not bad either. The texture is a bit grainy, but the flavor
810	207	John Doe	5	This is the best peanut butter I've ever tasted. It's smooth, creamy, and has a great flavor.
811	207	Jane Smith	4	I really like Maribel Peanut Butter. It's not too sweet and has a nice, nutty flavor.
812	207	Michael Brown	3	Maribel Peanut Butter is okay. It's not the best I've had, but it's not the worst either.
813	207	Emily Davis	5	I love Maribel Peanut Butter! It's perfect for making sandwiches, and it's also great for baking.
814	208	John	5	This biscuit spread is amazing! It's so creamy and delicious, I can't get enough of it.
815	208	Emily	4	I really like this biscuit spread. It's not too sweet and has a nice chocolate flavor. It's perfect for spreading on biscuits or using as a dip.
816	208	David	3	The biscuit spread is okay. It's not the best I've tried, but it's not bad either. It has a nice chocolate flavor, but it's a bit too thick for my liking.
817	208	Sarah	5	This biscuit spread is the best! It's so smooth
818	209	John	5	This is the best chocolate hazelnut spread I've ever tried. It's creamy, smooth, and has a great flavor. Highly recommend!
819	209	Emily	4	I really like this chocolate hazelnut spread. It's not as thick as Nutella, but it has a nice, rich flavor. I use it on toast, pancakes, and even in my smoothies.
820	209	Michael	3	This chocolate hazelnut spread is okay. It's not as sweet as Nutella, but it's also not as thick. I prefer something a little more rich and creamy.
821	209	Sarah	2	I was disappointed
822	210	Jane Doe	5	This chocolate spread is absolutely delicious! It's smooth and creamy, and the perfect addition to my morning toast. Highly recommend!
823	210	John Smith	4	I love the combination of milk and white chocolate in this spread. It's not too sweet and spreads easily on bread. Great for snacking!
824	210	Emily Johnson	3	The chocolate spread is okay, but not the best I've tried. It's a bit too thick and doesn't spread easily. I prefer a smoother consistency.
825	210	Michael Brown	5	This chocolate spread is a game-changer! It's the perfect balance of sweet and rich, and it
826	211	John	5	This is the best Manuka Honey I have ever tasted. The quality is top-notch and the price is reasonable.
827	211	Emily	4	I love using this Manuka Honey in my tea and on my toast. It has a rich, complex flavor that I really enjoy.
828	211	David	5	I have been using this Manuka Honey for years and I would never switch to another brand. It is so pure and delicious.
829	211	Sarah	3	This Manuka Honey is good, but I have had better. It is a bit pricey for what it is.
830	212	John Doe	5	I love this assorted pack of speciality honeys. The variety of flavors is amazing and they all taste so good. Highly recommend!
831	212	Jane Smith	4	The Deluxe Speciality Honeys Assorted is a great gift idea for honey lovers. The packaging is also very attractive and the honeys are of high quality.
832	212	Michael Brown	3	The Deluxe Speciality Honeys Assorted is a good product, but I found some of the honeys to be too sweet for my taste. Still, it's a nice variety pack.
833	212	Emily Davis	5	I'm so glad I discovered this Del
834	213	John	5	This honey is amazing! It's so smooth and has a great flavor. I use it in my tea and on my toast.
835	213	Emily	4	I really like this honey. It's not too sweet and has a nice, natural taste. I use it in my smoothies and on my yogurt.
836	213	Michael	3	The honey is okay. It's not the best I've had, but it's not the worst. I use it in my baking.
837	213	Sarah	5	This is the best honey I've ever tasted! It's so pure and delicious. I use it in my cooking and baking.
838	214	John	5	This honey is amazing! It's so smooth and easy to spread. I love using it on my toast in the morning.
890	227	John	5	These coffee beans are amazing! The assorted flavors are perfect for any time of day. Highly recommend!
839	214	Emily	4	I really like this honey. It's a bit more expensive than other brands, but it's worth it for the quality. The squeeze bottle makes it easy to use.
840	214	Michael	3	The honey is okay. It's not the best I've had, but it's not the worst. The squeeze bottle is convenient, but I wish it came with a lid to keep it closed.
841	214	Sarah	5	I'm a big fan of this honey. It's so delicious
842	215	John	5	This honey is amazing! It's so smooth and has a great flavor. I use it on everything from toast to yogurt.
843	215	Sarah	4	I really like this honey. It's not too sweet and has a nice, natural flavor. I use it in my tea and on my oatmeal.
844	215	Michael	3	This honey is okay. It's not the best I've had, but it's not the worst. It's a little bit runny, but it has a nice, mild flavor.
845	215	Emily	5	I love this honey! It's so smooth and has a great, rich flavor
846	216	John	5	This is the best spaghetti I've ever had. The texture is perfect and the taste is amazing.
847	216	Emily	4	I really enjoyed the Baresa Spaghetti. It was cooked to perfection and had a great flavor.
848	216	Michael	3	The Baresa Spaghetti was okay. It wasn't the best I've had, but it wasn't bad either.
849	216	Sarah	5	I love the Baresa Spaghetti. It's my go-to brand when I'm in the mood for a delicious pasta dish.
850	217	John	5	This is the best pasta I've ever had. The texture is perfect and it cooks evenly.
851	217	Emily	4	I really like the Baresa Fusilli. It's a great pasta for any dish and it's very affordable.
852	217	Michael	3	The Baresa Fusilli is okay. It's not the best pasta I've had, but it's not bad either.
853	217	Sarah	5	I love the Baresa Fusilli. It's my go-to pasta for any dish. It's also very affordable.
854	218	John	5	This is the best basmati rice I've ever tasted. It's fluffy, fragrant, and cooks perfectly every time.
855	218	Emily	4	I really like this basmati rice. It's not as good as the one I get from the local Indian restaurant, but it's still very tasty and cooks well.
856	218	David	3	This rice is okay. It's not the best I've had, but it's not the worst either. It's a bit bland, but it cooks well and is easy to find.
857	218	Sarah	2	I was really disappointed with this rice. It's not as fl
858	219	John	5	This microwaveable rice is amazing! It's so convenient and the taste is just like freshly cooked rice. Highly recommend!
859	219	Emily	4	I love the variety of flavors in this microwaveable rice. It's a great option for a quick and easy meal. The only downside is that it could use a bit more seasoning.
860	219	David	3	The microwaveable rice is okay, but not great. It's convenient, but the taste and texture are not as good as freshly cooked rice.
861	219	Sarah	5	This microwaveable rice is a lifesaver for busy weeknights. The flav
862	220	John	5	These noodles are amazing! They cook quickly and have a great texture and flavor. Highly recommend!
863	220	Emily	4	These noodles are really good. They're not too thick or too thin, and they cook quickly. I've used them in a few different dishes and they've worked well every time.
864	220	Mike	3	These noodles are okay. They're not the best I've had, but they're not the worst. They cook quickly, but they don't have a lot of flavor on their own. I like to add some seasoning to them.
865	220	Sarah	5	I love these no
866	221	Jane Doe	5	This is the best peppermint tea I've ever had. The flavor is strong and refreshing, and it's perfect for a cold winter evening.
867	221	John Smith	4	I really enjoy this tea. It's a great way to unwind after a long day. The only downside is that it's a bit expensive, but it's worth it for the quality.
868	221	Sarah Lee	5	I love this tea! It's so soothing and calming. I drink it every night before bed and it helps me sleep better.
869	221	David Kim	3	This tea is okay. The flavor is nice, but it'
870	222	John	5	This is the best Earl Grey tea I've ever had. The flavor is rich and the aroma is amazing. Highly recommend!
871	222	Emily	4	I love the taste of this tea. It's strong and flavorful, but not too overpowering. The Fairtrade aspect is also a plus.
872	222	David	5	I'm a big fan of Earl Grey tea and this one is definitely up there with the best. The quality of the tea is excellent and the price is reasonable.
873	222	Sarah	3	The tea has a nice flavor, but it's not as strong as I would like. It's still a good tea, but not
874	223	John	5	This is the best green tea I've ever tasted. The variety of flavors is amazing and the quality is top-notch.
875	223	Emily	4	I really enjoy the different flavors of this green tea. It's a great way to switch up my daily tea routine.
876	223	David	3	The tea is okay, but I wish there were more variety in the flavors. It's a bit too similar to other green teas I've tried.
877	223	Sarah	5	I love the Knightsbridge Green Tea Assorted. It's a great way to try new flavors and find my new favorite tea.
878	224	John	5	This is the best tea I've ever had. The flavor is rich and the aroma is amazing. I highly recommend it.
879	224	Emily	4	I love the convenience of having 240 packs of tea. The taste is great and it's perfect for my morning routine.
880	224	David	3	The tea is okay, but not the best I've had. It's a bit too strong for my taste. I might try a different brand next time.
881	224	Sarah	5	I'm a big fan of Knightsbridge tea. The Red Label is my favorite. It's a great way to start my day.
882	225	John	5	This coffee is amazing! The flavor is so rich and full-bodied, it's like drinking liquid gold. Highly recommend!
883	225	Emily	4	I love the variety of flavors in this coffee. Each one is unique and delicious. The only downside is that the portions are a bit small.
884	225	David	5	This is the best coffee I've ever had. The freeze-dried process really preserves the flavor and aroma. I'm hooked!
885	225	Sarah	3	The coffee is good, but I wish there were more options for strength. I prefer a stronger coffee in the morning, so this is a bit weak
886	226	John	5	This is the best instant coffee I've ever had. It's rich, smooth, and has a great flavor.
887	226	Emily	4	I really like this instant coffee. It's not as strong as some other brands, but it's still very tasty.
888	226	Michael	3	This coffee is okay. It's not the best I've had, but it's not the worst either. It's a decent choice for a quick cup of coffee.
891	227	Emily	4	I love the variety of flavors in this bag of coffee beans. They are all delicious and make my morning coffee even better.
892	227	Michael	3	The coffee beans are okay, but not the best I've had. The flavors are a bit too mild for my taste.
893	227	Sarah	5	I'm a big fan of Bellarom coffee beans. The assorted flavors are perfect for my morning coffee routine and the quality is top-notch.
894	228	John D.	5	These espresso pods are amazing! The flavor is rich and bold, and the aroma is incredible. I highly recommend them to anyone who loves a good cup of coffee.
895	228	Emily S.	4	I really like these espresso pods. They make a great cup of coffee that's strong and flavorful. The only downside is that they can be a bit expensive, but they're worth it for the quality.
896	228	Michael W.	5	These are the best espresso pods I've ever tried. The flavor is spot on, and they're so convenient to use. I've recommended them to all my coffee-loving friends.
897	229	John	5	This is the best ground coffee I have ever tasted. It has a rich aroma and a smooth, full-bodied flavor. Highly recommended!
898	229	Emily	4	I really like this coffee. It has a nice, strong flavor and a good amount of caffeine to keep me going throughout the day. The only downside is that it can be a bit expensive.
899	229	Michael	3	This coffee is okay, but not my favorite. It's a bit too mild for my taste and doesn't have much of a kick. I prefer something with a bit more punch.
900	229	Sarah	5	I love this coffee! It's smooth,
901	230	John	5	This is the best ground coffee I've ever tasted. The aroma and flavor are amazing.
902	230	Emily	4	I really enjoy the blend of French and Italian flavors in this coffee. It's a great way to start my day.
903	230	David	3	The coffee is okay, but not the best I've had. It's a bit too strong for my taste.
904	230	Sarah	5	I love the convenience of having ground coffee. This brand is my go-to for French and Italian roasts.
905	230	Michael	2	
906	231	John	5	This is the best instant coffee I've ever had. It's smooth, rich, and has a great flavor.
907	231	Emily	4	I really like this instant coffee. It's easy to make and has a good taste. The only downside is that it's a bit expensive.
908	231	David	3	This coffee is okay. It's not the best I've had, but it's not the worst either. It's convenient to have on hand for when I need a quick cup of coffee.
909	231	Sarah	5	I'm a huge fan of this instant coffee. It's so easy to make and it tastes just like regular coffee
910	232	John	4	This is a great tasting alcohol-free beer. It's perfect for those who want to enjoy a beer without the alcohol.
911	232	Sarah	5	I love this beer! It's so refreshing and tastes just like the real thing. Highly recommend it.
912	232	Mike	3	It's a decent beer, but it lacks the flavor and body of regular beer. Still, it's a good option for those who want to avoid alcohol.
913	232	Emily	5	This is my go-to alcohol-free beer. It's perfect for social events or just relaxing at home. Highly recommend it!
914	233	John	5	This is my favorite beer. It's crisp and refreshing, perfect for a hot summer day.
915	233	Emily	4	I really enjoy the taste of this beer. It's not too heavy and goes well with a variety of foods.
916	233	Mike	3	This beer is okay. It's not my favorite, but it's not bad either. It's a good choice for a casual gathering.
917	233	Sarah	5	I love the aroma of this beer. It's a great choice for a relaxing evening at home.
918	234	John	5	Stella Artois is my go-to beer for any occasion. It's smooth, crisp, and always hits the spot.
919	234	Emily	4	I really enjoy the taste of Stella Artois. It's a great beer for those who prefer a lighter, more refreshing taste.
920	234	Michael	3	Stella Artois is a decent beer, but I find it a bit too light for my taste. I prefer something with a bit more flavor.
921	234	Sarah	5	Stella Artois is my favorite beer. It's the perfect beer for any occasion and always leaves me wanting more.
922	235	John Doe	5	Stella Artois is my go-to beer for any occasion. It's smooth, refreshing, and always hits the spot.
923	235	Jane Smith	4	I really enjoy the taste of Stella Artois, but I wish it was a bit cheaper. Otherwise, it's a great beer for a casual night in.
924	235	Michael Brown	3	Stella Artois is a decent beer, but it's not my favorite. I find it a bit too bland and lacking in flavor.
925	235	Emily Davis	5	I love Stella Artois! It's the perfect beer for a summer day, and it always reminds me of good times with friends.
926	236	John	4	This is a great lager for a casual drink with friends. It's not too heavy and has a nice, crisp taste.
927	236	Emily	3	I find this lager to be a bit too watery for my taste. It's not bad, but there are other lagers I prefer.
928	236	Michael	5	This is my go-to lager when I want something easy-drinking and refreshing. It's always a crowd-pleaser.
929	236	Sarah	2	I didn't really enjoy this lager. It tasted bland and lacked any real flavor.
930	239	John	5	This is the best apple cider I've ever had. It's perfect for fall and winter gatherings.
931	239	Emily	4	I really enjoyed the cloudy texture and the natural taste of the apples. It's a great alternative to regular apple cider.
932	239	Michael	3	The Woodgate Cloudy Apple Cider is good, but not great. It's a bit too sweet for my taste.
933	239	Sarah	5	I love the Woodgate Cloudy Apple Cider. It's perfect for sipping on a chilly autumn evening.
934	241	John	4	This is a great lager for the price. It's crisp and refreshing, perfect for a hot summer day.
935	241	Emily	3	Carling Lager is a decent beer, but it's not my favorite. It's a bit too light for my taste.
936	241	Michael	5	I love Carling Lager! It's my go-to beer when I want something light and easy to drink.
937	241	Sarah	2	This beer is just okay. It's not bad, but it's not great either. I prefer other lagers over Carling.
938	242	John	5	This is my favorite beer. It's light and refreshing, perfect for a hot day.
939	242	Jane	4	I like Corona Extra. It's a good beer for a casual gathering with friends.
940	242	Mike	3	Corona Extra is okay. It's not my favorite, but it's not bad.
941	242	Emily	5	I love Corona Extra. It's the perfect beer for a beach day or a backyard barbecue.
942	242	David	2	I don't really like Corona Extra. It's too light and doesn't
946	243	Emily	2	Not a fan of the taste. It's too sweet for my liking.
947	243	David	4	A solid choice for a beer. It's not too heavy and goes down easy.
948	244	John Doe	5	I love Corona! It's my go-to beer for any occasion.
949	244	Jane Smith	4	Corona is a great beer, but it's a bit too light for my taste.
950	244	Mike Johnson	3	Corona is okay, but there are better beers out there.
951	244	Sarah Lee	5	Corona is my favorite beer! I love the refreshing taste.
952	244	David Brown	2	I didn't like Corona at all. It tasted too watery and bland.
953	245	John	5	This is the best stout I've ever had. The taste is rich and smooth, and it's perfect for any occasion.
954	245	Emily	4	I really enjoy Guinness Draught Stout. It's a great beer for sipping and has a nice, creamy texture.
955	245	Michael	3	I'm not a huge fan of stouts, but this one is pretty good. It's not too heavy and has a nice, malty flavor.
956	245	Sarah	5	Guinness Draught Stout is my go-to beer. It's always consistent and has a great, rich flavor.
957	247	John	5	This is the best cider I've ever had. The dark fruit flavor is perfect and it's not too sweet.
958	247	Sarah	4	I really enjoyed the Woodgate Dark Fruit Cider. It's a bit stronger than some other ciders I've tried, but I like that.
959	247	Michael	3	The Woodgate Dark Fruit Cider is okay. It's not my favorite, but it's not bad either. The flavor is a bit too strong for my taste.
960	247	Emily	5	I love the Woodgate Dark Fruit Cider. It's the perfect balance of sweet and tart, and it's great for s
961	248	John	5	This is the best pear cider I've ever had. It's crisp, refreshing, and has just the right amount of sweetness.
962	248	Emily	4	I really enjoyed the Woodgate Pear Cider. It's not too sweet and has a nice, fruity flavor.
963	248	Michael	3	The Woodgate Pear Cider is okay. It's not my favorite, but it's not bad either. It's a bit too sweet for my taste.
964	248	Sarah	5	I love the Woodgate Pear Cider. It's perfect for a hot summer day. It's refreshing and has just the right amount of sweetness.
965	249	John	5	This is the best cider I've ever had. It's smooth, crisp, and has a great apple flavor.
966	249	Sarah	4	I really enjoyed this cider. It's not too sweet and has a nice, natural taste.
967	249	Michael	3	This cider is okay. It's a bit too strong for my taste, but it has a nice, authentic flavor.
968	249	Emily	5	I love this cider! It's perfect for a hot summer day. It's refreshing and has a great apple taste.
969	250	John	5	This cider is amazing! It has a perfect balance of sweetness and tartness. Highly recommend!
970	250	Emily	4	I really enjoyed the Woodgate Dry Amber Cider. It's not too sweet and has a nice, crisp taste.
971	250	Michael	3	The Woodgate Dry Amber Cider is okay. It's not my favorite, but it's not bad either.
972	250	Sarah	5	This cider is the best I've ever had! It's perfect for sipping on a warm summer day.
973	251	John	5	This cider is amazing! It has a perfect balance of sweetness and tartness. Highly recommend it!
974	251	Emily	4	I really enjoyed this cider. It's not too sweet and has a nice, crisp taste. I would definitely buy it again.
975	251	Michael	3	The cider is okay. It's not the best I've had, but it's not bad either. It's a bit too sweet for my taste.
976	251	Sarah	5	This is the best cider I've ever had! It's smooth, flavorful, and has just the right amount of carbonation. Highly recommend!
977	252	John D.	5	This gin is amazing! It has a great flavor and is perfect for making a classic gin and tonic. Highly recommend!
978	252	Emily S.	4	I really enjoyed this gin. It has a smooth taste and is perfect for sipping on its own or in a cocktail. Highly recommend for gin lovers!
979	252	Michael B.	3	This gin is good, but not great. It has a strong juniper flavor, which some may enjoy, but I found it a bit overpowering. Still, it's a solid choice for those who like a traditional gin taste.
980	252	Sarah L.	5	I'm a big fan
981	253	John	5	This gin is amazing! It has a great flavor and is perfect for making a classic gin and tonic. Highly recommend!
982	253	Emily	4	I really enjoyed this gin. It has a unique taste that sets it apart from other gins I've tried. I would definitely buy it again.
983	253	Michael	5	This is hands down the best gin I've ever had. The botanicals used in this gin are top notch and it's perfect for sipping on its own or in a cocktail.
984	253	Sarah	3	I found this gin to be a bit too floral for my taste. However, it'
985	254	John	5	This is the best vodka I've ever tasted. It's smooth and has a great flavor.
986	254	Emily	4	I really like this vodka. It's not too strong and has a nice taste.
987	254	David	3	This vodka is okay. It's not the best I've had, but it's not bad either.
988	254	Sarah	5	I love this vodka! It's perfect for making cocktails.
989	254	Michael	2	This vodka is too strong for my taste. I prefer something
990	255	Jane Doe	5	This is the best gin I've ever tasted. The pink color is so pretty and the flavor is amazing. Highly recommend!
991	255	John Smith	4	I really enjoyed Finton's Pink Gin. It's a bit sweeter than other gins I've tried, but it's still delicious. Great for summer parties!
992	255	Emily Davis	3	I was excited to try Finton's Pink Gin, but I found it to be a bit too sweet for my taste. It's still a good gin, but not my favorite.
993	255	Michael Johnson	5	I love Finton's Pink Gin! It's
994	256	John	5	This is the best vodka I've ever tasted. The raspberry flavor is perfect and it goes down smooth. Highly recommend!
995	256	Sarah	4	I really enjoyed the Ignis Raspberry French Grain Vodka. It has a nice fruity taste without being too sweet. Great for mixing in cocktails!
996	256	Michael	3	The Ignis Raspberry French Grain Vodka is okay. It has a decent flavor but it's not my favorite. I prefer a stronger raspberry taste.
997	256	Emily	5	I love this vodka! The raspberry flavor is perfect and it's great for
998	257	John	5	This is a great whisky. It has a rich, complex flavor that is perfect for sipping slowly and enjoying. Highly recommend!
999	257	Emily	4	I really enjoyed this whisky. It has a smooth, easy-to-drink flavor that is perfect for a nightcap. Highly recommend!
1000	257	Michael	3	This whisky is okay. It has a nice flavor, but it's not as complex as some of the other single malts I've tried. Not bad, but not great.
1001	257	Sarah	5	This is my new favorite whisky. It has a rich, complex flavor that is perfect for sipping
1002	258	John	5	This is a fantastic Islay single malt. It has a rich, smoky flavor with a hint of peat. Highly recommended for any whisky lover.
1003	258	Emily	4	I really enjoyed this whisky. It has a complex flavor profile with a nice balance of sweet and smoky notes. I would definitely buy it again.
1004	258	David	3	This whisky is okay, but not my favorite. It's a bit too smoky for my taste. I prefer a lighter, sweeter whisky.
1005	258	Sarah	5	I love this Islay single malt. It's got a great smoky flavor
1006	259	John	5	This is a great scotch whisky. It has a rich, complex flavor that is perfect for sipping slowly and enjoying. Highly recommend!
1007	259	Emily	4	I really enjoyed this scotch whisky. It has a smooth, slightly sweet taste that is perfect for sipping on a cold night. Highly recommend!
1008	259	Michael	3	This scotch whisky is okay. It has a strong, smoky flavor that is not for everyone. I prefer a smoother, sweeter scotch.
1009	259	Sarah	5	This is my favorite scotch whisky. It has a rich, complex flavor that
1010	260	John	5	This is the best peated malt whisky I've ever tasted. The smoky flavor is perfect and the finish is smooth and long-lasting.
1011	260	Emily	4	I really enjoyed the complexity of this whisky. The peatiness is balanced well with the sweetness, making it a great sipping whisky.
1012	260	David	3	This whisky has a nice smoky flavor, but it's a bit too harsh for my taste. I prefer a smoother, more mellow whisky.
1013	260	Sarah	5	I love the depth of flavor in this whisky. The peatiness is rich and complex
1014	261	John	5	This is the best brandy I have ever tasted. It has a rich, complex flavor that is perfect for sipping on special occasions.
1015	261	Emily	4	I really enjoyed this brandy. It has a smooth, mellow taste that is perfect for sipping after dinner. The price is a bit high, but it's worth it for the quality.
1016	261	Michael	3	This brandy is okay, but not great. It has a strong alcohol taste that is a bit overpowering. I prefer a smoother brandy.
1017	261	Sarah	5	I love this brandy! It has a rich, complex flavor that is perfect for s
1018	262	Jane Doe	5	This is the best gin liqueur I've ever tasted. The rhubarb and ginger flavors are perfectly balanced and it's great in cocktails or on its own.
1019	262	John Smith	4	I really enjoy the rhubarb and ginger combination in this gin liqueur. It's a bit sweet for my taste, but still very tasty.
1020	262	Sarah Lee	5	I love using this gin liqueur in my cocktails. It adds a unique and delicious flavor that my friends always rave about.
1021	262	David Kim	3	This gin liqueur is okay
1022	263	John	5	This gin is amazing! The rhubarb and ginger flavors are perfectly balanced and make for a delicious drink. Highly recommend!
1023	263	Emily	4	I really enjoyed this gin. The rhubarb and ginger flavors are unique and add a nice twist to a classic gin and tonic. Would definitely buy again.
1024	263	Michael	3	This gin is okay. The rhubarb and ginger flavors are present, but not overpowering. It's a nice change of pace from traditional gin, but not something I would rush to buy again.
1025	263	Sarah	5	I love this gin! The rhub
1026	264	Jane Doe	5	This is the best gin and tonic I've ever had. The pink color is so pretty and the flavor is amazing. Highly recommend!
1027	264	John Smith	4	I really enjoyed this gin and tonic. It's a bit sweeter than some others I've tried, but it's still very tasty. I would definitely buy it again.
1028	264	Sarah Lee	3	This gin and tonic is okay. It's not my favorite, but it's not bad either. The pink color is nice, but the flavor is a bit too sweet for my taste.
1029	264	David Kim	5	I love
1030	265	John	5	This is the best gin and lemonade I've ever had. The flavor is perfect and it's not too sweet. Highly recommend!
1031	265	Emily	4	I really enjoyed this gin and lemonade. It's not too strong and has a nice balance of flavors. I would definitely buy it again.
1032	265	Michael	3	This gin and lemonade is okay. It's not my favorite but it's not bad either. It's a bit too sweet for my taste.
1033	265	Sarah	5	I love this gin and lemonade! It's perfect for a summer evening. The pink
1034	266	John D.	4	This is a great bourbon whiskey. It has a smooth taste and a nice finish. I would definitely recommend it to anyone who enjoys a good bourbon.
1035	266	Sarah L.	5	I love Western Gold Bourbon Whiskey! It's my go-to for sipping on the rocks or in a cocktail. The flavor is rich and complex, and it goes down smooth.
1036	266	Michael B.	3	I was disappointed with Western Gold Bourbon Whiskey. It was too sweet for my taste and lacked the depth of flavor I was expecting. I won't be buying it again.
1037	266	Emily S.	5	This is my favorite bourbon
1038	268	John	4	This is a great whisky for the price. It has a smooth taste and a nice finish. I would definitely recommend it to anyone looking for a good blended scotch.
1039	268	Emily	3	I found this whisky to be a bit too sweet for my taste. It also didn't have the complexity that I look for in a scotch. However, it's still a decent option for the price.
1040	268	David	5	I'm a big fan of Balmuir 3-Year Blended Scotch Whisky. It's a great everyday whisky that's easy to drink and has a nice, rich flavor. I highly recommend it to anyone who enjoys a good blended scotch.
1041	269	John	4	This is a great whisky for the price. It has a smooth taste and is perfect for sipping on a cold night.
1042	269	Sarah	3	I found this whisky to be a bit too sweet for my taste. It's not bad, but I prefer something with a bit more complexity.
1043	269	Michael	5	This is my go-to whisky. It's smooth, easy to drink, and has a great flavor. Highly recommend!
1044	269	Emily	2	I didn't really like this whisky. It was too harsh and had a strong alcohol taste.
1045	270	John	4	This is a great whisky for the price. It has a smooth taste and is perfect for sipping on a cold night.
1046	270	Emily	3	I found this whisky to be a bit too sweet for my taste. It's not bad, but I prefer something with a bit more complexity.
1047	270	Michael	5	This is my go-to whisky. It's smooth, easy to drink, and has a great flavor. Highly recommend!
1048	270	Sarah	2	I didn't really like this whisky. It was too harsh and had a strong alcohol taste.
1049	271	John D.	5	These sponge cloths are amazing! They clean everything so easily and are so much more eco-friendly than traditional sponges. Highly recommend!
1050	271	Emily S.	4	I love these sponge cloths! They're so versatile and work great for cleaning all sorts of surfaces. The only downside is that they can get a bit smelly after a while, but a good rinse and they're as good as new.
1051	271	Michael T.	5	These sponge cloths are a game-changer! They're so much more effective than traditional sponges and are so much easier to use. Plus, they're eco-friendly, which is a huge plus. Highly recommend!
1052	272	John D.	5	This cleaner is amazing! It cleans everything from countertops to floors with ease. Highly recommend!
1053	272	Sarah L.	4	I love this cleaner! It's versatile and works well on a variety of surfaces. The only downside is the smell, but it's not too bad.
1054	272	Michael M.	5	This is the best all-purpose cleaner I've ever used. It's powerful, effective, and leaves no residue behind. Highly recommend!
1055	272	Emily P.	3	This cleaner works okay, but it's not as effective as I had hoped. It takes a lot of effort to get st
1056	273	John D.	5	These sponge scourers are amazing! They clean my pots and pans so easily and efficiently. Highly recommend!
1057	273	Sarah L.	4	I love these sponge scourers! They're so much better than the old-fashioned sponges I used to use. They clean my dishes so much faster and more effectively.
1058	273	Michael T.	3	These sponge scourers are okay. They do a decent job of cleaning my dishes, but they don't seem to last very long. I have to replace them more often than I'd like.
1059	273	Emily S.	5	I'm so glad I found these
1060	274	John D.	5	This cleaner is amazing! It got rid of all the limescale and degreased my kitchen in no time. Highly recommend!
1061	274	Sarah L.	4	I love this cleaner! It's so versatile and works great on all my surfaces. The only downside is that it's a bit pricey.
1062	274	Michael M.	5	This is the best limescale and degreaser cleaner I've ever used. It's so easy to use and it really gets the job done. Highly recommend!
1063	274	Emily S.	3	The cleaner works well, but it's a bit
1064	275	John	5	These dishcloths are amazing! They are so absorbent and durable. I love using them to clean up spills and messes in the kitchen.
1065	275	Emily	4	I really like these dishcloths. They are soft and easy to use. The only downside is that they don't seem to last as long as I had hoped.
1066	275	Michael	5	These are the best dishcloths I've ever used. They are so versatile and can be used for so many different tasks. I highly recommend them to anyone looking for a great dishcloth.
1067	275	Sarah	3	These dishcloths are okay. They do the job, but
1068	276	John D.	5	This bleach is amazing! It's so thick and powerful that it gets the job done in no time. Highly recommend!
1069	276	Sarah L.	4	I've tried a lot of bleaches, but this one is definitely one of the best. It's not too harsh on my hair and it gets the job done quickly. Only downside is the smell, but that's to be expected with bleach.
1070	276	Michael C.	5	I've been using this bleach for years and I'll never switch. It's so easy to use and it always gives me the results I want. Highly recommend!
1071	276	Emily P.	3	
1072	277	John D.	5	This cleaner is amazing! It cleans everything in my house and leaves no residue behind. Highly recommend!
1073	277	Sarah L.	4	I love this cleaner! It works great on all surfaces and doesn't have a strong smell like some other cleaners. Only downside is that it's a bit pricey.
1074	277	Michael M.	5	I've tried a lot of cleaners and this one is by far the best. It's versatile, effective, and doesn't harm my surfaces. Definitely worth the investment.
1075	277	Emily P.	3	This cleaner is okay. It does the job, but I've found other cleaners
1076	278	John	5	This dishwasher cleaning liquid is amazing! It leaves my dishes spotless and my dishwasher smelling fresh.
1077	278	Sarah	4	I've been using this product for a few months now and it has definitely improved the cleanliness of my dishes. The only downside is that it's a bit pricey.
1078	278	Michael	3	This dishwasher cleaning liquid works okay, but I've found that it doesn't always get my dishes as clean as I'd like. I might try a different brand next time.
1079	278	Emily	5	I love this dishwasher cleaning liquid! It's so easy to
1080	279	John	5	This is the best toilet cleaner I've ever used. It's so easy to use and it leaves my toilet looking spotless.
1081	279	Sarah	4	I really like this toilet cleaner. It does a great job of getting rid of stains and it doesn't have a strong smell.
1082	279	Michael	3	This toilet cleaner works okay, but it doesn't seem to last very long. I have to use it more often than I'd like.
1083	279	Emily	5	I'm so glad I found this toilet cleaner. It's made my bathroom so much cleaner and it's so easy to use.
1084	280	John	5	I've been using this washing powder for a while now and I'm really happy with the results. It's gentle on my clothes and leaves them smelling fresh.
1085	280	Emily	4	This washing powder works well for my sensitive skin. It doesn't irritate me and my clothes come out clean and soft.
1086	280	David	3	I like the fact that this washing powder is non-bio, but I find that it doesn't clean my clothes as well as other powders I've tried. It's still a good option for those with sensitive skin though.
1087	280	Sarah	5	I've been using this washing powder for a
1088	281	John	5	I love this product! It's so convenient to use and the lavender scent is soothing.
1089	281	Emily	4	This product is great for on-the-go. The lavender scent is subtle and calming.
1090	281	David	3	The product works well, but the lavender scent is too strong for my liking.
1091	281	Sarah	5	I've tried many similar products, but this one is by far the best. The lavender scent is just right.
1092	281	Michael	2	The product didn
1093	282	John D.	5	This product is amazing! It removed all the stains from my clothes in no time. Highly recommend it.
1094	282	Emily S.	4	I was skeptical at first, but this product really works! It's easy to use and the results are impressive.
1095	282	Michael W.	3	It's okay. It did remove some stains, but not all of them. I think it could be better.
1096	282	Sarah L.	5	I love this product! It's so convenient and it really gets out even the toughest stains. Highly recommend!
1097	283	John D.	5	I've been using Formil Laundry Gel Assorted for a while now and I'm really happy with the results. It's great for removing tough stains and the fragrance is amazing. Highly recommend!
1098	283	Emily L.	4	I like the Formil Laundry Gel Assorted. It's easy to use and works well on most stains. The only downside is that it's a bit expensive compared to other laundry detergents.
1099	283	Michael S.	5	I've tried a lot of different laundry detergents, but Formil Laundry Gel Assorted is by far the best. It gets my clothes super clean and the fragrance lasts for days. Definitely worth the price.
1100	284	John	5	This air freshener is amazing! It lasts for a long time and the scent is so refreshing. Highly recommend!
1101	284	Emily	4	I love the variety of scents that come with this pack. They all smell great and last for a good amount of time. Only downside is that the scent can be a bit overpowering at times.
1102	284	Michael	5	These air fresheners are a game changer! They make my car smell so good and the scent lasts for weeks. Highly recommend!
1103	284	Sarah	3	The air freshener works well, but the scents are not as strong as I would like. They also don
1104	285	John	5	This air freshener is amazing! It lasts for a long time and the scent is so refreshing.
1105	285	Emily	4	I like this air freshener, but it doesn't last as long as I hoped. Still, it's a good value for the price.
1106	285	Michael	3	The scent is nice, but it doesn't cover up bad smells as well as I would like. Still, it's better than nothing.
1107	285	Sarah	5	This is the best air freshener I've ever used! The scent is so strong and lasts for weeks.
1108	286	John	5	This air freshener works great! It lasts a long time and the scent is amazing. Highly recommend!
1109	286	Emily	4	I love the variety of scents that come with this air freshener. It's perfect for different rooms in my house. The only downside is that it doesn't last as long as I hoped.
1110	286	Michael	3	The air freshener does its job, but the scent isn't very strong. I had to use multiple bottles to get the desired effect.
1111	286	Sarah	5	This is the best air freshener I've ever used. The scent is so refreshing and it last
1112	287	John	5	This air freshener refill is amazing! It lasts for a long time and the scent is so refreshing. Highly recommend!
1113	287	Emily	4	I love the convenience of this air freshener refill. It's easy to use and the scent is pleasant. The only downside is that it doesn't last as long as I hoped.
1114	287	David	3	The W5 Plug In Airfreshener refill works okay, but I've found that it doesn't cover up bad smells as effectively as I would like. It's not a bad product, but there are better options out there.
1115	288	Jane Doe	5	I love this reed diffuser! The scent is amazing and it lasts for a long time. The balls are a nice touch and add a bit of flair to the room.
1116	288	John Smith	4	This reed diffuser is great for adding a subtle scent to my home. The balls are a unique feature that I haven't seen before and I like the way they look. The only downside is that the scent doesn't last as long as I would like.
1117	288	Sarah Lee	5	I'm really happy with this reed diffuser. The scent is strong and lasts for a long time. The balls are a nice touch and add a bit of elegance to the diffuser. I would definitely recommend this product to others.
1118	289	John D.	5	This is the best glass cleaner I've ever used. It leaves no streaks and is easy to use.
1119	289	Sarah L.	4	I love the scent of this cleaner. It makes my bathroom smell fresh and clean.
1120	289	Michael M.	3	This cleaner works well, but it's a bit expensive for what it is.
1121	289	Emily S.	5	I've tried a lot of different glass cleaners, and this one is by far the best. It's easy to use and works great.
1122	290	John D.	5	This cleaner is amazing! It's so effective at killing germs and leaving a fresh scent. I use it everywhere in my home.
1123	290	Sarah L.	4	I love the W5 cleaner! It's great for cleaning my kitchen counters and bathroom surfaces. It's also safe for my kids and pets.
1124	290	Michael M.	3	The W5 cleaner works well, but I find it a bit pricey. I might try a different brand next time.
1125	290	Emily S.	5	I'm so glad I found this cleaner! It's made my home so much cleaner and fresher. I recommend it to everyone
1126	291	John D.	5	This furniture polish is amazing! It leaves my wood furniture looking brand new and the scent is so pleasant.
1127	291	Emily S.	4	I really like this furniture polish. It works well and lasts a long time. The only downside is that it takes a bit of elbow grease to get it to work properly.
1128	291	Michael B.	5	I've tried a lot of furniture polishes over the years, but this one is by far the best. It's easy to use and the results are incredible. Highly recommend!
1129	291	Sarah L.	3	This furniture polish is okay. It does the job, but it's not the best I'
1130	292	John	5	These dishwasher tablets are amazing! They leave my dishes spotless and the lemon scent is so refreshing.
1131	292	Emily	4	I really like these dishwasher tablets. They work well and the lemon scent is nice, but I wish they were a bit cheaper.
1132	292	Michael	5	These are the best dishwasher tablets I've ever used. They get my dishes clean and the lemon scent is so invigorating.
1133	292	Sarah	3	These dishwasher tablets are okay. They do a decent job of cleaning my dishes, but the lemon scent is not very strong.
1134	293	John Doe	5	I've been using the W5 Rinse Aid for a few weeks now and it has made a huge difference in the quality of my dishes. They come out spotless and without any residue.
1135	293	Jane Smith	4	The W5 Rinse Aid works well, but I have noticed that it doesn't last as long as other rinse aids I've used in the past. Still, it's worth the price.
1136	293	Mike Johnson	5	I love the W5 Rinse Aid! It's made my dishwashing routine so much easier and more efficient. Highly recommend!
1137	293	Emily Davis	3	The
1138	294	John Doe	5	This dishwasher salt is the best I've ever used. It dissolves quickly and efficiently, leaving my dishes spotless.
1139	294	Jane Smith	4	I've been using this dishwasher salt for a few months now and it's definitely improved the performance of my dishwasher. My dishes are cleaner and I don't have to run the dishwasher as many times.
1182	306	Jane Doe	5	My cat loves this food! It's high quality and I can tell she's healthier since switching to this brand.
1140	294	Mike Johnson	3	This dishwasher salt is okay, but I don't think it's any better than the other brands I've tried. It does the job, but I don't notice a significant difference in the cleanliness of my dishes.
1141	295	Jane Doe	5	I absolutely love this diffuser! The scent is amazing and it lasts for a long time. Highly recommend!
1142	295	John Smith	4	The Luxury Collection Reed Diffuser is a great product. The scent is strong and lasts for a long time. The only downside is that it's a bit pricey.
1143	295	Emily Johnson	5	I bought this diffuser as a gift for my sister and she absolutely loved it! The scent is so luxurious and it really makes the room feel special. Highly recommend!
1144	295	Michael Brown	3	The Luxury Collection Reed Diffuser is a nice product, but I found that the scent didn't last as long
1145	296	John D.	5	These refuse sacks are great! They are very durable and can hold a lot of weight. I've been using them for a while now and they are still going strong. Highly recommend!
1146	296	Sarah L.	4	I like these refuse sacks. They are strong and hold up well. The only downside is that they are a bit expensive, but they are worth it in the long run.
1147	296	Michael T.	5	These are the best refuse sacks I've ever used. They are so strong and durable, and they hold up well even when filled to the brim. Highly recommend!
1148	296	Emily K.	3	These refuse sacks are
1149	297	John D.	5	These drawstring refuse sacks are perfect for my small kitchen trash can. They are strong and durable, and the black color hides any stains or odors. Highly recommend!
1150	297	Sarah L.	4	I love the convenience of these drawstring sacks. They are easy to use and hold up well over time. The only downside is that they are a bit small, so I have to use multiple bags for larger items.
1151	297	Michael C.	5	These sacks are great for both indoor and outdoor use. They are sturdy and waterproof, which is perfect for my outdoor trash cans. I also like that they come in a pack of 40, so I don't have to worry about running out anytime soon.
1152	298	John D.	5	These sacks are great for organizing my recyclables. They're sturdy and easy to use.
1153	298	Sarah L.	4	I like the design of these sacks. They're easy to tie and hold up well. The only downside is that they're a bit small.
1154	298	Michael W.	5	These sacks are perfect for my recycling needs. They're durable and easy to use. Highly recommend!
1155	298	Emily K.	3	The sacks are okay, but I wish they were a bit bigger. They also tend to tear easily.
1156	299	John D.	5	These caddy liners are great! They are biodegradable and eco-friendly, which is important to me. They also fit perfectly in my kitchen trash can and are strong enough to hold even heavy items. Highly recommend!
1157	299	Emily L.	4	I love these caddy liners! They are so convenient and make cleaning up so much easier. They are also biodegradable, which is a plus. The only downside is that they can be a bit pricey, but I think it's worth it for the convenience and peace of mind.
1158	299	Michael S.	5	These are the best caddy liners I've ever used! They are strong, durable, and fit perfectly in my trash can. I also appreciate that they are biodegradable
1159	300	John	5	This foil is great! It's strong and doesn't tear easily. I've been using it for a while now and it's still going strong.
1160	300	Emily	4	I like this foil because it's non-stick and easy to use. It's also a good price for the quality.
1161	300	Mike	3	This foil is okay. It does the job, but it's not the best I've used. It tears easily and doesn't last as long as other brands.
1162	300	Sarah	5	I love this foil! It's so convenient for cooking and cleaning up afterwards. I highly recommend it.
1163	301	John	5	These bags are great! They keep my food fresh for longer and they're easy to use. Highly recommend!
1164	301	Emily	4	I love these bags! They're perfect for storing leftovers and they're so much better than plastic wrap. The only downside is that they're a bit pricey.
1165	301	Mike	5	These are the best food storage bags I've ever used. They're sturdy, leak-proof, and they come in a variety of sizes. Highly recommend!
1166	301	Sarah	3	These bags are okay. They do the job, but they're not the best quality. I've
1167	302	John D.	5	These bags are amazing! They keep my food fresh for longer and they're so easy to use. Highly recommend!
1168	302	Emily S.	4	I love these bags! They're great for freezing leftovers and they're so much better than the plastic bags I used to use. The only downside is that they're a bit more expensive.
1169	302	Michael L.	5	These are the best freezer bags I've ever used. They're so durable and they keep my food fresh for weeks. I'll never go back to regular plastic bags again!
1170	302	Sarah P.	3	These bags are okay, but I don
1171	303	John	5	These sandwich bags are great! They are sturdy and keep my sandwiches fresh. I love the variety of colors too.
1172	303	Emily	4	I like these sandwich bags because they are reusable and eco-friendly. The only downside is that they can be a bit tricky to open sometimes.
1173	303	Michael	5	These are the best sandwich bags I've ever used. They are so much better than plastic bags and they come in a variety of sizes.
1174	303	Sarah	3	These sandwich bags are okay. They do the job, but they aren't the best quality. I've had some leak before.
1175	304	Jane D.	5	My cats love this food! They are very picky eaters, but they can't get enough of Coshida Premium Cat Food. I also appreciate that it's made with high-quality ingredients and is free from artificial preservatives and additives.
1176	304	John S.	4	I've been feeding my cat Coshida Premium Cat Food for a few months now and he seems to be in good health. The food is also easy to digest and doesn't cause any tummy troubles. The only downside is the price, but I think it's worth it for the quality of the food.
1177	304	Emily M.	5	I'm so glad I switched my cat to Coshida Premium Cat Food. He used to be underweight and always seemed hungry
1178	305	Jane D.	5	My cat loves this food! It's a great variety and she seems to enjoy each flavor. I also like that it's made with high-quality ingredients.
1179	305	John S.	4	This cat food is a good option for my picky cat. She seems to enjoy the different flavors and it's nice to have a variety. I wish there were more flavors, though.
1180	305	Emily K.	5	I'm so glad I found this cat food! My cat has a sensitive stomach and this food doesn't seem to bother her at all. She also loves the different flavors.
1181	305	Michael W.	3	This cat food is okay, but not great
1183	306	John Smith	4	This food is great for my cat's coat and energy levels. The only downside is the price, but it's worth it for the quality.
1184	306	Sarah Lee	5	I've tried a lot of cat foods, but this is by far the best. My cat is so much happier and healthier since I started feeding her this.
1185	306	David Nguyen	3	My cat seems to like this food, but I'm not sure if it's worth the price.
1186	307	Jane Doe	5	My cat loves these chunks! They are high quality and very nutritious. Highly recommend!
1187	307	John Smith	4	My cat seems to enjoy these chunks. They are a bit pricey but seem to be worth it for the quality.
1188	307	Sarah Lee	3	My cat is picky and didn't seem to like these chunks. They are high quality but not worth the price if your cat won't eat them.
1189	307	David Nguyen	5	These chunks are the best! My cat is healthy and happy since I started feeding her this food.
1190	308	Jane D.	5	My cats love these pouches! They're a great convenience for me and my cats seem to enjoy the variety of flavors.
1191	308	John S.	4	These pouches are a good option for my cats. They seem to be getting the nutrition they need and I like that they come in different flavors.
1192	308	Emily K.	3	The pouches are okay, but I wish there were more variety in the flavors. My cats seem to get bored with the same flavors after a while.
1193	308	Michael W.	5	I'm really happy with these pouches. My cats are picky eaters, but they all seem to love these flavors. The
1194	309	John	5	My dog loves this food! He's so energetic and healthy since I started feeding him this brand.
1195	309	Emily	4	I like this food because it has a good mix of different meats and grains. My dog seems to be doing well on it.
1196	309	Mike	3	The food is okay, but I wish there were more options for different sizes of dogs. My small dog seems to be getting full too quickly.
1197	309	Sarah	5	I've tried a lot of different dog foods, but this is the first one that my dog has really loved. He's so excited to eat his meals now!
1198	310	John	5	My dog loves this food! He's so energetic and healthy since I started feeding him this.
1199	310	Emily	4	This food is great for my dog's coat and skin. He's not as itchy as he used to be.
1200	310	Mike	3	My dog seems to like the food, but I'm not sure if it's worth the price. I might try a different brand next time.
1201	310	Sarah	5	I've tried a lot of different dog foods, but this is the one my dog seems to like the most. He's always excited to eat it!
1202	311	John	5	This is the best dog food I've ever bought. My dog loves it and it's very affordable.
1203	311	Emily	4	My dog seems to enjoy this food, but I wish it came in a larger size.
1204	311	Michael	3	The food is okay, but it's not the best I've tried. My dog seems to be doing alright on it though.
1205	311	Sarah	5	I've been using this food for years and my dogs always seem to be healthy and happy on it.
1206	311	David	2	My dog didn't like this
1207	312	John	5	This is the best dog food I've ever bought. My dog loves it and it's really good quality.
1208	312	Emily	4	My dog seems to enjoy this food and it's definitely better than what we were using before. I just wish it wasn't so expensive.
1209	312	Michael	5	I've been using this food for my dog for a while now and he's in great health. I highly recommend it.
1210	312	Sarah	3	My dog seems to like this food but I'm not sure if it's worth the price. I might try something else next time.
1211	313	John	5	My dog loves this food! He's so much more energetic and healthy since I switched to this brand.
1212	313	Emily	4	This food is great for my dog's sensitive stomach. He hasn't had any issues since I started feeding him this brand.
1213	313	Michael	3	The food is okay, but I wish there were more flavor options for my dog.
1214	313	Sarah	5	I love that this food is made with natural ingredients and no artificial preservatives. My dog is thriving on this food!
1215	313	David	2	My dog didn't
1216	314	Jane D.	5	My cats love these chew sticks! They last a long time and seem to be durable. I'm happy with the purchase.
1217	314	John S.	4	These chew sticks are a great alternative to traditional cat toys. They seem to be more durable and my cats enjoy them. Highly recommend!
1218	314	Emily K.	3	The chew sticks are okay. They seem to be of decent quality, but my cats don't seem to be as interested in them as I thought they would be. Not a bad purchase, but not the best either.
1219	314	Michael W.	5	These chew sticks are a lifesaver! My cats have destroyed so many toys,
1220	315	Jane Doe	5	My dog loves these snacks! They are a great treat for him and he gets so excited when I give them to him.
1221	315	John Smith	4	These snacks are a good option for my dog, but they could be a bit more varied in terms of flavors.
1222	315	Sarah Lee	5	I'm so glad I found these snacks! My dog has a sensitive stomach and these don't seem to bother him at all.
1223	315	David Williams	3	The snacks are okay, but I feel like they could be better quality for the price.
1224	316	Happy Dog Owner	5	My dog loves these meaty strips! They are a great treat and he can't get enough of them.
1225	316	Satisfied Customer	4	These meaty strips are a great alternative to traditional dog treats. My dog enjoys them and they seem to be of good quality.
1226	316	Disappointed	2	My dog didn't seem to like these meaty strips at all. They also seemed to be of lower quality than other treats I've bought.
1227	316	Value Buy	5	These meaty strips are a great value for the price. My dog loves them and they last a long time.
1228	317	Happy Dog Owner	5	My dog loves these pig ears! They are a great treat and last a long time. Highly recommend!
1229	317	Skeptical Pet Parent	4	I was hesitant to try these, but my dog seems to enjoy them. They are a good size and seem to last a while. I'm happy with the purchase.
1230	317	Disappointed Customer	2	These pig ears were not as good as I had hoped. They were small and didn't last very long. My dog didn't seem to enjoy them much either.
1231	317	Value-conscious Shopper	3	These pig ears are a good price, but I wish they were bigger
1232	318	John	5	These dental sticks are amazing! My dog's teeth are so much cleaner and healthier after using them.
1233	318	Emily	4	My dog loves the taste of these dental sticks. They're a great way to keep his teeth clean and healthy.
1234	318	Michael	3	These dental sticks are okay. They do help with my dog's teeth, but he doesn't seem to enjoy the taste as much as other treats.
1235	318	Sarah	5	I'm so glad I found these dental sticks! My dog's breath is so much better and his teeth look great.
\.


--
-- TOC entry 5039 (class 0 OID 16468)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: grocery_user
--

COPY public.users (id, username, email, password, fav_products, purchased_products, avatar) FROM stdin;
3	testing_sqlite	testing_sqlite@gmail.com	scrypt:32768:8:1$ONPiHNaTT0AT6tXl$e94a9bda1b3b05339b2f1975a791c210068262f3b1eb9a14e5ee65af67bb17121646255f940172a1a51524afddbb06441613794a2a556bc393abc0644155cdf0	1,2	1,2	user_3_image.png
4	testing	testing@gmail.com	scrypt:32768:8:1$XbXY7BTk3hYQ3EXx$e2538a21d96c8152e75b8861ce5cd0e8cb627ee6ec826157eb734fde1b2a134d170a0801d6d68b90d3a1b00fdf24413dde8f5418aa8d19465603b9c1f615d709	1,2,3	1,2,3	user_4_pendo.png
\.


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 223
-- Name: basket_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocery_user
--

SELECT pg_catalog.setval('public.basket_items_id_seq', 1, false);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocery_user
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 225
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocery_user
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grocery_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4885 (class 2606 OID 16507)
-- Name: basket_items basket_items_pkey; Type: CONSTRAINT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.basket_items
    ADD CONSTRAINT basket_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4883 (class 2606 OID 16496)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 16530)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 16483)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4881 (class 2606 OID 16481)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4888 (class 2606 OID 16508)
-- Name: basket_items basket_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.basket_items
    ADD CONSTRAINT basket_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4889 (class 2606 OID 16513)
-- Name: basket_items basket_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.basket_items
    ADD CONSTRAINT basket_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4890 (class 2606 OID 16531)
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grocery_user
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: grocery_user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2026-04-09 23:26:28

--
-- PostgreSQL database dump complete
--

\unrestrict qaMlhbXW1yoq07NANrbcQ5aYLjzIZjZhxAlBOchumiUM3oMSd5WlddmPdIW0tqX

