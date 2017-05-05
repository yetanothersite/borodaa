--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO borodaa;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO borodaa;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO borodaa;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO borodaa;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO borodaa;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO borodaa;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO borodaa;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO borodaa;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO borodaa;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO borodaa;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO borodaa;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO borodaa;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO borodaa;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO borodaa;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO borodaa;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO borodaa;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO borodaa;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO borodaa;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO borodaa;

--
-- Name: yet_another_site_lead; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE yet_another_site_lead (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.yet_another_site_lead OWNER TO borodaa;

--
-- Name: yet_another_site_lead_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE yet_another_site_lead_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yet_another_site_lead_id_seq OWNER TO borodaa;

--
-- Name: yet_another_site_lead_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE yet_another_site_lead_id_seq OWNED BY yet_another_site_lead.id;


--
-- Name: yet_another_site_nomenclature; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE yet_another_site_nomenclature (
    id integer NOT NULL,
    descr character varying(255) NOT NULL,
    is_tested boolean NOT NULL,
    category character varying(1) NOT NULL,
    sku integer,
    cover_id integer,
    CONSTRAINT yet_another_site_nomenclature_sku_check CHECK ((sku >= 0))
);


ALTER TABLE public.yet_another_site_nomenclature OWNER TO borodaa;

--
-- Name: yet_another_site_nomenclature_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE yet_another_site_nomenclature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yet_another_site_nomenclature_id_seq OWNER TO borodaa;

--
-- Name: yet_another_site_nomenclature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE yet_another_site_nomenclature_id_seq OWNED BY yet_another_site_nomenclature.id;


--
-- Name: yet_another_site_picture; Type: TABLE; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE TABLE yet_another_site_picture (
    id integer NOT NULL,
    descr character varying(255) NOT NULL,
    nomenclature_id integer NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.yet_another_site_picture OWNER TO borodaa;

--
-- Name: yet_another_site_picture_id_seq; Type: SEQUENCE; Schema: public; Owner: borodaa
--

CREATE SEQUENCE yet_another_site_picture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.yet_another_site_picture_id_seq OWNER TO borodaa;

--
-- Name: yet_another_site_picture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: borodaa
--

ALTER SEQUENCE yet_another_site_picture_id_seq OWNED BY yet_another_site_picture.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY yet_another_site_lead ALTER COLUMN id SET DEFAULT nextval('yet_another_site_lead_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY yet_another_site_nomenclature ALTER COLUMN id SET DEFAULT nextval('yet_another_site_nomenclature_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY yet_another_site_picture ALTER COLUMN id SET DEFAULT nextval('yet_another_site_picture_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add lead	7	add_lead
20	Can change lead	7	change_lead
21	Can delete lead	7	delete_lead
22	Can add nomenclature	8	add_nomenclature
23	Can change nomenclature	8	change_nomenclature
24	Can delete nomenclature	8	delete_nomenclature
25	Can add picture	9	add_picture
26	Can change picture	9	change_picture
27	Can delete picture	9	delete_picture
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('auth_permission_id_seq', 27, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$36000$QL5ssx4raRTY$Ec7TXvjy5R7K/M1UQgGrBm+fKumKeubi4PJ8eljGmpw=	2017-04-09 15:13:39.179943+00	t	vagrant			vagrant@vagrant.vagrant	t	t	2017-04-09 14:56:36.048541+00
4	pbkdf2_sha256$36000$epV0i8qnUJR1$3n2f7X2gRjQne3N+SAQzpjOr7fFDUQ7qaEbIxT3N2Hs=	2017-04-20 02:25:53.861161+00	t	webmaster			webmaster@fake.fake	t	t	2017-04-09 15:15:12.120517+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-04-09 14:59:38.688113+00	1	webmaster	3		4	2
2	2017-04-09 15:00:53.08612+00	3	webmaster	1	[{"added": {}}]	4	2
3	2017-04-09 15:14:04.408493+00	3	webmaster	3		4	2
4	2017-04-09 18:59:31.736755+00	1	1 Nomenclature 100	1	[{"added": {}}, {"added": {"object": "1 Picture 100/1", "name": "picture"}}, {"added": {"object": "2 Picture 100/2", "name": "picture"}}, {"added": {"object": "3 Picture 100/3", "name": "picture"}}]	8	4
5	2017-04-15 05:11:17.873162+00	1	1 Nomenclature 100	2	[]	8	4
6	2017-04-15 05:12:27.327872+00	1	1 Nomenclature 100	2	[{"changed": {"fields": ["image"], "object": "1 Picture 100/1", "name": "picture"}}, {"changed": {"fields": ["image"], "object": "2 Picture 100/2", "name": "picture"}}, {"changed": {"fields": ["image"], "object": "3 Picture 100/3", "name": "picture"}}]	8	4
7	2017-04-15 05:25:59.578273+00	1	1 Nomenclature 100	2	[{"changed": {"fields": ["image"], "object": "1 Picture 100/1", "name": "picture"}}, {"changed": {"fields": ["image"], "object": "2 Picture 100/2", "name": "picture"}}, {"changed": {"fields": ["image"], "object": "3 Picture 100/3", "name": "picture"}}]	8	4
8	2017-04-15 06:04:57.333952+00	1	1 Nomenclature 100	3		8	4
9	2017-04-15 06:09:41.993235+00	2	2 Contraption A100	1	[{"added": {}}, {"added": {"name": "picture", "object": "4 Picture 1-100"}}]	8	4
10	2017-04-15 06:10:17.815145+00	2	2 Contraption A100	2	[{"added": {"name": "picture", "object": "5 Picture 2-100"}}, {"added": {"name": "picture", "object": "6 Picture 3-100"}}]	8	4
11	2017-04-15 06:14:11.459882+00	3	3 Contraption B200	1	[{"added": {}}, {"added": {"name": "picture", "object": "7 Picture 1-200"}}, {"added": {"name": "picture", "object": "8 Picture 2-200"}}, {"added": {"name": "picture", "object": "9 Picture 3-200"}}]	8	4
12	2017-04-15 06:38:03.764518+00	4	4 Contraption C300	1	[{"added": {}}, {"added": {"name": "picture", "object": "10 Picture 1-300"}}, {"added": {"name": "picture", "object": "11 Picture 2-300"}}, {"added": {"name": "picture", "object": "12 Picture 3-300"}}]	8	4
13	2017-04-15 07:31:13.233373+00	4	4 Contraption C300	2	[]	8	4
14	2017-04-15 13:35:39.640295+00	5	5 etc	1	[{"added": {}}]	8	4
15	2017-04-15 13:36:12.071046+00	5	5 etc	2	[]	8	4
16	2017-04-15 13:51:32.145386+00	4	4 Contraption C300	2	[{"changed": {"fields": ["cover"]}}]	8	4
17	2017-04-15 13:51:37.820344+00	2	2 Contraption A100	2	[{"changed": {"fields": ["cover"]}}]	8	4
18	2017-04-15 17:15:35.045712+00	3	3 Contraption B200	2	[{"changed": {"fields": ["cover"]}}]	8	4
19	2017-04-16 21:52:47.057597+00	7	7 service@sibpromenergo.ru is processed:False	3		7	4
20	2017-04-16 21:52:47.059959+00	6	6 service@sibpromenergo.ru is processed:False	3		7	4
21	2017-04-16 21:52:47.061006+00	5	5 service@sibpromenergo.ru is processed:False	3		7	4
22	2017-04-16 21:52:47.063446+00	4	4 v.a.stpnv@gmail.com is processed:False	3		7	4
23	2017-04-16 21:52:47.064887+00	3	3 v.a.stpnv@gmail.com is processed:False	3		7	4
24	2017-04-16 21:52:47.066019+00	2	2 v.a.stpnv@gmail.com is processed:False	3		7	4
25	2017-04-16 21:52:47.067242+00	1	1 v.a.stpnv@gmail.com is processed:False	3		7	4
26	2017-04-16 22:34:37.165695+00	9	9 v.a.stpnv@gmail.com is processed:False	3		7	4
27	2017-04-16 22:34:37.170712+00	8	8 v.a.stpnv@gmail.com is processed:False	3		7	4
28	2017-04-16 22:49:01.821881+00	12	12 service@sibpromenergo.ru is processed:False	2	[]	7	4
29	2017-04-16 22:49:06.076778+00	12	12 service@sibpromenergo.ru is processed:False	2	[]	7	4
30	2017-04-17 06:42:30.443862+00	19	19 qwdqw@efw.ru	2	[]	7	4
31	2017-04-17 06:46:58.756816+00	21	21 v.a.stpnv@gmail.com	2	[]	7	4
32	2017-04-17 07:07:46.292636+00	23	23 v.a.stpnv@gmail.com	3		7	4
33	2017-04-17 07:07:46.294256+00	22	22 v.a.stpnv@gmail.com	3		7	4
34	2017-04-17 07:07:46.295574+00	21	21 v.a.stpnv@gmail.com	3		7	4
35	2017-04-17 07:07:46.296958+00	20	20 qwdqw@efw.ru	3		7	4
36	2017-04-17 07:07:46.298106+00	19	19 qwdqw@efw.ru	3		7	4
37	2017-04-17 07:07:46.299789+00	18	18 qwdqw@efw.ru	3		7	4
38	2017-04-17 07:07:46.301548+00	17	17 qwdqw@efw.ru	3		7	4
39	2017-04-17 07:07:46.428682+00	16	16 qwdqw@efw.ru	3		7	4
40	2017-04-17 07:07:46.429819+00	15	15 qwdqw@efw.ru	3		7	4
41	2017-04-17 07:07:46.430878+00	14	14 qwdqw@efwf.rr	3		7	4
42	2017-04-17 07:07:46.432041+00	13	13 service@sibpromenergo.ru	3		7	4
43	2017-04-17 07:07:46.433847+00	12	12 service@sibpromenergo.ru	3		7	4
44	2017-04-17 07:07:46.43512+00	11	11 service@sibpromenergo.ru	3		7	4
45	2017-04-17 07:07:46.436405+00	10	10 service@sibpromenergo.ru	3		7	4
46	2017-04-20 02:43:54.659588+00	24	24 v.a.stpnv@google.com	3		7	4
47	2017-04-20 02:43:54.661514+00	25	25 v.a.stpnv@google.com	3		7	4
48	2017-04-20 02:43:54.663133+00	26	26 v.a.stpnv@google.com	3		7	4
49	2017-04-20 02:43:54.665288+00	27	27 v.a.stpnv@google.com	3		7	4
50	2017-04-20 02:43:54.666645+00	28	28 v.a.stpnv@google.com	3		7	4
51	2017-04-20 02:43:54.667895+00	29	29 v.a.stpnv@google.com	3		7	4
52	2017-04-20 02:43:54.669136+00	30	30 v.a.stpnv@google.com	3		7	4
53	2017-04-20 02:43:54.670347+00	31	31 v.a.stpnv@google.com	3		7	4
54	2017-04-20 02:43:54.671493+00	32	32 v.a.stpnv@google.com	3		7	4
55	2017-04-20 02:43:54.672644+00	33	33 v.a.stpnv@google.com	3		7	4
56	2017-04-20 02:43:54.673716+00	34	34 v.a.stpnv@gmail.com	3		7	4
57	2017-04-20 02:43:54.674816+00	35	35 v.a.stpnv@gmail.com	3		7	4
58	2017-04-20 02:43:54.67689+00	36	36 v.a.stpnv@gmail.com	3		7	4
59	2017-04-20 02:43:54.677988+00	37	37 v.a.stpnv@gmail.com	3		7	4
60	2017-04-20 02:43:54.679194+00	38	38 v.a.stpnv@gmail.com	3		7	4
61	2017-04-20 02:43:54.680714+00	39	39 v.a.stpnv@gmail.com	3		7	4
62	2017-04-20 02:43:54.681995+00	40	40 v.a.stpnv@google.com	3		7	4
63	2017-04-20 02:43:54.683102+00	41	41 v.a.stpnv@gmail.com	3		7	4
64	2017-04-20 02:43:54.684208+00	42	42 v.a.stpnv@google.com	3		7	4
65	2017-04-20 02:43:54.68529+00	43	43 v.a.stpnv@google.com	3		7	4
66	2017-04-20 02:43:54.68638+00	44	44 v.a.stpnv@google.com	3		7	4
67	2017-04-20 02:43:54.687609+00	45	45 v.a.stpnv@google.com	3		7	4
68	2017-04-20 02:43:54.688689+00	46	46 v.a.stpnv@gmail.com	3		7	4
69	2017-04-20 02:43:54.689733+00	47	47 v.a.stpnv@gmail.com	3		7	4
70	2017-04-20 02:43:54.690737+00	48	48 webmaster@epaltay.ru	3		7	4
71	2017-04-20 02:43:54.691742+00	49	49 webmaster@epaltay.ru	3		7	4
72	2017-04-20 02:43:54.692759+00	50	50 webmaster@epaltay.ru	3		7	4
73	2017-04-20 02:43:54.693791+00	51	51 webmaster@epaltay.ru	3		7	4
74	2017-04-20 02:43:54.694808+00	52	52 webmaster@epaltay.ru	3		7	4
75	2017-04-20 02:43:54.695958+00	53	53 v.a.stpnv@gmail.com	3		7	4
76	2017-04-20 02:43:54.697967+00	54	54 v.a.stpnv@gmail.com	3		7	4
77	2017-04-20 02:43:54.699163+00	55	55 v.a.stpnv@gmail.com	3		7	4
78	2017-04-20 02:43:54.700302+00	56	56 v.a.stpnv@gmail.com	3		7	4
79	2017-04-20 02:43:54.701569+00	57	57 v.a.stpnv@gmail.com	3		7	4
80	2017-04-20 02:43:54.702709+00	58	58 v.a.stpnv@gmail.com	3		7	4
81	2017-04-20 02:43:54.704059+00	59	59 v.a.stpnv@gmail.com	3		7	4
82	2017-04-20 02:43:54.705145+00	60	60 v.a.stpnv@gmail.com	3		7	4
83	2017-04-20 02:43:54.706269+00	61	61 v.a.stpnv@gmail.com	3		7	4
84	2017-04-20 02:43:54.707294+00	62	62 v.a.stpnv@gmail.com	3		7	4
85	2017-04-20 02:43:54.709262+00	63	63 v.a.stpnv@gmail.com	3		7	4
86	2017-04-20 02:43:54.710282+00	64	64 v.a.stpnv@gmail.com	3		7	4
87	2017-04-20 02:43:54.711296+00	65	65 v.a.stpnv@google.com	3		7	4
88	2017-04-20 02:43:54.712183+00	66	66 v.a.stpnv@gmail.com	3		7	4
89	2017-04-20 02:43:54.713835+00	67	67 v.a.stpnv@gmail.com	3		7	4
90	2017-04-20 02:43:54.715239+00	68	68 v.a.stpnv@gmail.com	3		7	4
91	2017-04-20 02:43:54.716476+00	69	69 v.a.stpnv@gmail.com	3		7	4
92	2017-04-20 02:43:54.717786+00	70	70 v.a.stpnv@gmail.com	3		7	4
93	2017-04-20 02:43:54.718955+00	71	71 v.a.stpnv@gmail.com	3		7	4
94	2017-04-20 02:43:54.719872+00	72	72 v.a.stpnv@gmail.com	3		7	4
95	2017-04-20 02:43:54.72084+00	73	73 v.a.stpnv@gmail.com	3		7	4
96	2017-04-20 02:43:54.721912+00	74	74 v.a.stpnv@gmail.com	3		7	4
97	2017-04-20 02:43:54.723039+00	75	75 v.a.stpnv@google.com	3		7	4
98	2017-04-20 02:43:54.724284+00	76	76 v.a.stpnv@gmail.com	3		7	4
99	2017-04-20 02:43:54.725791+00	77	77 v.a.stpnv@google.com	3		7	4
100	2017-04-20 02:43:54.726943+00	78	78 v.a.stpnv@google.com	3		7	4
101	2017-04-20 02:43:54.728093+00	79	79 v.a.stpnv@gmail.com	3		7	4
102	2017-04-20 02:43:54.729928+00	80	80 v.a.stpnv@gmail.com	3		7	4
103	2017-04-20 02:43:54.731793+00	81	81 v.a.stpnv@gmail.com	3		7	4
104	2017-04-20 02:43:54.733228+00	82	82 v.a.stpnv@gmail.com	3		7	4
105	2017-04-20 02:43:54.734515+00	83	83 v.a.stpnv@gmail.com	3		7	4
106	2017-04-20 02:43:54.73582+00	84	84 v.a.stpnv@gmail.com	3		7	4
107	2017-04-20 02:43:54.736904+00	85	85 qwdqw@efwf.rr	3		7	4
108	2017-04-20 02:43:54.738034+00	86	86 v.a.stpnv@gmail.com	3		7	4
109	2017-04-20 02:43:54.739063+00	87	87 v.a.stpnv@gmail.com	3		7	4
110	2017-04-20 02:43:54.740435+00	88	88 qwdqw@efwf.rr	3		7	4
111	2017-04-20 02:43:54.741518+00	89	89 qwdqw@efwf.ru	3		7	4
112	2017-04-20 02:43:54.742446+00	90	90 erhger@ew.rt	3		7	4
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 112, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	yet_another_site	lead
8	yet_another_site	nomenclature
9	yet_another_site	picture
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('django_content_type_id_seq', 9, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-04-09 14:43:38.153434+00
2	auth	0001_initial	2017-04-09 14:43:38.340914+00
3	admin	0001_initial	2017-04-09 14:43:38.403582+00
4	admin	0002_logentry_remove_auto_add	2017-04-09 14:43:38.429901+00
5	contenttypes	0002_remove_content_type_name	2017-04-09 14:43:38.470853+00
6	auth	0002_alter_permission_name_max_length	2017-04-09 14:43:38.493844+00
7	auth	0003_alter_user_email_max_length	2017-04-09 14:43:38.523356+00
8	auth	0004_alter_user_username_opts	2017-04-09 14:43:38.560188+00
9	auth	0005_alter_user_last_login_null	2017-04-09 14:43:38.612298+00
10	auth	0006_require_contenttypes_0002	2017-04-09 14:43:38.62885+00
11	auth	0007_alter_validators_add_error_messages	2017-04-09 14:43:38.683818+00
12	auth	0008_alter_user_username_max_length	2017-04-09 14:43:38.736838+00
13	sessions	0001_initial	2017-04-09 14:43:38.778074+00
14	yet_another_site	0001_initial	2017-04-09 16:23:23.093583+00
15	yet_another_site	0002_picture_image	2017-04-09 17:07:28.294336+00
16	yet_another_site	0003_auto_20170415_0704	2017-04-15 07:04:12.299152+00
17	yet_another_site	0004_auto_20170415_0707	2017-04-15 07:07:34.712396+00
18	yet_another_site	0005_remove_lead_is_processed	2017-04-16 22:54:38.362494+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('django_migrations_id_seq', 18, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
v4n5cvmzt0bwf9h866qordrsrv15w0xo	Zjg1NWNiMDEzOWM5ZDgzZjZmZGM3NzdhM2I0NGUxY2QxNGZlNWExZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQyMWRmNTYwMjA0YzEzN2E1NDAzZThkMTc5MWUxMjgzOWM2ZjNkNzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2017-04-23 15:17:19.922395+00
cslu35audq1p4j618c0tb9fvi0csd7pw	ODE0ZDUyYTIyM2JjNmIxMGI4MTNkNDM4MjBkYmIwYmMzYTRmODU1ZTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MjFkZjU2MDIwNGMxMzdhNTQwM2U4ZDE3OTFlMTI4MzljNmYzZDcxIn0=	2017-05-01 09:38:25.726313+00
m35doqoc5ar78v26nvvhxcgaq6qm3hr9	NDU0ZDA0ZWFjYmMzMmZiOTM4MGI0ZDhiZTZlOWZiNmNjY2YwNzRiZDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiNDIxZGY1NjAyMDRjMTM3YTU0MDNlOGQxNzkxZTEyODM5YzZmM2Q3MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2017-05-04 02:25:53.86309+00
\.


--
-- Data for Name: yet_another_site_lead; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY yet_another_site_lead (id, email, message) FROM stdin;
\.


--
-- Name: yet_another_site_lead_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('yet_another_site_lead_id_seq', 90, true);


--
-- Data for Name: yet_another_site_nomenclature; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY yet_another_site_nomenclature (id, descr, is_tested, category, sku, cover_id) FROM stdin;
5	etc	f	A	0	\N
4	Contraption C300	t	C	300	10
2	Contraption A100	t	A	100	5
3	Contraption B200	t	B	200	8
\.


--
-- Name: yet_another_site_nomenclature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('yet_another_site_nomenclature_id_seq', 5, true);


--
-- Data for Name: yet_another_site_picture; Type: TABLE DATA; Schema: public; Owner: borodaa
--

COPY yet_another_site_picture (id, descr, nomenclature_id, image) FROM stdin;
4	Picture 1-100	2	nomenclature/2/100.jpg
5	Picture 2-100	2	nomenclature/2/flat1000x1000075f.u1.jpg
6	Picture 3-100	2	nomenclature/2/QUIZ_Le-quiz-du-100assure-mais-faut-speeder-pour-etre_9773.gif
7	Picture 1-200	3	nomenclature/3/200-1.jpg
8	Picture 2-200	3	nomenclature/3/200-2.png
9	Picture 3-200	3	nomenclature/3/200-3.jpg
10	Picture 1-300	4	nomenclature/4/motul300.png
11	Picture 2-300	4	nomenclature/4/bens300S.jpg
12	Picture 3-300	4	nomenclature/4/oborona-spartantsev.jpg
\.


--
-- Name: yet_another_site_picture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: borodaa
--

SELECT pg_catalog.setval('yet_another_site_picture_id_seq', 12, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: yet_another_site_lead_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY yet_another_site_lead
    ADD CONSTRAINT yet_another_site_lead_pkey PRIMARY KEY (id);


--
-- Name: yet_another_site_nomenclature_cover_id_key; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY yet_another_site_nomenclature
    ADD CONSTRAINT yet_another_site_nomenclature_cover_id_key UNIQUE (cover_id);


--
-- Name: yet_another_site_nomenclature_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY yet_another_site_nomenclature
    ADD CONSTRAINT yet_another_site_nomenclature_pkey PRIMARY KEY (id);


--
-- Name: yet_another_site_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: borodaa; Tablespace: 
--

ALTER TABLE ONLY yet_another_site_picture
    ADD CONSTRAINT yet_another_site_picture_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: yet_another_site_picture_nomenclature_id_aa442e9f; Type: INDEX; Schema: public; Owner: borodaa; Tablespace: 
--

CREATE INDEX yet_another_site_picture_nomenclature_id_aa442e9f ON yet_another_site_picture USING btree (nomenclature_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: yet_another_site_nom_cover_id_561cf91f_fk_yet_anoth; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY yet_another_site_nomenclature
    ADD CONSTRAINT yet_another_site_nom_cover_id_561cf91f_fk_yet_anoth FOREIGN KEY (cover_id) REFERENCES yet_another_site_picture(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: yet_another_site_pic_nomenclature_id_aa442e9f_fk_yet_anoth; Type: FK CONSTRAINT; Schema: public; Owner: borodaa
--

ALTER TABLE ONLY yet_another_site_picture
    ADD CONSTRAINT yet_another_site_pic_nomenclature_id_aa442e9f_fk_yet_anoth FOREIGN KEY (nomenclature_id) REFERENCES yet_another_site_nomenclature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

