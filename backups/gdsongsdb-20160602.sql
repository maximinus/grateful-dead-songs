--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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


--
-- Name: tsearch2; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS tsearch2 WITH SCHEMA public;


--
-- Name: EXTENSION tsearch2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tsearch2 IS 'compatibility package for pre-8.3 text search functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO pigpen;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO pigpen;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO pigpen;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO pigpen;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO pigpen;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO pigpen;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO pigpen;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO pigpen;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO pigpen;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO pigpen;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO pigpen;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO pigpen;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
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


ALTER TABLE public.django_admin_log OWNER TO pigpen;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO pigpen;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO pigpen;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO pigpen;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO pigpen;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO pigpen;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO pigpen;

--
-- Name: shows_playedset; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE shows_playedset (
    id integer NOT NULL,
    "order" integer NOT NULL,
    encore boolean NOT NULL,
    show_id integer NOT NULL
);


ALTER TABLE public.shows_playedset OWNER TO pigpen;

--
-- Name: shows_playedset_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE shows_playedset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_playedset_id_seq OWNER TO pigpen;

--
-- Name: shows_playedset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE shows_playedset_id_seq OWNED BY shows_playedset.id;


--
-- Name: shows_playedsong; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE shows_playedsong (
    id integer NOT NULL,
    "order" integer NOT NULL,
    length integer NOT NULL,
    comments text NOT NULL,
    played_set_id integer NOT NULL,
    song_id integer NOT NULL,
    seque boolean NOT NULL
);


ALTER TABLE public.shows_playedsong OWNER TO pigpen;

--
-- Name: shows_playedsong_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE shows_playedsong_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_playedsong_id_seq OWNER TO pigpen;

--
-- Name: shows_playedsong_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE shows_playedsong_id_seq OWNED BY shows_playedsong.id;


--
-- Name: shows_show; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE shows_show (
    id integer NOT NULL,
    "order" integer NOT NULL,
    time_started time without time zone,
    time_ended time without time zone,
    date_id integer NOT NULL,
    venue_id integer
);


ALTER TABLE public.shows_show OWNER TO pigpen;

--
-- Name: shows_show_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE shows_show_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_show_id_seq OWNER TO pigpen;

--
-- Name: shows_show_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE shows_show_id_seq OWNED BY shows_show.id;


--
-- Name: shows_showdate; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE shows_showdate (
    id integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    day integer NOT NULL,
    exact_date date
);


ALTER TABLE public.shows_showdate OWNER TO pigpen;

--
-- Name: shows_showdate_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE shows_showdate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_showdate_id_seq OWNER TO pigpen;

--
-- Name: shows_showdate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE shows_showdate_id_seq OWNED BY shows_showdate.id;


--
-- Name: songs_alternatename; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE songs_alternatename (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    song_id integer NOT NULL
);


ALTER TABLE public.songs_alternatename OWNER TO pigpen;

--
-- Name: songs_alternatename_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE songs_alternatename_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_alternatename_id_seq OWNER TO pigpen;

--
-- Name: songs_alternatename_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE songs_alternatename_id_seq OWNED BY songs_alternatename.id;


--
-- Name: songs_song; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE songs_song (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    shortname character varying(32) NOT NULL,
    fragment boolean NOT NULL
);


ALTER TABLE public.songs_song OWNER TO pigpen;

--
-- Name: songs_song_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE songs_song_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_song_id_seq OWNER TO pigpen;

--
-- Name: songs_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE songs_song_id_seq OWNED BY songs_song.id;


--
-- Name: tours_tour; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE tours_tour (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.tours_tour OWNER TO pigpen;

--
-- Name: tours_tour_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE tours_tour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tours_tour_id_seq OWNER TO pigpen;

--
-- Name: tours_tour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE tours_tour_id_seq OWNED BY tours_tour.id;


--
-- Name: venues_venue; Type: TABLE; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE TABLE venues_venue (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    city character varying(64) NOT NULL,
    state integer NOT NULL,
    country integer NOT NULL,
    longitude numeric(10,7),
    latitude numeric(10,7)
);


ALTER TABLE public.venues_venue OWNER TO pigpen;

--
-- Name: venues_venue_id_seq; Type: SEQUENCE; Schema: public; Owner: pigpen
--

CREATE SEQUENCE venues_venue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venues_venue_id_seq OWNER TO pigpen;

--
-- Name: venues_venue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pigpen
--

ALTER SEQUENCE venues_venue_id_seq OWNED BY venues_venue.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_playedset ALTER COLUMN id SET DEFAULT nextval('shows_playedset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_playedsong ALTER COLUMN id SET DEFAULT nextval('shows_playedsong_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_show ALTER COLUMN id SET DEFAULT nextval('shows_show_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_showdate ALTER COLUMN id SET DEFAULT nextval('shows_showdate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY songs_alternatename ALTER COLUMN id SET DEFAULT nextval('songs_alternatename_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY songs_song ALTER COLUMN id SET DEFAULT nextval('songs_song_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY tours_tour ALTER COLUMN id SET DEFAULT nextval('tours_tour_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY venues_venue ALTER COLUMN id SET DEFAULT nextval('venues_venue_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: pigpen
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
19	Can add song	7	add_song
20	Can change song	7	change_song
21	Can delete song	7	delete_song
22	Can add alternate name	8	add_alternatename
23	Can change alternate name	8	change_alternatename
24	Can delete alternate name	8	delete_alternatename
25	Can add venue	9	add_venue
26	Can change venue	9	change_venue
27	Can delete venue	9	delete_venue
28	Can add tour	10	add_tour
29	Can change tour	10	change_tour
30	Can delete tour	10	delete_tour
31	Can add show date	11	add_showdate
32	Can change show date	11	change_showdate
33	Can delete show date	11	delete_showdate
34	Can add show	12	add_show
35	Can change show	12	change_show
36	Can delete show	12	delete_show
37	Can add played set	13	add_playedset
38	Can change played set	13	change_playedset
39	Can delete played set	13	delete_playedset
40	Can add played song	14	add_playedsong
41	Can change played song	14	change_playedsong
42	Can delete played song	14	delete_playedsong
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('auth_permission_id_seq', 42, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$PRlqwxOpMbae$xr6kOKEnryGsawYp5OsH5m7OQr42nz7NREYm80Z38k8=	2016-01-05 08:49:59.741197+00	t	sparky			a@a.com	t	t	2015-12-10 06:37:09.118068+00
4	pbkdf2_sha256$20000$ppPjSFRfi5zq$AmxFfoPRNpcsIl7+JoCK9pqMkRFvNRMQRFvmpxwqpaY=	2016-05-24 07:32:06.45189+00	t	Mattingly23	Max	Gia	maxeg72@yahoo.com	t	t	2015-12-18 03:07:51+00
2	pbkdf2_sha256$20000$WCCBid19jftu$/K/puPVxLZUiC1YjzgwucTSjzhZ+daSDWkB80mnsC4c=	2016-05-24 16:05:00.111687+00	t	chrisg			b@b.com	t	t	2015-12-10 06:37:30.126072+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('auth_user_id_seq', 4, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-12-10 06:38:31.600231+00	4	26 Miles Tuning	3		7	1
2	2015-12-10 23:41:20.273976+00	62	Close Encounters Jam	3		7	2
3	2015-12-10 23:41:41.637759+00	15	Baba O'Riley	2	Changed name and shortname.	7	2
4	2015-12-10 23:42:38.75622+00	228	Mississippi Half Step	2	Changed name and shortname.	7	2
5	2015-12-10 23:43:30.649973+00	225	Your Mind Left Your Body Jam	2	Changed name and shortname.	7	2
6	2015-12-11 05:00:56.06122+00	345	Promised Land	2	Changed name and shortname.	7	2
7	2015-12-17 23:41:50.178924+00	241	New, New Minglewood Blues	2	Changed name and shortname.	7	2
8	2015-12-17 23:42:57.411532+00	37	Born Cross-Eyed	2	Changed name and shortname.	7	2
9	2015-12-17 23:44:04.307004+00	368	Turn On Your Love Light	2	Changed name and shortname.	7	2
10	2015-12-17 23:45:49.536997+00	42	Brown-Eyed Women	2	Changed name and shortname.	7	2
11	2015-12-17 23:46:37.658055+00	228	Mississippi Half-Step	2	Changed name and shortname.	7	2
12	2015-12-17 23:48:10.345691+00	279	Sage & Spirit	2	Changed name and shortname.	7	2
13	2015-12-18 02:53:11.180311+00	3	testy	1		4	1
14	2015-12-18 02:53:56.381575+00	3	testy	3		4	1
15	2015-12-18 03:07:51.094208+00	4	Mattingly23	1		4	2
16	2015-12-18 03:08:15.952478+00	4	Mattingly23	2	Changed first_name, last_name, email and is_superuser.	4	2
17	2015-12-18 03:10:33.137145+00	409	Your Love At Home	3		7	2
18	2015-12-18 03:11:44.144315+00	408	You Won't Find Me	3		7	2
19	2015-12-18 03:12:22.043993+00	404	Yellow Dog Story	3		7	2
20	2015-12-18 03:12:43.509521+00	403	Workin' Man Blues	3		7	2
21	2015-12-18 03:14:03.814793+00	410	You Don't Have To Ask	1		7	2
22	2015-12-18 03:16:15.590308+00	411	You Know I Love You So	1		7	2
23	2015-12-18 03:17:45.979166+00	401	Willie & The Hand Jive	3		7	2
24	2015-12-18 03:19:18.510329+00	412	Will The Circle Be Unbroken	1		7	2
25	2015-12-18 03:25:53.162919+00	398	Where Have The Heroes Gone	3		7	2
26	2015-12-18 03:27:38.210708+00	391	Weather Report Suite Prelude	2	Changed shortname.	7	2
27	2015-12-18 03:35:39.091588+00	379	Wake Me Shake Me	3		7	2
28	2015-12-18 03:42:13.590831+00	366	Truck Drivin' Man	3		7	2
29	2015-12-18 03:43:35.915926+00	369	The Stranger (Two Souls In Communion)	2	Changed name and shortname.	7	2
30	2015-12-18 03:44:37.544248+00	344	Other One Jam	2	Changed name, shortname and fragment.	7	2
31	2015-12-18 03:44:58.283362+00	343	Other One	2	Changed name and shortname.	7	2
32	2015-12-18 03:45:41.062882+00	350	The Story Of A Brick	3		7	2
33	2015-12-18 03:46:17.121908+00	356	This Time Forever	3		7	2
34	2015-12-18 03:47:40.520523+00	334	The Ballad Of Frankie Lee & Judas Priest	2	Changed name and shortname.	7	2
35	2015-12-18 03:48:49.580763+00	324	Take A Step Back Tuning	3		7	2
36	2015-12-18 03:49:21.508088+00	317	Sugar Shack	3		7	2
37	2015-12-18 03:49:51.134658+00	301	Slow R and B Instrumental	3		7	2
38	2015-12-18 03:51:10.508384+00	296	Silver Threads & Golden Needles	2	Changed name and shortname.	7	2
39	2015-12-18 03:51:31.181995+00	284	Samson & Delilah	2	Changed name and shortname.	7	2
40	2015-12-18 03:51:45.536977+00	281	St. Stephen	2	Changed name and shortname.	7	2
41	2015-12-18 03:52:27.643923+00	294	Sick & Tired	2	Changed name and shortname.	7	2
42	2015-12-18 03:52:49.779881+00	276	Rollin' & Tumblin'	2	Changed name and shortname.	7	2
43	2015-12-18 03:53:53.38754+00	262	Peggy-O	2	Changed name and shortname.	7	2
44	2015-12-18 03:54:36.840557+00	271	Reuben & Cherise	2	Changed name and shortname.	7	2
45	2015-12-18 03:54:53.145545+00	250	Oh Babe, It Ain't No Lie	2	Changed name and shortname.	7	2
46	2015-12-18 03:55:36.934661+00	252	Ol' Slewfoot	3		7	2
47	2015-12-18 03:55:56.286878+00	260	Parchman Farm	3		7	2
48	2015-12-18 03:56:45.354412+00	251	Oh, Boy!	2	Changed name and shortname.	7	2
49	2015-12-18 03:57:32.972824+00	222	Me & My Uncle	2	Changed name and shortname.	7	2
50	2015-12-18 03:57:58.031089+00	221	Me & Bobby McGee	2	Changed name and shortname.	7	2
51	2015-12-18 03:58:16.631124+00	231	Monkey & The Engineer	2	Changed name and shortname.	7	2
52	2015-12-18 03:59:01.835904+00	195	Last Lonely Eagle	3		7	2
53	2015-12-18 03:59:20.84184+00	194	Lady Di & I	2	Changed name and shortname.	7	2
54	2015-12-18 03:59:35.910911+00	179	Jam	3		7	2
55	2015-12-18 03:59:54.390415+00	177	Jack-A-Roe	2	Changed name and shortname.	7	2
56	2015-12-18 04:00:38.661015+00	172	It Takes A Lot To Laugh, It Takes A Train To Cry	2	Changed name and shortname.	7	2
57	2015-12-18 04:02:06.973264+00	413	It's A Man's, Man's, Man's World	1		7	2
58	2015-12-18 04:02:42.266632+00	148	How Sweet It Is	2	Changed name and shortname.	7	2
59	2015-12-18 04:03:24.262193+00	150	I Don't Know You	3		7	2
60	2015-12-18 04:27:44.652308+00	11	And We Bid You Good Night Jam	3		7	2
61	2015-12-18 04:28:07.675871+00	13	Around & Around	2	Changed name and shortname.	7	2
62	2015-12-18 04:28:28.127682+00	70	Cryptical	2	Changed name and shortname.	7	2
63	2015-12-18 04:28:49.493429+00	64	Cold Rain & Snow	2	Changed name and shortname.	7	2
64	2015-12-18 04:29:11.072901+00	5	Addams Family Tuning	3		7	2
65	2015-12-18 04:29:34.967058+00	33	Black-Throated Wind	2	Changed name and shortname.	7	2
66	2015-12-18 04:30:17.681384+00	414	Hey Jude Finale	1		7	2
67	2015-12-18 04:30:50.231923+00	186	K.C. Moan	2	Changed name and shortname.	7	2
68	2015-12-18 04:31:58.132897+00	192	L'alhambra	3		7	2
69	2015-12-18 04:33:00.058257+00	130	Green Green Grass Of Home	3		7	2
70	2015-12-18 04:34:45.088858+00	92	Drummers' Chant	3		7	2
71	2015-12-18 05:57:48.149432+00	217	Man Smart, Woman Smarter	2	Changed name and shortname.	7	2
72	2015-12-18 05:59:05.309555+00	201	Good Times	2	Changed name and shortname.	7	2
73	2015-12-18 06:00:55.383881+00	19	Banana Boat Song (Day-O)	2	Changed name and shortname.	7	2
74	2015-12-18 06:04:07.561923+00	116	Funiculì, Funiculà	2	Changed name and shortname.	7	2
75	2015-12-18 06:49:29.575556+00	4	Mattingly23	2	Changed is_staff.	4	2
76	2015-12-18 07:39:14.759971+00	415	Ain't It Crazy	1		7	4
77	2015-12-18 07:40:58.45546+00	416	Bring Me My Shotgun	1		7	4
78	2015-12-18 07:41:12.193381+00	417	Black Snake	1		7	4
79	2015-12-18 07:41:25.578461+00	418	The Mighty Flood	1		7	4
80	2015-12-18 07:46:08.524971+00	419	Roberta	1		7	4
81	2015-12-18 07:50:13.759743+00	420	Green, Green Grass Of Home	1		7	4
82	2015-12-18 07:50:54.281625+00	421	Ole Slew Foot	1		7	4
83	2015-12-18 07:53:36.020685+00	422	It's A Sin Jam	1		7	4
84	2015-12-18 20:06:44.359585+00	423	Truckin' Jam	1		7	2
85	2016-01-04 06:07:13.070542+00	424	Weir's Segue	1		7	2
86	2016-01-04 06:08:25.073957+00	425	PITB Jam	1		7	2
87	2016-01-04 06:09:28.446849+00	426	Playing Reprise	1		7	2
88	2016-01-04 22:40:42.665394+00	8	17 of Sep, 1972, Baltimore Civic Center	3		12	2
89	2016-01-04 22:41:29.494827+00	427	Truckin' Reprise	1		7	2
90	2016-01-04 22:41:48.654877+00	428	Improv	1		7	2
91	2016-01-04 22:42:07.053878+00	429	Free Form Jam	1		7	2
92	2016-01-04 22:42:47.328104+00	430	Jerry, Bob & Phil Interplay	1		7	2
93	2016-01-04 22:43:02.773382+00	431	Explorations	1		7	2
94	2016-01-04 22:43:32.366337+00	432	Keith, Phil & Billy Jam	1		7	2
95	2016-01-04 22:44:13.644399+00	433	Weir's E Maj / D Maj Jam	1		7	2
96	2016-01-06 18:02:47.622516+00	434	Wharf Rat Jam	1		7	2
97	2016-01-06 18:06:09.054827+00	435	And We Bid You Goodnight Coda	1		7	2
98	2016-01-07 01:46:43.179789+00	26	Encore, 17 of Sep, 1972	2	Changed encore.	13	2
99	2016-01-07 01:48:02.139211+00	32	Encore, 15 of Mar, 1990	2	Changed encore.	13	2
100	2016-01-07 01:48:13.777963+00	29	Encore, 21 of Nov, 1973	2	Changed encore.	13	2
101	2016-01-07 01:50:36.801585+00	148	And We Bid You Goodnight Coda, in 2nd set, 21 of Nov, 1973	2	Changed song.	14	2
102	2016-01-07 03:49:25.060335+00	5	10 of Oct, 1982, Memorial Coliseum, University of Alabama	3		12	2
103	2016-01-07 03:49:25.132598+00	4	10 of Oct, 1982, Memorial Coliseum, University of Alabama	3		12	2
104	2016-01-07 03:49:25.133319+00	3	10 of Oct, 1982, Memorial Coliseum, University of Alabama	3		12	2
105	2016-01-07 03:49:45.78677+00	7	15 of Mar, 1993, Knickerbocker Arena	3		12	2
106	2016-01-07 03:50:14.149546+00	6	25 of Oct, 1992, Boston Garden	3		12	2
107	2016-01-07 03:50:50.887877+00	2	3 of Mar, 1984, Memorial Coliseum, University of Alabama	3		12	2
108	2016-01-07 03:50:50.889192+00	1	26 of Oct, 1972, Concertgebouw	3		12	2
109	2016-01-07 03:55:10.187302+00	136	Wharf Rat Jam, in 2nd set, 21 of Nov, 1973	2	Changed song.	14	2
110	2016-01-07 03:55:48.877772+00	145	Truckin' Jam, in 2nd set, 21 of Nov, 1973	2	Changed comments.	14	2
111	2016-01-07 03:56:09.849801+00	144	Truckin', in 2nd set, 21 of Nov, 1973	2	Changed comments.	14	2
112	2016-01-13 23:48:03.049911+00	207	Rheinhalle, Dusseldorf, Germany	1		9	2
113	2016-01-16 06:35:53.874996+00	436	Untitled Post-Eyes Jam	1		7	2
114	2016-01-16 06:56:47.0282+00	437	descending four chord sequence	1		7	2
115	2016-01-16 06:57:30.031174+00	437	Descending Four Chord Sequence	2	Changed name and shortname.	7	2
116	2016-01-16 07:25:41.004251+00	208	Oklahoma City Fairgrounds Arena, Oklahoma City, None	1		9	2
117	2016-01-16 07:31:19.741742+00	438	Feelin' Groovy Jam	1		7	2
118	2016-01-19 23:59:23.39429+00	439	UJB Reprise	1		7	2
119	2016-01-21 07:18:47.799188+00	440	Dear Prudence Jam	1		7	2
120	2016-01-24 00:28:21.80266+00	209	Capitol Theater, Port Chester, None	1		9	2
121	2016-01-24 00:53:22.447116+00	210	Jahrhunderthalle, Frankfurt, Germany	1		9	2
122	2016-01-24 00:59:46.538777+00	441	Billy & Keith Jam	1		7	2
123	2016-01-24 01:00:12.949219+00	442	Jerry, Bob, Phil & Keith Interplay	1		7	2
124	2016-01-24 01:01:09.965989+00	443	NFA & GDTRFB Jam	1		7	2
125	2016-01-24 01:04:46.721277+00	30	1 of May, 1981, Hampton Coliseum	3		12	2
126	2016-01-25 00:11:34.039515+00	444	Terrapin Transit	1		7	4
127	2016-01-25 00:46:36.735134+00	445	At A Siding Jam	1		7	4
128	2016-01-25 01:01:01.1942+00	446	NFA Reprise	1		7	2
129	2016-01-25 01:01:44.067942+00	447	Bob, Phil & Drums Jam	1		7	2
130	2016-01-25 01:41:30.615949+00	448	NFA Jam	1		7	2
131	2016-01-25 05:44:07.987705+00	211	Oakland-Alameda County Coliseum Stadium, Oakland, None	1		9	2
132	2016-01-27 05:31:14.442915+00	212	Family Dog At The Great Highway, San Francisco, None	1		9	4
133	2016-01-27 05:32:34.56424+00	40	13 of May, 1981	2	Changed day and exact_date.	11	4
134	2016-01-27 05:35:20.377041+00	40	13 of May, 1981, Providence Civic Center	2	Changed venue, time_started and time_ended.	12	4
135	2016-01-27 05:35:55.837183+00	39	27 of Apr, 1977, Capitol Theatre	2	Changed venue, time_started and time_ended.	12	4
136	2016-01-27 05:48:30.647697+00	386	Feelin' Groovy Jam, in 2nd set, 19 of Oct, 1973	2	Changed song.	14	4
137	2016-01-27 05:54:10.931314+00	394	Dark Star, in 2nd set, 19 of Oct, 1973	2	Changed length.	14	4
138	2016-01-27 05:54:47.82864+00	393	Dark Star Jam, in 2nd set, 19 of Oct, 1973	3		14	4
139	2016-01-27 05:59:27.554347+00	823	St. Stephen, in 2nd set, 8 of May, 1977	2	Changed seque.	14	4
140	2016-01-27 06:00:11.189046+00	80	China Cat Sunflower, in 1st set, 17 of Sep, 1972	2	Changed seque.	14	4
141	2016-01-27 06:00:22.873514+00	81	Weir's Segue, in 1st set, 17 of Sep, 1972	2	Changed seque.	14	4
142	2016-01-27 06:00:38.977232+00	83	Playing In The Band, in 1st set, 17 of Sep, 1972	2	Changed seque.	14	4
143	2016-01-27 06:00:49.798396+00	84	PITB Jam, in 1st set, 17 of Sep, 1972	2	Changed seque.	14	4
144	2016-01-27 06:01:14.011778+00	87	Truckin', in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
145	2016-01-27 06:01:31.421411+00	88	Truckin' Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
146	2016-01-27 06:01:52.095299+00	94	He's Gone, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
147	2016-01-27 06:02:01.665411+00	95	Other One Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
148	2016-01-27 06:02:12.213014+00	96	Drums, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
149	2016-01-27 06:02:26.458914+00	98	Improv, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
150	2016-01-27 06:02:35.923853+00	99	Other One, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
151	2016-01-27 06:02:49.437264+00	100	Other One Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
152	2016-01-27 06:03:02.856261+00	101	Jerry, Bob & Phil Interplay, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
153	2016-01-27 06:03:13.000209+00	102	Free Form Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
154	2016-01-27 06:03:24.748147+00	105	Other One Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
155	2016-01-27 06:03:50.500668+00	97	Other One Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
156	2016-01-27 06:04:27.567794+00	97	Other One Jam, in 2nd set, 17 of Sep, 1972	2	Changed comments.	14	4
157	2016-01-27 06:04:58.091456+00	104	Free Form Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
158	2016-01-27 06:05:10.296471+00	106	Keith, Phil & Billy Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
159	2016-01-27 06:05:20.219061+00	107	Weir's E Maj / D Maj Jam, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
160	2016-01-27 06:05:37.392338+00	108	Other One, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
161	2016-01-27 06:05:52.632259+00	103	Explorations, in 2nd set, 17 of Sep, 1972	2	Changed seque.	14	4
162	2016-01-27 06:07:52.867905+00	449	Drums w/ Jerry	1		7	2
163	2016-01-27 06:08:36.711235+00	433	Weir's E Maj / D Maj Jam	2	No fields changed.	7	2
164	2016-01-27 06:08:36.93172+00	166	Drums w/ Jerry, in 2nd set, 15 of Mar, 1990	2	Changed song.	14	4
165	2016-01-27 06:09:42.992276+00	166	Drums, in 2nd set, 15 of Mar, 1990	2	Changed song.	14	4
166	2016-01-27 06:11:26.001443+00	167	Drums w/ Jerry, in 2nd set, 15 of Mar, 1990	2	Changed song and seque.	14	4
167	2016-01-27 08:37:06.659775+00	615	Other One, in 2nd set, 1 of May, 1981	2	Changed seque.	14	4
168	2016-01-27 19:39:56.243565+00	213	City Hall, Newcastle upon Tyne, UK	1		9	2
169	2016-01-28 01:03:08.219401+00	450	Minglewood Blues	1		7	4
170	2016-01-28 02:31:13.422188+00	451	Brent, Phil & Drums Jam	1		7	2
171	2016-01-28 03:04:58.047955+00	452	Jerry, Bob & Drums Jam	1		7	2
172	2016-01-28 05:55:59.004088+00	453	Jerry, Bob, Phil & Brent Interplay	1		7	2
173	2016-01-28 06:22:20.250735+00	454	Jerry, Bob & Drums Jam	1		7	4
174	2016-01-28 06:33:02.075479+00	22	26 of Dec, 1979	2	Changed day and exact_date.	11	4
175	2016-01-28 17:31:03.407066+00	455	Jerry & Bob Interplay	1		7	2
176	2016-01-28 19:23:35.650267+00	214	Golden Hall, Community Concourse, San Diego, None	1		9	2
177	2016-01-28 23:27:50.060043+00	435	And We Bid You Good Night Coda	2	Changed name and shortname.	7	2
178	2016-01-28 23:32:55.212769+00	241	Minglewood Blues	2	Changed name.	7	2
179	2016-01-28 23:37:43.637387+00	1044	Minglewood Blues, in 1st set, 26 of May, 1977	2	Changed song.	14	2
180	2016-01-28 23:38:00.670617+00	994	Minglewood Blues, in 1st set, 17 of Feb, 1982	2	Changed song.	14	2
181	2016-01-28 23:43:30.957917+00	450	Minglewood Blues	3		7	2
182	2016-01-29 06:05:28.932454+00	456	Jerry, Bob & Keith Interplay	1		7	2
183	2016-01-29 17:34:25.166818+00	55	8 of Jun, 1977	2	Changed day and exact_date.	11	2
184	2016-01-30 23:30:09.567398+00	387	I Know You Rider, in 2nd set, 19 of Oct, 1973	2	Changed seque.	14	2
185	2016-01-30 23:32:28.827525+00	388	Me & My Uncle, in 2nd set, 19 of Oct, 1973	2	Changed seque.	14	2
186	2016-01-30 23:32:50.832515+00	389	Mississippi Half-Step, in 2nd set, 19 of Oct, 1973	2	Changed seque.	14	2
187	2016-01-30 23:34:13.888625+00	390	Big River, in 2nd set, 19 of Oct, 1973	2	Changed seque.	14	2
188	2016-01-30 23:37:24.387611+00	63	8 of Jun, 1974, Oakland-Alameda County Coliseum Stadium	3		12	2
189	2016-01-31 01:52:56.809897+00	215	Universal Ampitheatre, Universal City, None	1		9	2
190	2016-01-31 02:44:37.891035+00	457	Phil & Billy Jam	1		7	2
191	2016-01-31 02:44:56.778005+00	458	Jerry & Phil Interplay	1		7	2
192	2016-01-31 04:11:03.697123+00	454	Jerry, Bob & Drums Jam	3		7	2
193	2016-01-31 04:37:48.162738+00	459	Spoonful Jam	1		7	2
194	2016-01-31 05:50:55.097242+00	216	Salt Palace, Salt Lake City, None	1		9	2
195	2016-01-31 18:52:13.412694+00	460	Prelude	1		7	2
196	2016-01-31 20:04:06.942824+00	107	Improv, in 2nd set, 17 of Sep, 1972	2	Changed song and comments.	14	2
197	2016-01-31 20:04:27.359088+00	433	Weir's E Maj / D Maj Jam	3		7	2
198	2016-01-31 20:07:30.27017+00	258	Other One Jam, in 2nd set, 6 of May, 1981	3		14	2
199	2016-01-31 20:07:46.696971+00	260	Other One Jam, in 2nd set, 6 of May, 1981	3		14	2
200	2016-01-31 20:08:15.280142+00	259	Other One, in 2nd set, 6 of May, 1981	3		14	2
201	2016-01-31 20:08:42.796728+00	261	Other One, in 2nd set, 6 of May, 1981	2	Changed length.	14	2
202	2016-02-01 05:44:20.469649+00	1372	Untitled Post-Eyes Jam, in 2nd set, 8 of Jun, 1974	2	Changed comments and seque.	14	2
203	2016-02-01 08:21:29.673502+00	461	Jerry, Bob & Brent Interplay	1		7	4
204	2016-02-02 02:42:29.218269+00	462	Phil & Keith Jam	1		7	2
205	2016-02-02 02:48:12.768658+00	463	Keith, Phil & Drums Jam	1		7	2
206	2016-02-02 02:48:23.33048+00	462	Phil & Keith Jam	3		7	2
207	2016-02-02 02:49:09.884306+00	464	Keith & Drums Jam	1		7	2
208	2016-02-02 03:21:05.179894+00	218	Veterans Memorial Coliseum, New Haven, None	1		9	2
209	2016-02-02 03:22:17.724907+00	75	10 of May, 1978, Veterans Memorial Coliseum	2	Changed venue, time_started and time_ended.	12	2
210	2016-02-02 03:56:20.66351+00	1682	Prelude, in 1st set, 26 of Feb, 1977	2	Changed seque.	14	4
211	2016-02-02 04:28:34.973075+00	465	Drums w/ Jerry & Bob	1		7	2
212	2016-02-02 04:34:46.256876+00	1713	Drums w/ Jerry & Bob, in 2nd set, 13 of Apr, 1983	2	Changed song.	14	4
213	2016-02-04 19:50:42.131583+00	466	Bob, Brent & Drums Jam	1		7	2
214	2016-02-06 06:33:38.668173+00	1903	Drums, in 2nd set, 27 of Mar, 1989	2	Changed seque.	14	2
215	2016-02-06 07:46:45.597859+00	467	Spanish Theme	1		7	2
216	2016-02-06 08:19:33.286361+00	176	War Memorial Auditorium, Buffalo, None	2	Changed name.	9	2
217	2016-02-06 08:20:22.231805+00	1937	Spanish Theme, in 2nd set, 31 of Mar, 1973	2	Changed song.	14	2
218	2016-02-06 22:43:14.320056+00	89	19 of Feb, 1985	2	Changed year and exact_date.	11	2
219	2016-02-07 14:30:37.853229+00	468	Jerry, Keith & Drums	1		7	4
220	2016-02-08 00:42:14.666979+00	469	Jerry & Drums Jam	1		7	2
221	2016-02-08 00:42:45.264733+00	457	Phil & Drums Jam	2	Changed name and shortname.	7	2
222	2016-02-08 00:43:24.430114+00	441	Keith & Drums Jam	2	Changed name and shortname.	7	2
223	2016-02-08 00:43:56.903372+00	432	Keith, Phil & Drums Jam	2	Changed name and shortname.	7	2
224	2016-02-09 06:50:22.355693+00	2135	Sugar Magnolia, in 2nd set, 14 of Oct, 1983	2	Changed order.	14	2
225	2016-02-09 06:50:42.811175+00	2134	Stella Blue, in 2nd set, 14 of Oct, 1983	2	Changed order.	14	2
226	2016-02-09 06:50:58.188409+00	2133	Other One, in 2nd set, 14 of Oct, 1983	2	Changed order.	14	2
227	2016-02-09 06:51:19.699014+00	2132	Prelude, in 2nd set, 14 of Oct, 1983	2	Changed order.	14	2
228	2016-02-09 06:52:50.667029+00	2178	Spanish Theme, in 2nd set, 14 of Oct, 1983	1		14	2
229	2016-02-09 06:53:33.210384+00	470	Malaguena Jam	1		7	2
230	2016-02-09 06:54:03.855706+00	2178	Malaguena Jam, in 2nd set, 14 of Oct, 1983	2	Changed song.	14	2
231	2016-02-09 06:56:33.093046+00	2041	Jerry, Keith & Drums, in 2nd set, 14 of Jan, 1978	2	Changed song.	14	2
232	2016-02-09 11:26:23.37521+00	471	Day Job	1		7	4
233	2016-02-09 23:49:50.147513+00	2198	Keep Your Day Job, in 3rd set, 20 of Apr, 1984	2	Changed song.	14	4
234	2016-02-09 23:51:32.940859+00	471	Day Job	3		7	4
235	2016-02-11 01:19:56.320113+00	2287	Sugaree, in 1st set, 14 of Nov, 1978	2	Changed comments.	14	4
236	2016-02-12 16:19:47.767223+00	224	San Francisco Civic Center, San Francisco, None	1		9	4
237	2016-02-12 16:20:17.349051+00	112	28 of Dec, 1984, San Francisco Civic Center	2	Changed venue, time_started and time_ended.	12	4
238	2016-02-13 03:21:07.223589+00	472	Bob, Keith, Phil & Drums Jam	1		7	2
239	2016-02-13 03:28:26.468625+00	464	Keith & Drums Jam	3		7	2
240	2016-02-16 08:58:56.02517+00	2555	Truckin', in 2nd set, 6 of Apr, 1982	2	Changed comments.	14	4
241	2016-02-16 08:59:03.69332+00	2555	Truckin', in 2nd set, 6 of Apr, 1982	2	No fields changed.	14	4
242	2016-02-16 09:46:55.559928+00	147	How Long, How Long Blues	2	Changed name and shortname.	7	4
243	2016-02-17 07:03:34.979369+00	473	Brent & Phil Interplay	1		7	2
244	2016-02-17 07:05:04.834238+00	453	Jerry, Bob, Brent & Phil Interplay	2	Changed name and shortname.	7	2
245	2016-02-17 07:05:31.544664+00	442	Jerry, Bob, Keith & Phil Interplay	2	Changed name and shortname.	7	2
246	2016-02-17 07:09:21.770747+00	2686	Brent & Phil Interplay, in 2nd set, 31 of Oct, 1979	2	Changed song.	14	2
247	2016-02-17 23:40:30.959929+00	122	5 of Nov, 1979, The Spectrum	2	Changed venue, time_started and time_ended.	12	4
248	2016-02-18 02:37:08.032927+00	474	Jerry, Phil & Drums Jam	1		7	2
249	2016-02-18 17:24:18.202285+00	226	The Palestra - University of Rochester, Rochester, None	1		9	2
250	2016-02-18 22:44:58.073285+00	475	Garcia Interplay	1		7	2
251	2016-02-18 22:45:53.786534+00	475	Jerry Interplay	2	Changed name and shortname.	7	2
252	2016-02-18 23:12:45.764058+00	2892	Jerry Interplay, in 2nd set, 25 of May, 1977	2	Changed song.	14	2
253	2016-02-19 06:10:15.727648+00	227	Maine State Fairgrounds, Lewistown, None	1		9	2
254	2016-02-20 11:20:57.902355+00	476	Run Rudolph Run	1		7	4
255	2016-02-20 20:03:01.336201+00	142	Electric Factory, Philadelphia, None	2	Changed city.	9	2
256	2016-02-20 20:03:21.577205+00	100	Philadelphia Convention Hall and Civic Center, Philadelphia, None	2	Changed city.	9	2
257	2016-02-26 19:24:44.649165+00	143	14 of Mar, 1990, Capital Centre	2	Changed venue, time_started and time_ended.	12	4
258	2016-02-26 23:33:33.311734+00	3249	Stella Blue, in 2nd set, 16 of Mar, 1990	2	Changed seque.	14	4
259	2016-03-01 04:28:29.410383+00	150	2 of Nov, 1985, Memorial Coliseum, University of Alabama	3		12	4
260	2016-03-01 04:44:36.570069+00	232	Cobo Arena, Detroit, None	1		9	4
261	2016-03-01 04:44:56.963711+00	231	Cobo Arena, Detroit, None	3		9	4
262	2016-03-01 04:44:56.979066+00	230	Cobo Arena, Detroit, None	3		9	4
263	2016-03-01 04:45:25.644312+00	151	1 of Nov, 1977, Cobo Arena	2	Changed venue, time_started and time_ended.	12	4
264	2016-03-04 06:10:27.614478+00	3470	Other One, in 2nd set, 13 of Aug, 1979	2	Changed comments.	14	4
265	2016-03-04 23:55:34.426351+00	477	Jerry, Keith & Phil Interplay	1		7	2
266	2016-03-04 23:56:11.598095+00	3608	Jerry, Keith & Phil Interplay, in 2nd set, 31 of Dec, 1976	2	Changed song.	14	2
267	2016-03-07 03:05:01.247759+00	234	Shrine Auditorium, Los Angeles, None	1		9	4
268	2016-03-11 17:23:28.230424+00	235	Sacramento Memorial Auditorium, Sacramento, None	1		9	2
269	2016-03-12 07:44:34.794243+00	3909	Descending Four Chord Sequence, in 2nd set, 17 of Oct, 1974	2	Changed song.	14	2
270	2016-03-15 02:49:41.615382+00	124	Alfond Arena, Orono, None	2	Changed name.	9	4
271	2016-03-15 15:58:19.431994+00	236	Zenith, Paris, France	1		9	2
272	2016-03-22 15:09:18.562362+00	237	Pauley Pavilion, University of California, Los Angeles, Los Angeles, None	1		9	4
273	2016-03-26 19:09:52.209832+00	239	The Downs at Santa Fe, Santa Fe, None	1		9	4
274	2016-03-26 19:10:05.128007+00	238	Downs of Santa Fe, Santa Fe, None	3		9	4
275	2016-03-26 19:10:32.587162+00	201	11 of Sep, 1983, The Downs at Santa Fe	2	Changed venue, time_started and time_ended.	12	4
276	2016-03-27 03:17:44.38469+00	240	Long Beach Arena, Long Beach, None	1		9	2
277	2016-03-27 03:24:20.102678+00	478	Jerry, Brent & Drummers Jam	1		7	2
278	2016-03-27 03:24:36.117545+00	479	Brent & Drummers Jam	1		7	2
279	2016-03-27 03:24:47.015076+00	480	Bob & Drummers Jam	1		7	2
280	2016-03-27 03:25:25.737315+00	4602	Jerry, Brent & Drummers Jam, in 2nd set, 28 of Aug, 1981	2	Changed song.	14	2
281	2016-03-27 03:25:42.686295+00	4603	Brent & Drummers Jam, in 2nd set, 28 of Aug, 1981	2	Changed song.	14	2
282	2016-03-27 03:25:58.452865+00	4606	Bob & Drummers Jam, in 2nd set, 28 of Aug, 1981	2	Changed song.	14	2
283	2016-03-28 23:45:55.093706+00	481	Close Encounters 	1		7	2
284	2016-03-28 23:54:42.542715+00	4737	Close Encounters , in 2nd set, 8 of Apr, 1978	2	Changed song.	14	4
285	2016-03-30 04:11:33.344911+00	241	Alumni Stadium, University of Massachusetts, Amherst, None	1		9	4
286	2016-03-31 15:53:47.923483+00	242	Austin Municipal Auditorium, Austin, None	1		9	2
287	2016-04-02 10:38:24.914557+00	214	23 of Nov, 1979	3		11	4
288	2016-04-02 19:06:06.071558+00	243	Fillmore East, New York, None	1		9	2
289	2016-04-02 19:40:02.426269+00	124	Good Morning, School Girl	2	Changed name and shortname.	7	2
290	2016-04-03 01:05:56.038381+00	244	Feyline Field, Tempe, None	1		9	2
291	2016-04-06 23:42:29.931192+00	245	Calavaras County Fairgrounds, Angel's Camp, None	1		9	2
292	2016-04-07 00:29:50.169917+00	5224	Bird Song, in 1st set, 22 of Aug, 1987	2	Changed comments.	14	2
293	2016-04-08 17:22:52.307+00	246	Felt Forum, New York City, None	1		9	2
294	2016-04-09 06:51:46.454687+00	247	Seminole Indian Village, West Hollywood, None	1		9	4
295	2016-04-09 08:04:36.367456+00	5391	Bertha, in 2nd set, 30 of Jan, 1978	2	Changed comments.	14	4
296	2016-04-09 13:10:30.947244+00	248	Manhattan Center, New York, None	1		9	4
297	2016-04-09 19:20:15.157191+00	249	Scope, Norfolk, None	1		9	4
298	2016-04-12 14:10:20.081303+00	250	Reunion Arena, Dallas, None	1		9	4
299	2016-04-13 17:48:37.504737+00	482	Bralove 	1		7	2
300	2016-04-13 17:48:57.537947+00	482	Bralove Sounds	2	Changed name and shortname.	7	2
301	2016-04-13 18:02:43.729417+00	5766	Bralove Sounds, in 2nd set, 30 of Mar, 1994	2	Changed song.	14	2
302	2016-04-13 18:04:15.7911+00	5768	Free Form Jam, in 2nd set, 30 of Mar, 1994	2	Changed length.	14	2
303	2016-04-13 18:04:58.629549+00	5768	Free Form Jam, in 2nd set, 30 of Mar, 1994	2	Changed seque.	14	2
304	2016-04-13 18:05:14.63964+00	5769	I Need A Miracle, in 2nd set, 30 of Mar, 1994	2	Changed seque.	14	2
305	2016-04-13 18:05:22.980788+00	5770	Stella Blue, in 2nd set, 30 of Mar, 1994	2	Changed seque.	14	2
306	2016-04-13 21:21:49.765381+00	251	Starlight Theatre, Kansas City, None	1		9	2
307	2016-04-13 21:21:55.280546+00	252	Starlight Theatre, Kansas City, None	1		9	2
308	2016-04-13 21:22:04.363502+00	252	Starlight Theatre, Kansas City, None	3		9	2
309	2016-04-15 21:30:40.036798+00	253	Cobo Arena, Detriot, None	1		9	2
310	2016-04-15 21:31:45.828378+00	253	Cobo Arena, Detriot, None	3		9	2
311	2016-04-18 15:52:32.956024+00	6053	Playing Reprise, in 2nd set, 11 of Jan, 1978	2	Changed length.	14	4
312	2016-04-18 18:06:19.980037+00	6064	China Cat Sunflower, in 2nd set, 19 of Apr, 1987	2	Changed seque.	14	2
313	2016-04-18 18:06:31.58075+00	6065	Weir's Segue, in 2nd set, 19 of Apr, 1987	2	Changed seque.	14	2
314	2016-04-20 20:24:19.008601+00	254	UniDome - University of Northern Iowa, Cedar Falls, None	1		9	2
315	2016-04-21 07:00:59.644533+00	483	Phil Interplay	1		7	2
316	2016-04-21 07:01:25.511755+00	6209	Phil Interplay, in 2nd set, 19 of Dec, 1973	2	Changed song.	14	2
317	2016-04-21 22:56:48.310054+00	6227	Fire On The Mountain, in 2nd set, 1 of Oct, 1988	2	Changed comments.	14	4
318	2016-04-26 17:17:44.325125+00	484	King Solomon's Marbles	1		7	4
319	2016-04-26 17:22:01.785504+00	6369	King Solomon's Marbles, in 1st set, 28 of Sep, 1975	2	Changed song.	14	4
320	2016-04-26 17:22:11.706621+00	6369	King Solomon's Marbles, in 1st set, 28 of Sep, 1975	2	Changed comments.	14	4
321	2016-04-29 01:07:19.560348+00	6549	Eyes Of The World, in 2nd set, 30 of Nov, 1981	2	Changed length.	14	4
322	2016-04-29 02:14:47.712054+00	6569	Improv, in 2nd set, 7 of Jul, 1984	2	Changed seque.	14	4
323	2016-04-29 20:24:46.914039+00	257	Cleveland Music Hall, Cleveland, None	1		9	2
324	2016-04-30 00:14:24.649045+00	6696	Playing Reprise, in 2nd set, 16 of Jun, 1974	2	Changed length.	14	2
325	2016-04-30 22:23:10.193012+00	258	Horton Field House, Illinois State University, Normal, None	3		9	4
326	2016-04-30 22:23:53.27378+00	259	Horton Field House, Illinois State University, Normal, None	1		9	4
327	2016-04-30 22:24:25.364719+00	302	24 of Apr, 1978, Horton Field House, Illinois State University	2	Changed venue, time_started and time_ended.	12	4
328	2016-05-07 01:19:43.011192+00	260	Rupert Thompson Arena, Dartmouth College, Hanover, None	1		9	4
329	2016-05-07 04:11:30.308015+00	313	5 of May, 1978, Rupert Thompson Arena, Dartmouth College	3		12	4
330	2016-05-07 04:11:40.456318+00	312	5 of May, 1978, Rupert Thompson Arena, Dartmouth College	3		12	4
331	2016-05-09 15:13:25.933654+00	261	Oxford Plains Speedway, Oxford, None	1		9	2
332	2016-05-09 15:31:09.886463+00	318	3 of Jul, 1988, Oxford Plains Speedway	2	Changed venue, time_started and time_ended.	12	2
333	2016-05-10 05:24:13.73768+00	7442	Truckin', in 2nd set, 7 of Sep, 1987	2	Changed comments.	14	4
334	2016-05-10 21:15:37.967403+00	138	3 of May, 1987	2	Changed day.	11	2
335	2016-05-10 21:17:13.512856+00	262	Laguna Seca Raceway, Monterey, None	1		9	2
336	2016-05-11 23:53:27.755843+00	263	RPI Field House, Troy, None	1		9	4
337	2016-05-12 12:36:26.447084+00	7385	Free Form Jam, in 2nd set, 14 of Jan, 1978	2	Changed song and comments.	14	4
338	2016-05-12 15:54:12.014459+00	7529	Jerry Interplay, in 2nd set, 3 of May, 1977	2	Changed seque.	14	4
339	2016-05-13 14:15:04.38987+00	485	Not Fade Away Jam	1		7	4
340	2016-05-17 12:12:32.348163+00	264	Bayfront Center, St. Petersburg, None	1		9	4
341	2016-05-18 02:05:02.62035+00	265	Oakland Auditorium, Oakland, None	1		9	2
342	2016-05-19 14:43:41.572995+00	7854	U.S. Blues, in 3rd set, 25 of Apr, 1977	2	Changed comments.	14	4
343	2016-05-21 05:46:58.040363+00	7935	The Eleven, in 2nd set, 22 of Feb, 1969	2	Changed seque.	14	4
344	2016-05-26 21:33:58.62007+00	7977	Eyes Of The World, in 2nd set, 16 of Apr, 1978	2	Changed comments.	14	4
345	2016-05-26 21:35:23.168916+00	7560	Cassidy, in 1st set, 31 of Aug, 1979	2	Changed comments.	14	4
346	2016-05-28 03:32:57.122878+00	266	Dream Bowl, Vallejo, None	1		9	2
347	2016-05-28 20:37:29.342049+00	267	Pershing Municipal Auditorium, Lincoln, None	1		9	2
348	2016-05-29 00:37:02.27088+00	8366	Space, in 2nd set, 28 of Jul, 1982	2	Changed length.	14	4
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 348, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	songs	song
8	songs	alternatename
9	venues	venue
10	tours	tour
11	shows	showdate
12	shows	show
13	shows	playedset
14	shows	playedsong
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('django_content_type_id_seq', 14, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-12-10 06:32:35.90279+00
2	auth	0001_initial	2015-12-10 06:32:36.01648+00
3	admin	0001_initial	2015-12-10 06:32:36.039362+00
4	contenttypes	0002_remove_content_type_name	2015-12-10 06:32:36.100066+00
5	auth	0002_alter_permission_name_max_length	2015-12-10 06:32:36.12174+00
6	auth	0003_alter_user_email_max_length	2015-12-10 06:32:36.147463+00
7	auth	0004_alter_user_username_opts	2015-12-10 06:32:36.159658+00
8	auth	0005_alter_user_last_login_null	2015-12-10 06:32:36.174173+00
9	auth	0006_require_contenttypes_0002	2015-12-10 06:32:36.175327+00
10	sessions	0001_initial	2015-12-10 06:32:36.185611+00
11	venues	0001_initial	2015-12-10 06:32:36.194733+00
12	venues	0002_auto_20151128_0648	2015-12-10 06:32:36.201882+00
13	songs	0001_initial	2015-12-10 06:32:36.238187+00
14	shows	0001_initial	2015-12-10 06:32:36.31457+00
15	shows	0002_auto_20151208_0732	2015-12-10 06:32:36.429166+00
16	tours	0001_initial	2015-12-10 06:32:36.483619+00
17	venues	0003_auto_20151208_0732	2015-12-10 06:32:36.497181+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('django_migrations_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
s5kryvzsdh61m7etsu4xnff9bmk9ak9e	YWY1YTNkNjIzYzU4Yjc1ZWU0MWQ0NmYwYzlmYmMzMTQ0YzU0ZDM0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0NGZkMDYwNGI4YjM4Yjg1YzMyNjk4NzQ4YTY4MjExYzdjMGQzYzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-12-24 06:38:10.462989+00
b0fhhadu6qust1f2rkmewvg6tyai9vee	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2015-12-24 23:40:25.035144+00
totvtdthtb0wo4l137k3tafz4r5mu9rg	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-01-01 06:49:44.84491+00
mzz5grintx089qbektc9kec6emchf8j1	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-01-18 06:06:56.273984+00
0wq126bfbqclavir4m0idj1fld3fe9sd	YWY1YTNkNjIzYzU4Yjc1ZWU0MWQ0NmYwYzlmYmMzMTQ0YzU0ZDM0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6Ijk0NGZkMDYwNGI4YjM4Yjg1YzMyNjk4NzQ4YTY4MjExYzdjMGQzYzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-19 08:49:59.747639+00
hg4e8s6b8wtzsccsge8i90yz0jg96rdy	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-01-26 07:24:08.506989+00
8zebec3ki58z7atllnthsrl1t4n2vqk9	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-02-02 23:51:20.061648+00
pyynvxza6dntahqswvx80dz75lw8qkio	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-02-10 05:12:17.375798+00
3xm51fwx3qfbydd0bcwreisr42p9itwv	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-02-18 19:06:09.43287+00
p3qz8pj21lxsmc6clnqnqvp1kvkmbsg4	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-02-25 01:18:07.09034+00
3xmxapdmot1qb599tdrbuaoqtmi4g5n3	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-03-04 06:09:09.955969+00
phqr8b9whf7sinuvtbci99wsv37zf12d	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-03-11 18:35:49.948158+00
sc1fayaet9y161gtx9y6o6rt2xhc2c49	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-03-18 18:57:30.116164+00
wj722bhvto2z2q5kz1u3fxk93fouoi3h	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-03-26 01:20:40.914815+00
rt8tmv9o5rfrs94rg950f1g8nj6nfs1p	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-04-04 18:39:00.747635+00
ilmsfdj9r2rqxhsvtqv2loc8ismrut25	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-04-09 11:10:07.782476+00
9ln50gwnor9qtnq1r8wavsynh3uc46ht	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-04-19 21:29:34.034561+00
qilvnvsipl2e46qavkloem4wtolxdoch	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-04-23 12:55:08.496015+00
z0te49qfhpojkdwey6rztdh8sgccevl4	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-05-07 20:53:54.883453+00
gx5l220xho4czt923irclq3ph2stypen	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-05-08 03:44:55.236313+00
wqfwdj2ki8irgzcrur6wq90c39rdyn8i	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-05-22 20:40:04.594541+00
pntvfsr3olk2z9modqx8r8l7rywqz65k	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-05-23 14:18:49.163316+00
ehitddh2u4dnxvx465n9ls05gawm1lto	NDljMjEyZjQ2ZmUyNjE3NmIxOWM5N2U3MjA3ZmQ1MjA5M2RiMjc5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcyYmE4YzgwYjFmMjRiY2FkOTNhMzNlZDQ2M2JlNTY5NmFiZWYxMzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2016-06-07 07:32:06.587657+00
odg0ladvuj8ta3l7q6lls4e4lbl43l74	NTVhMWM0Mzk2YzlhYmIyMWVlM2FiYzgzM2Y2ZTA1ZDJhNzU2NWRhYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzNWUzNDQ0MzA2MmE5Y2Y1MDllODA4MjA1NzBjM2VmZDhhMmE4MGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-06-07 16:05:00.137381+00
\.


--
-- Data for Name: shows_playedset; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY shows_playedset (id, "order", encore, show_id) FROM stdin;
24	1	f	9
25	2	f	9
27	1	f	10
28	2	f	10
30	1	f	11
31	2	f	11
26	3	t	9
32	3	t	11
29	3	t	10
33	1	f	12
34	2	f	12
35	1	f	13
36	2	f	13
37	3	f	13
38	1	f	14
39	2	f	14
40	3	f	14
41	1	f	15
42	2	f	15
43	3	f	15
44	1	f	16
45	2	f	16
46	3	f	16
47	1	f	17
48	2	f	17
49	3	f	17
50	4	f	17
51	1	f	18
52	2	f	18
53	3	f	18
54	1	f	19
55	2	f	19
56	3	f	19
57	4	f	19
58	1	f	20
59	2	f	20
60	3	f	20
61	1	f	21
62	2	f	21
63	3	f	21
64	1	f	22
65	2	f	22
66	3	f	22
67	1	f	23
68	2	f	23
69	3	f	23
70	1	f	24
71	2	f	24
72	3	f	24
73	1	f	25
74	2	f	25
75	3	f	25
76	1	f	26
77	2	f	26
78	3	f	26
79	1	f	27
80	2	f	27
81	3	f	27
82	1	f	28
83	2	f	28
84	3	f	28
85	1	f	29
86	2	f	29
87	3	f	29
91	1	f	31
92	2	f	31
93	1	f	32
94	2	f	32
95	1	f	33
96	2	f	33
97	3	f	33
98	1	f	34
99	2	f	34
100	3	f	34
101	1	f	35
102	2	f	35
103	3	f	35
104	1	f	36
105	2	f	36
106	3	f	36
107	1	f	37
108	2	f	37
109	3	f	37
110	1	f	38
111	2	f	38
112	3	f	38
113	1	f	39
114	2	f	39
115	3	f	39
116	1	f	40
117	2	f	40
118	3	f	40
119	1	f	41
120	2	f	41
121	3	f	41
122	1	f	42
123	2	f	42
124	3	f	42
125	1	f	43
126	2	f	43
127	3	f	43
128	1	f	44
129	2	f	44
130	3	f	44
131	1	f	45
132	2	f	45
133	3	f	45
134	1	f	46
135	2	f	46
136	3	f	46
137	1	f	47
138	2	f	47
139	3	f	47
140	1	f	48
141	2	f	48
142	3	f	48
143	1	f	49
144	2	f	49
145	1	f	50
146	2	f	50
147	3	f	50
148	1	f	51
149	2	f	51
150	3	f	51
151	1	f	52
152	2	f	52
153	3	f	52
154	1	f	53
155	2	f	53
156	3	f	53
157	1	f	54
158	2	f	54
159	3	f	54
160	1	f	55
161	2	f	55
162	3	f	55
163	1	f	56
164	2	f	56
165	3	f	56
166	1	f	57
167	2	f	57
168	3	f	57
169	1	f	58
170	2	f	58
171	3	f	58
172	1	f	59
173	2	f	59
174	3	f	59
175	1	f	60
176	2	f	60
177	3	f	60
178	1	f	61
179	2	f	61
180	3	f	61
181	1	f	62
182	2	f	62
183	3	f	62
187	1	f	64
188	2	f	64
189	1	f	65
190	2	f	65
191	3	f	65
192	1	f	66
193	2	f	66
194	3	f	66
195	1	f	67
196	2	f	67
197	3	f	67
198	1	f	68
199	2	f	68
200	3	f	68
201	1	f	69
202	2	f	69
203	3	f	69
204	1	f	70
205	2	f	70
206	3	f	70
207	1	f	71
208	2	f	71
209	3	f	71
210	1	f	72
211	2	f	72
212	3	f	72
213	1	f	73
214	2	f	73
215	3	f	73
216	1	f	74
217	2	f	74
218	3	f	74
219	1	f	75
220	2	f	75
221	3	f	75
222	1	f	76
223	2	f	76
224	3	f	76
225	1	f	77
226	2	f	77
227	3	f	77
228	1	f	78
229	2	f	78
230	3	f	78
231	1	f	79
232	2	f	79
233	3	f	79
234	1	f	80
235	2	f	80
236	3	f	80
237	1	f	81
238	2	f	81
239	3	f	81
240	1	f	82
241	2	f	82
242	1	f	83
243	2	f	83
244	3	f	83
245	1	f	84
246	2	f	84
247	3	f	84
248	1	f	85
249	2	f	85
250	3	f	85
251	1	f	86
252	2	f	86
253	3	f	86
254	1	f	87
255	2	f	87
256	3	f	87
257	1	f	88
258	2	f	88
259	3	f	88
260	1	f	89
261	2	f	89
262	3	f	89
263	1	f	90
264	2	f	90
265	3	f	90
266	1	f	91
267	2	f	91
268	1	f	92
269	2	f	92
270	3	f	92
271	1	f	93
272	2	f	93
273	3	f	93
274	1	f	94
275	2	f	94
276	3	f	94
277	1	f	95
278	2	f	95
279	3	f	95
280	1	f	96
281	2	f	96
282	3	f	96
283	1	f	97
284	2	f	97
285	3	f	97
286	1	f	98
287	2	f	98
288	3	f	98
289	1	f	99
290	2	f	99
291	3	f	99
292	1	f	100
293	2	f	100
294	3	f	100
295	1	f	101
296	2	f	101
297	3	f	101
298	1	f	102
299	2	f	102
300	3	f	102
301	1	f	103
302	2	f	103
303	3	f	103
304	1	f	104
305	2	f	104
306	3	f	104
307	1	f	105
308	2	f	105
309	3	f	105
310	1	f	106
311	2	f	106
312	3	f	106
313	1	f	107
314	2	f	107
315	3	f	107
316	1	f	108
317	2	f	108
318	3	f	108
319	1	f	109
320	2	f	109
321	3	f	109
322	1	f	110
323	2	f	110
324	3	f	110
325	1	f	111
326	2	f	111
327	3	f	111
328	1	f	112
329	2	f	112
330	3	f	112
331	1	f	113
332	2	f	113
333	3	f	113
334	1	f	114
335	2	f	114
336	3	f	114
337	1	f	115
338	2	f	115
339	3	f	115
340	1	f	116
341	2	f	116
342	3	f	116
343	1	f	117
344	2	f	117
345	3	f	117
346	1	f	118
347	2	f	118
348	3	f	118
349	1	f	119
350	2	f	119
351	3	f	119
352	1	f	120
353	2	f	120
354	3	f	120
355	1	f	121
356	2	f	121
357	3	f	121
358	1	f	122
359	2	f	122
360	3	f	122
361	1	f	123
362	2	f	123
363	1	f	124
364	2	f	124
365	3	f	124
366	1	f	125
367	2	f	125
368	3	f	125
369	1	f	126
370	2	f	126
371	3	f	126
372	1	f	127
373	2	f	127
374	1	f	128
375	2	f	128
376	3	f	128
377	1	f	129
378	2	f	129
379	3	f	129
380	1	f	130
381	2	f	130
382	3	f	130
383	1	f	131
384	2	f	131
385	3	f	131
386	1	f	132
387	2	f	132
388	3	f	132
389	1	f	133
390	2	f	133
391	3	f	133
392	1	f	134
393	2	f	134
394	3	f	134
395	1	f	135
396	2	f	135
397	1	f	136
398	2	f	136
399	3	f	136
400	1	f	137
401	2	f	137
402	3	f	137
403	1	f	138
404	2	f	138
405	3	f	138
406	1	f	139
407	2	f	139
408	3	f	139
409	1	f	140
410	2	f	140
411	3	f	140
412	1	f	141
413	2	f	141
414	3	f	141
415	1	f	142
416	2	f	142
417	3	f	142
418	1	f	143
419	2	f	143
420	3	f	143
421	1	f	144
422	2	f	144
423	3	f	144
424	1	f	145
425	2	f	145
426	3	f	145
427	1	f	146
428	2	f	146
429	3	f	146
430	1	f	147
431	2	f	147
432	3	f	147
433	1	f	148
434	2	f	148
435	3	f	148
436	1	f	149
437	2	f	149
438	3	f	149
439	1	f	151
440	2	f	151
441	3	f	151
442	1	f	152
443	2	f	152
444	3	f	152
445	1	f	153
446	2	f	153
447	3	f	153
448	1	f	154
449	2	f	154
450	3	f	154
451	1	f	155
452	2	f	155
453	3	f	155
454	1	f	156
455	2	f	156
456	3	f	156
457	1	f	157
458	1	f	158
459	2	f	158
460	1	f	159
461	2	f	159
462	3	f	159
463	1	f	160
464	2	f	160
465	3	f	160
466	1	f	161
467	2	f	161
468	3	f	161
469	1	f	162
470	2	f	162
471	3	f	162
472	1	f	163
473	2	f	163
474	3	f	163
475	1	f	164
476	2	f	164
477	3	f	164
478	1	f	165
479	2	f	165
480	3	f	165
481	1	f	166
482	2	f	166
483	3	f	166
484	1	f	167
485	2	f	167
486	3	f	167
487	1	f	168
488	2	f	168
489	3	f	168
490	1	f	169
491	2	f	169
492	3	f	169
493	1	f	170
494	2	f	170
495	3	f	170
496	1	f	171
497	2	f	171
498	3	f	171
499	1	f	172
500	2	f	172
501	3	f	172
502	1	f	173
503	2	f	173
504	3	f	173
505	1	f	174
506	2	f	174
507	3	f	174
508	1	f	175
509	2	f	175
510	3	f	175
511	1	f	176
512	2	f	176
513	3	f	176
514	1	f	177
515	2	f	177
516	3	f	177
517	1	f	178
518	2	f	178
519	1	f	179
520	2	f	179
521	3	f	179
522	1	f	180
523	2	f	180
524	3	f	180
525	1	f	181
526	2	f	181
527	3	f	181
528	1	f	182
529	2	f	182
530	3	f	182
531	1	f	183
532	2	f	183
533	3	f	183
534	1	f	184
535	2	f	184
536	3	f	184
537	1	f	185
538	2	f	185
539	3	f	185
540	1	f	186
541	2	f	186
542	3	f	186
543	1	f	187
544	2	f	187
545	3	f	187
546	1	f	188
547	2	f	188
548	1	f	189
549	2	f	189
550	3	f	189
551	1	f	190
552	2	f	190
553	3	f	190
554	1	f	191
555	2	f	191
556	3	f	191
557	1	f	192
558	2	f	192
559	3	f	192
560	4	f	192
561	1	f	193
562	2	f	193
563	3	f	193
564	1	f	194
565	2	f	194
566	3	f	194
567	1	f	195
568	2	f	195
569	3	f	195
570	1	f	196
571	2	f	196
572	3	f	196
573	1	f	197
574	2	f	197
575	3	f	197
576	1	f	198
577	2	f	198
578	3	f	198
579	1	f	199
580	2	f	199
581	3	f	199
582	1	f	200
583	2	f	200
584	3	f	200
585	1	f	201
586	2	f	201
587	3	f	201
588	1	f	202
589	2	f	202
590	3	f	202
591	1	f	203
592	2	f	203
593	3	f	203
594	1	f	204
595	2	f	204
596	3	f	204
597	1	f	205
598	2	f	205
599	3	f	205
600	1	f	206
601	2	f	206
602	3	f	206
603	1	f	207
604	2	f	207
605	3	f	207
606	1	f	208
607	2	f	208
608	3	f	208
609	4	f	208
610	1	f	209
611	2	f	209
612	3	f	209
613	1	f	210
614	2	f	210
615	3	f	210
616	1	f	211
617	2	f	211
618	3	f	211
619	1	f	212
620	2	f	212
621	3	f	212
622	1	f	213
623	2	f	213
624	3	f	213
625	1	f	215
626	2	f	215
627	3	f	215
628	1	f	216
629	2	f	216
630	1	f	217
631	2	f	217
632	3	f	217
633	1	f	218
634	2	f	218
635	3	f	218
636	1	f	219
637	2	f	219
638	3	f	219
639	1	f	220
640	2	f	220
641	3	f	220
642	1	f	221
643	2	f	221
644	3	f	221
645	1	f	222
646	2	f	222
647	3	f	222
648	1	f	223
649	2	f	223
650	3	f	223
651	1	f	224
652	2	f	224
653	3	f	224
654	1	f	225
655	2	f	225
656	3	f	225
657	4	f	225
658	1	f	226
659	2	f	226
660	3	f	226
661	1	f	227
662	2	f	227
663	3	f	227
664	1	f	228
665	2	f	228
666	3	f	228
667	1	f	229
668	2	f	229
669	3	f	229
670	1	f	230
671	2	f	230
672	3	f	230
673	1	f	231
674	2	f	231
675	1	f	232
676	2	f	232
677	3	f	232
678	1	f	233
679	2	f	233
680	1	f	234
681	2	f	234
682	3	f	234
683	1	f	235
684	2	f	235
685	3	f	235
686	1	f	236
687	1	f	237
688	2	f	237
689	1	f	238
690	2	f	238
691	3	f	238
692	1	f	239
693	2	f	239
694	3	f	239
695	1	f	240
696	2	f	240
697	1	f	241
698	2	f	241
699	3	f	241
700	1	f	242
701	2	f	242
702	3	f	242
703	1	f	243
704	2	f	243
705	3	f	243
706	1	f	244
707	2	f	244
708	3	f	244
709	1	f	245
710	2	f	245
711	3	f	245
712	1	f	246
713	2	f	246
714	3	f	246
715	1	f	247
716	2	f	247
717	3	f	247
718	1	f	248
719	2	f	248
720	3	f	248
721	1	f	249
722	2	f	249
723	3	f	249
724	1	f	250
725	2	f	250
726	3	f	250
727	1	f	251
728	2	f	251
729	3	f	251
730	1	f	252
731	2	f	252
732	3	f	252
733	1	f	253
734	2	f	253
735	3	f	253
736	1	f	254
737	2	f	254
738	3	f	254
739	1	f	255
740	2	f	255
741	1	f	256
742	2	f	256
743	3	f	256
744	1	f	257
745	2	f	257
746	3	f	257
747	1	f	258
748	2	f	258
749	3	f	258
750	1	f	259
751	2	f	259
752	3	f	259
753	1	f	260
754	2	f	260
755	3	f	260
756	1	f	261
757	2	f	261
758	3	f	261
759	1	f	262
760	2	f	262
761	1	f	263
762	2	f	263
763	3	f	263
764	1	f	264
765	2	f	264
766	3	f	264
767	1	f	265
768	2	f	265
769	3	f	265
770	1	f	266
771	2	f	266
772	3	f	266
773	1	f	267
774	2	f	267
775	3	f	267
776	1	f	268
777	2	f	268
778	3	f	268
779	1	f	269
780	2	f	269
781	3	f	269
782	1	f	270
783	2	f	270
784	3	f	270
785	1	f	271
786	2	f	271
787	3	f	271
788	1	f	272
789	2	f	272
790	3	f	272
791	1	f	273
792	2	f	273
793	3	f	273
794	1	f	274
795	2	f	274
796	3	f	274
797	1	f	275
798	2	f	275
799	3	f	275
800	1	f	276
801	2	f	276
802	1	f	277
803	2	f	277
804	3	f	277
805	1	f	278
806	1	f	279
807	2	f	279
808	3	f	279
809	1	f	280
810	2	f	280
811	1	f	281
812	2	f	281
813	3	f	281
814	1	f	282
815	2	f	282
816	3	f	282
817	1	f	283
818	2	f	283
819	3	f	283
820	1	f	284
821	2	f	284
822	3	f	284
823	1	f	285
824	2	f	285
825	3	f	285
826	1	f	286
827	2	f	286
828	3	f	286
829	1	f	287
830	2	f	287
831	3	f	287
832	1	f	288
833	2	f	288
834	3	f	288
835	1	f	289
836	2	f	289
837	3	f	289
838	1	f	290
839	2	f	290
840	3	f	290
841	1	f	291
842	2	f	291
843	3	f	291
844	4	f	291
845	1	f	292
846	2	f	292
847	3	f	292
848	1	f	293
849	2	f	293
850	3	f	293
851	1	f	294
852	2	f	294
853	3	f	294
854	1	f	295
855	2	f	295
856	3	f	295
857	1	f	296
858	2	f	296
859	3	f	296
860	1	f	297
861	2	f	297
862	3	f	297
863	1	f	298
864	2	f	298
865	3	f	298
866	1	f	299
867	2	f	299
868	1	f	300
869	2	f	300
870	1	f	301
871	2	f	301
872	3	f	301
873	1	f	302
874	2	f	302
875	3	f	302
876	1	f	303
877	2	f	303
878	3	f	303
879	1	f	304
880	2	f	304
881	3	f	304
882	1	f	305
883	2	f	305
884	3	f	305
885	1	f	306
886	2	f	306
887	3	f	306
888	1	f	307
889	2	f	307
890	3	f	307
891	1	f	308
892	2	f	308
893	3	f	308
894	1	f	309
895	2	f	309
896	3	f	309
897	1	f	310
898	2	f	310
899	1	f	311
903	2	f	311
906	3	f	311
908	1	f	314
909	2	f	314
910	3	f	314
911	1	f	315
912	2	f	315
913	3	f	315
914	1	f	316
915	2	f	316
916	3	f	316
917	1	f	317
918	2	f	317
919	3	f	317
920	1	f	318
921	2	f	318
922	3	f	318
923	1	f	319
924	2	f	319
925	3	f	319
926	1	f	320
927	2	f	320
928	3	f	320
929	1	f	321
930	2	f	321
931	1	f	322
932	2	f	322
933	3	f	322
934	4	f	322
935	1	f	323
936	2	f	323
937	3	f	323
938	1	f	324
939	2	f	324
940	3	f	324
941	1	f	325
942	2	f	325
943	3	f	325
944	1	f	326
945	2	f	326
946	3	f	326
947	1	f	327
948	2	f	327
949	3	f	327
950	1	f	328
951	2	f	328
952	3	f	328
953	1	f	329
954	2	f	329
955	1	f	330
956	2	f	330
957	3	f	330
958	1	f	331
959	2	f	331
960	3	f	331
961	1	f	332
962	2	f	332
963	3	f	332
964	1	f	333
965	2	f	333
966	3	f	333
967	1	f	334
968	2	f	334
969	3	f	334
970	1	f	335
971	2	f	335
972	3	f	335
973	1	f	336
974	2	f	336
975	3	f	336
976	1	f	337
977	2	f	337
978	3	f	337
979	1	f	338
980	2	f	338
981	3	f	338
982	1	f	339
983	2	f	339
984	3	f	339
985	1	f	340
986	2	f	340
987	3	f	340
988	1	f	341
989	2	f	341
990	3	f	341
991	1	f	342
992	2	f	342
993	3	f	342
994	1	f	343
995	2	f	343
996	3	f	343
997	1	f	344
998	2	f	344
999	3	f	344
1000	1	f	345
1001	2	f	345
1002	3	f	345
1003	1	f	346
1004	2	f	346
1005	1	f	347
1006	2	f	347
1007	3	f	347
1008	1	f	348
1009	2	f	348
1010	3	f	348
1011	1	f	349
1012	2	f	349
1013	3	f	349
1014	1	f	350
1015	2	f	350
1016	3	f	350
1017	1	f	351
1018	2	f	351
1019	3	f	351
1020	1	f	352
1021	2	f	352
1022	3	f	352
1023	1	f	353
1024	2	f	353
1025	3	f	353
1026	1	f	354
1027	2	f	354
1028	3	f	354
1029	1	f	355
1030	2	f	355
1031	1	f	356
1032	2	f	356
1033	3	f	356
1034	1	f	357
1035	2	f	357
1036	3	f	357
1037	1	f	358
1038	2	f	358
1039	3	f	358
1040	1	f	359
1041	2	f	359
1042	3	f	359
1043	1	f	360
1044	2	f	360
1045	3	f	360
1046	1	f	361
1047	1	f	362
1048	2	f	362
1049	3	f	362
1050	1	f	363
1051	2	f	363
1052	1	f	364
1053	2	f	364
1054	3	f	364
1055	1	f	365
1056	2	f	365
1057	3	f	365
1058	1	f	366
1059	2	f	366
1060	3	f	366
\.


--
-- Name: shows_playedset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('shows_playedset_id_seq', 1060, true);


--
-- Data for Name: shows_playedsong; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY shows_playedsong (id, "order", length, comments, played_set_id, song_id, seque) FROM stdin;
71	1	174		24	345	f
72	2	426		24	318	f
73	3	357	Garcia played the opening notes of Jack Straw	24	33	f
74	4	217		24	114	f
75	5	274		24	99	f
76	6	619		24	29	f
77	7	295		24	28	f
78	8	450		24	329	f
79	9	207		24	223	f
82	12	360		24	155	f
85	15	116		24	426	f
86	16	350		24	49	f
89	3	120	Get Back Truckin' On 7 Times	25	427	f
90	4	396		25	208	f
91	5	287		25	178	f
92	6	508		25	228	f
93	7	180		25	222	f
109	23	584		25	298	f
110	24	510	14 sec break before Sunshine Daydream	25	316	f
111	25	418		25	372	f
112	1	278		26	257	f
113	1	181		27	222	f
114	2	418		27	318	f
115	3	282		27	178	f
116	4	240		27	86	f
117	5	386		27	33	f
118	6	273		27	27	f
119	7	200		27	223	f
120	8	314		27	355	f
121	9	436		27	206	f
122	10	641		27	140	f
123	11	287		27	28	f
124	12	334		27	40	f
125	13	68		27	391	t
126	14	259		27	390	t
127	15	519		27	198	f
128	1	455		28	228	t
129	2	165		28	264	t
130	3	505		28	425	t
131	4	49		28	428	t
132	5	240		28	99	t
262	15	333		39	121	t
263	16	559		39	394	t
264	17	466		39	123	f
265	1	189		40	88	f
269	4	438		41	329	f
270	5	161		41	60	f
271	6	368		41	33	f
272	7	230		41	57	t
273	8	130		41	424	t
274	9	342		41	155	f
275	10	227		41	235	f
276	11	178	5 beats	41	22	f
277	12	382		41	208	f
278	13	185		41	264	t
279	14	322		41	425	t
280	15	125		41	426	f
281	16	245		41	245	f
282	17	355		41	221	f
283	18	1078		41	123	f
284	19	349		41	49	f
285	1	270		42	75	t
286	2	130		42	428	t
287	3	125		42	429	t
288	4	80		42	428	t
289	5	47		42	75	t
290	6	98	1st Verse Only	42	74	t
291	7	82		42	428	t
292	8	115		42	429	t
293	9	110		42	428	t
294	10	46		42	429	t
295	11	161		42	431	t
296	12	277		42	429	t
297	13	185		42	222	t
298	14	363	change to with Keith	42	430	t
299	15	57		42	429	t
300	16	461		42	428	t
301	17	31		42	75	t
302	18	539		42	394	t
303	19	415	7 sec before Sunshine daydream	42	316	f
304	20	532	without bridge / no vamp	42	134	f
305	21	472		42	170	f
306	22	260		42	99	f
307	23	198		42	248	t
308	24	339		42	121	t
309	25	52		42	435	t
310	26	150		42	248	t
311	1	261		43	257	f
312	1	298		44	6	f
313	2	463		44	108	f
314	3	385		44	94	f
315	4	489		44	241	f
316	5	201		44	86	f
317	6	349		44	138	f
318	7	505		44	9	f
319	8	490		44	206	f
320	9	392		44	79	f
321	1	851		45	286	t
322	2	818		45	110	f
323	3	438		45	217	f
324	4	651		45	134	t
325	5	592		45	93	t
326	6	549		45	306	t
81	11	108		24	424	t
83	13	176		24	264	t
84	14	747		24	425	t
88	2	255		25	423	t
94	8	622		25	134	t
95	9	220	Less Bass Intro	25	344	t
96	10	161		25	93	t
98	12	300		25	428	t
99	13	113		25	343	t
100	14	80		25	344	t
101	15	110		25	430	t
102	16	70		25	429	t
105	19	130		25	344	t
104	18	143		25	429	t
97	11	293	Bass Intro	25	344	t
106	20	136		25	432	t
261	14	362		39	343	f
108	22	127	Weir ends it playing the Cryptical riff	25	343	t
103	17	241		25	431	t
107	21	210	Weir's Emaj / Dmaj Jam	25	428	t
133	6	68	Weir started Morning Dew	28	425	t
134	7	66	Cued by Phil	28	394	t
135	8	90	Cued by Keith	28	75	t
137	10	96		28	425	t
138	11	46		28	428	t
139	12	164		28	431	t
140	13	305		28	429	t
141	14	48		28	425	t
142	15	142		28	426	t
143	16	734	The Bach Arrangement after second verse	28	232	f
146	19	330		28	246	t
147	20	433		28	121	t
149	22	280		28	257	f
150	1	440		29	372	f
151	1	323		30	178	f
152	2	612		30	318	f
153	3	314	last performed on 9/3/80	30	97	f
154	4	333		30	381	f
155	5	410		30	9	f
156	6	322		30	185	f
157	7	444		30	329	f
158	8	367		30	50	f
159	9	202		30	88	f
160	1	216		31	57	t
161	2	153		31	424	t
162	3	340		31	155	t
163	4	414		31	284	f
164	5	863		31	330	t
165	6	503		31	428	t
168	9	317		31	306	t
169	10	275		31	159	f
170	11	659		31	394	t
171	12	539		31	357	t
172	13	332		31	248	f
173	1	293	Last performed on 11/8/85	32	272	f
148	21	83		28	435	t
136	9	531		28	434	t
145	18	169	Garcia's Ascending Riff	28	423	t
144	17	298	Get Back Truckin' On 7x	28	367	t
174	1	318	Anymore 5x	33	24	f
175	2	172		33	222	f
176	3	208		33	235	f
177	4	212		33	57	t
178	5	75		33	424	t
179	6	288		33	155	f
180	7	324		33	33	f
181	8	375		33	208	f
182	9	268		33	245	f
183	10	267		33	99	f
184	11	428	Used for Europe '72	33	134	f
185	12	160		33	60	f
186	13	174		33	264	t
187	14	452		33	425	t
188	15	120		33	426	f
189	16	213		33	27	f
190	17	270		33	178	f
191	18	425		33	329	f
192	19	236		33	25	f
193	20	294	1 b7 4 Wah Jam	33	129	f
194	21	333		33	49	f
195	1	302	Get Back Truckin' On 7x	34	367	t
196	2	103		34	423	t
197	3	114	Get Back Truckin' On 6x	34	427	t
198	4	150		34	93	t
199	5	215	Less Bass Intro	34	344	t
200	6	372		34	429	t
201	7	167		34	343	t
202	8	446		34	431	t
203	9	217		34	429	t
204	10	413		34	344	t
205	11	225		34	430	t
206	12	335		34	221	t
207	13	124		34	343	f
208	14	519		34	394	f
209	15	174	36 beats which includes a misstart	34	22	f
210	16	398		34	369	f
211	17	360		34	270	f
212	18	549		34	298	f
213	19	417	13 break before Sunshine Daydream	34	316	f
214	20	264	Initially started playing Good Lovin'	34	248	t
215	21	448		34	121	t
216	22	84		34	435	t
217	23	183		34	248	f
218	1	0		35	289	f
219	2	0		35	178	f
220	3	0		35	393	f
221	4	0		35	376	f
222	5	0		35	42	f
223	6	0		35	267	f
224	7	0		35	29	f
225	1	397		36	57	t
226	2	389		36	155	f
227	3	452		36	284	f
228	4	335		36	43	f
229	5	656		36	367	t
230	6	555		36	93	t
231	7	611		36	306	t
232	8	320		36	119	t
233	9	393		36	121	t
234	10	0		36	357	t
235	11	0		36	248	f
236	1	0		37	40	f
237	1	292		38	6	f
238	2	228		38	129	f
239	3	416		38	355	f
240	4	280		38	50	f
241	5	289		38	177	f
242	6	545		38	203	f
243	7	202		38	86	f
244	8	545		38	206	f
245	9	228		38	27	f
246	10	607		38	198	f
247	11	431		38	79	f
248	1	392		39	241	f
249	2	585		39	145	f
250	3	375		39	209	t
251	4	368		39	280	f
252	5	698	This one's for Bobby Sands	39	134	t
253	6	312		39	428	t
254	7	117		39	429	t
255	8	494		39	428	t
256	9	444		39	93	t
257	10	222		39	428	t
266	1	320	Get Back Truckin' On 7x	41	367	t
267	2	202		41	423	t
268	3	111	Get Back Truckin' On 7x	41	427	f
167	8	263	with Garcia	31	449	t
327	7	575		45	357	t
328	8	555		45	248	f
329	1	439		46	175	f
330	1	384	Anymore 14x	47	24	f
331	2	317		47	178	f
332	3	525		47	329	f
333	4	507		47	206	f
334	5	573		47	262	f
335	6	251		47	99	f
336	7	424		47	341	f
337	1	600		48	286	t
338	2	543		48	110	t
339	3	368		48	123	f
340	4	390		48	48	f
341	5	525		48	101	t
342	6	886		48	134	t
343	7	127		48	93	t
344	8	544		48	284	f
345	9	648		48	330	t
346	10	795		48	232	f
347	11	495		48	13	f
348	1	651		49	372	f
349	1	336		50	370	f
350	1	374		51	341	f
351	2	334	Anymore 10x	51	24	f
352	3	436		51	174	f
353	4	308		51	79	f
354	5	158		51	215	t
355	6	170		51	222	f
356	7	435		51	262	f
357	8	538		51	206	f
358	9	564		51	228	f
359	10	266		51	345	f
360	1	529		52	286	t
361	2	687		52	110	t
362	3	304		52	123	f
363	4	542		52	101	f
364	5	274		52	281	t
365	6	462	Lesh cues band into improv	52	248	t
366	7	437		52	428	t
367	8	491		52	312	t
368	9	103		52	281	f
369	10	286		52	257	f
370	1	580		53	330	f
371	1	181		54	345	f
372	2	463		54	318	f
373	3	204		54	223	f
374	4	445		54	329	f
375	5	432		54	206	f
376	6	232		54	88	f
377	7	290		54	178	f
378	8	308		54	355	f
379	9	268		54	99	f
380	10	544		54	278	f
381	11	187		54	264	t
382	12	755		54	425	t
383	13	142		54	426	f
384	1	206		55	57	t
385	2	229		55	424	t
391	8	290		55	75	t
392	9	273		55	429	t
395	12	193	Lesh Driven Jam	55	429	t
396	13	259		55	437	t
397	14	224		55	431	t
398	15	80		55	429	t
399	16	762		55	232	f
400	17	0	16 sec break before Sunshine Daydream	55	316	f
401	1	450		56	104	t
402	2	420		56	436	t
403	3	460		56	312	f
404	1	229		57	183	f
405	1	374		58	138	f
406	2	587		58	318	f
407	3	421		58	381	f
408	4	369		58	48	f
409	5	448		58	174	f
410	6	470		58	9	f
411	7	336		58	50	f
412	8	306		58	42	f
413	9	280		58	257	f
414	1	301		59	189	f
415	2	446		59	228	f
416	3	385		59	209	t
417	4	446		59	280	t
418	5	716		59	93	t
419	6	369		59	306	t
420	7	395		59	80	t
421	8	219		59	156	t
422	9	438		59	312	t
423	10	540		59	357	t
424	11	397		59	248	f
425	1	322		60	40	f
426	1	450		61	111	f
427	2	415		61	381	f
428	3	400		61	48	f
429	4	190		61	222	f
430	5	351		61	28	f
431	6	338		61	309	f
432	7	374		61	267	f
433	8	803		61	29	f
434	9	266		61	345	f
435	1	250		62	139	t
436	2	294		62	300	t
437	3	485		62	113	f
438	4	491		62	376	f
439	5	548		62	104	t
440	6	644		62	93	t
441	7	525		62	306	t
442	8	302		62	156	t
443	9	254		62	353	t
444	10	271		62	119	t
445	11	708		62	232	f
446	1	0		63	10	f
447	1	375		64	64	f
448	2	353		64	45	f
449	3	212		64	86	f
450	4	178		64	222	t
451	5	334		64	28	f
452	6	302		64	42	f
453	7	420		64	241	f
454	8	460		64	206	f
455	9	418		64	6	t
456	10	243		64	345	f
457	1	596		65	372	t
458	2	760		65	101	t
459	3	452		65	428	t
460	4	603		65	134	t
394	11	255	1st Verse Only	55	74	t
387	4	324		55	155	f
388	5	173		55	222	f
389	6	405		55	228	f
390	7	277		55	28	f
461	5	94		65	344	t
462	6	54		65	343	t
463	7	118		65	344	t
464	8	50		65	343	t
465	9	93		65	428	t
466	10	116		65	429	t
467	11	265		65	93	t
468	12	67	With Weir & Garcia	65	93	t
469	13	290		65	306	t
470	14	712		65	248	t
471	15	288		65	40	f
472	16	237		65	13	t
473	17	252		65	183	f
474	1	832		66	289	t
475	2	143		66	372	f
476	1	396		67	72	f
477	2	536		67	113	f
478	3	507		67	203	f
479	4	357		67	262	f
480	5	186		67	222	t
481	6	307		67	223	f
482	7	280		67	397	f
483	8	346		67	178	t
484	9	379		67	79	f
485	1	445		68	108	f
486	2	285		68	71	f
487	3	285		68	364	f
488	4	376		68	280	t
489	5	385		68	93	t
490	6	341		68	306	t
491	7	714		68	330	f
492	8	382		68	343	t
493	9	563		68	312	t
494	10	458		68	316	f
495	1	393		69	30	f
496	1	228		70	139	t
497	2	330		70	300	t
498	3	642		70	113	f
499	4	340		70	381	f
500	5	342		70	171	f
501	6	200		70	86	f
502	7	383		70	267	f
503	8	470		70	329	f
504	9	486		70	341	f
505	1	505		71	376	t
506	2	579		71	69	t
507	3	165		71	264	t
508	4	396		71	425	t
509	5	727		71	330	t
510	6	298		71	428	t
511	7	78	With Hornsby	71	93	t
512	8	665		71	93	t
513	9	495		71	306	t
514	10	101	The band is undecided on what to play but Hornsby plays Dear Prudence	71	440	t
515	11	131	first time performed	71	331	t
516	12	172		71	425	t
517	13	151		71	426	t
518	14	347		71	59	t
519	15	539		71	357	t
520	16	450		71	248	f
521	1	262		72	340	f
522	1	382		73	64	f
523	2	424		73	241	f
524	3	329		73	97	f
525	4	357		73	145	f
526	5	366		73	267	f
527	6	351		73	207	f
528	7	366		73	50	f
529	8	485		73	79	f
530	1	622		74	111	t
531	2	489		74	206	f
532	3	349		74	71	f
533	4	333		74	352	f
534	5	424		74	143	t
535	6	678		74	93	t
536	7	563		74	306	t
537	8	412		74	343	t
538	9	636		74	394	f
539	10	436		74	123	f
540	1	283		75	272	f
541	1	485		76	228	f
542	2	427		76	241	f
543	3	265		76	106	f
544	4	375		76	267	f
545	5	413		76	207	f
546	6	488		76	376	t
547	7	481		76	311	f
548	8	278		76	345	f
549	1	392		77	143	f
550	2	457		77	69	t
551	3	302		77	71	f
552	4	711		77	101	t
553	5	763		77	134	t
554	6	588		77	93	t
555	7	449		77	306	t
556	8	257		77	156	t
557	9	522		77	394	t
558	10	540		77	357	f
559	11	366		77	368	f
560	1	416		78	191	f
561	1	199		79	125	f
562	2	375		79	138	f
563	3	377		79	48	f
564	4	362		79	381	f
565	5	271		79	397	f
566	6	338		79	267	f
567	7	493		79	329	f
568	8	750		79	198	f
569	1	412		80	111	f
570	2	630		80	206	f
571	3	470		80	286	t
572	4	210		80	159	f
573	5	566		80	93	t
574	6	466		80	306	t
575	7	299		80	353	t
576	8	605		80	312	f
577	9	414		80	368	f
578	1	284		81	340	f
579	1	259		82	345	f
580	2	902		82	318	f
581	3	156		82	215	t
582	4	282		82	99	f
583	5	537		82	329	f
584	6	525		82	206	f
585	7	344		82	79	f
586	8	211		82	196	t
587	9	304		82	321	f
588	10	461		82	262	f
589	11	392		82	341	f
590	1	404		83	24	f
591	2	522		83	101	f
592	3	647		83	286	t
593	4	723		83	110	t
594	5	350		83	123	f
595	6	277		83	281	t
596	7	376		83	428	t
597	8	48		83	281	f
598	9	494		83	316	f
599	1	247		84	183	f
600	1	289		85	6	t
601	2	237		85	345	f
602	3	554		85	114	f
603	4	182		85	222	t
604	5	360		85	28	f
605	6	510		85	9	f
606	7	542		85	203	f
607	8	525		85	329	f
608	9	631		85	198	t
609	10	429		85	79	f
610	1	577		86	108	f
611	2	677		86	113	f
612	3	365		86	209	t
613	4	383		86	280	t
614	5	680		86	134	f
616	7	650		86	93	t
617	8	343		86	306	t
618	9	347		86	353	t
619	10	612		86	394	t
620	11	511		86	316	f
621	1	0		87	370	f
644	1	302		91	367	t
645	2	113		91	423	t
646	3	58		91	427	f
647	4	357		91	208	f
648	5	278		91	71	f
649	6	345		91	170	f
650	7	291		91	24	f
651	8	287		91	264	f
652	9	178		91	73	f
653	10	871		91	303	f
654	11	199		91	57	t
655	12	78		91	424	t
656	13	312		91	155	f
657	1	261		92	129	f
658	2	192		92	183	f
659	3	405		92	29	f
660	4	492		92	98	f
661	5	249		92	79	f
662	6	109		92	70	t
663	7	146		92	93	t
664	8	712		92	343	t
665	9	528		92	394	f
666	10	1120		92	123	f
667	11	286		92	49	f
668	1	331		93	24	f
669	2	174		93	222	f
670	3	208		93	235	f
671	4	444	No Bridge / No Vocal Vamp	93	134	f
672	5	361		93	33	f
673	6	245		93	245	f
674	7	217		93	57	t
675	8	107		93	424	t
676	9	290		93	155	f
677	10	273		93	178	f
678	11	218		93	27	f
679	12	174		93	264	t
680	13	247		93	425	t
681	14	116		93	426	f
682	15	148		93	60	f
683	16	380		93	208	f
684	17	180	8 beats	93	22	f
685	18	192		93	407	f
686	19	720		93	123	f
687	20	330	Chorus Vamp 5x	93	49	f
688	1	300		94	367	t
689	2	303		94	423	t
690	3	96		94	427	t
691	4	80		94	428	t
692	5	54		94	441	t
693	6	208		94	93	t
694	7	250		94	344	t
695	8	254		94	428	t
696	9	240		94	442	t
697	10	161		94	343	t
698	11	152		94	428	t
699	12	66		94	431	t
700	13	181		94	428	t
701	14	356		94	306	t
702	15	55		94	429	t
703	16	290		94	428	t
704	17	194	Cryptical Riff Ending	94	343	t
705	18	394		94	66	f
706	19	420		94	316	f
707	20	262		94	99	f
708	21	439		94	329	f
709	22	310		94	129	f
710	23	400		94	369	f
711	24	1026		94	368	t
712	25	102		94	443	t
713	26	374		94	121	t
714	27	73		94	435	f
715	28	286		94	257	f
716	1	341		95	178	f
717	2	502		95	114	f
718	3	196		95	222	t
719	4	290		95	223	f
720	5	329		95	27	f
721	6	311		95	50	f
722	7	475		95	329	f
723	8	267		95	238	f
724	9	189		95	88	f
725	1	228		96	139	t
726	2	301		96	300	t
727	3	693		96	113	f
728	4	463		96	284	f
729	5	740		96	330	t
615	6	344		86	343	t
730	6	637		96	93	t
731	7	564		96	306	t
732	8	733		96	232	f
733	9	194		96	156	t
734	10	378		96	121	t
735	11	65		96	435	t
736	12	505		96	123	f
737	1	387		97	365	f
738	1	373		98	24	f
739	2	230		98	129	f
740	3	174		98	86	f
741	4	522		98	45	f
742	5	400		98	208	f
743	6	347		98	50	f
744	7	412		98	94	f
745	8	438		98	138	f
746	9	265		98	224	f
747	1	711		99	286	t
748	2	390		99	365	t
749	3	740		99	110	f
750	4	420		99	217	t
751	5	505		99	93	t
752	6	424		99	306	t
753	7	362		99	353	t
754	8	240		99	156	t
755	9	514		99	312	t
756	10	597	44 sec break before Sunshine Daydream	99	316	f
757	1	950		100	74	f
758	1	250		101	345	f
759	2	708		101	228	f
760	3	391		101	174	f
761	4	870		101	318	f
762	5	288		101	241	f
763	6	579		101	262	f
764	7	286		101	50	f
765	8	433		101	286	t
766	9	616	1st Time Played	101	110	f
767	1	401		102	284	f
768	2	310		102	42	f
769	3	242		102	123	f
770	4	463		102	293	f
771	5	452		102	101	f
772	6	675		102	330	t
773	7	116		102	444	t
774	8	103		102	445	t
775	9	176		102	93	t
776	10	683		102	248	t
777	11	234		102	428	t
778	12	293		102	446	t
779	13	268		102	281	t
780	14	477		102	13	f
781	1	511		103	372	f
782	1	688		104	318	f
783	2	272		104	50	f
784	3	450		104	208	f
785	4	276		104	241	f
786	5	578		104	278	f
787	6	173		104	222	f
788	7	420		104	270	f
789	8	386		104	174	f
790	9	429		104	286	t
791	10	647		104	110	f
792	1	462		105	101	f
793	2	441		105	24	f
794	3	361		105	341	f
795	4	309		105	139	t
796	5	505		105	300	t
797	6	633		105	113	t
798	7	456		105	13	t
799	8	463		105	121	t
800	9	66		105	435	t
801	10	680		105	248	t
802	1	280		106	257	f
803	1	287		107	241	f
804	2	450		107	208	f
805	3	262		107	99	f
806	4	419		107	355	f
807	5	360		107	178	f
808	6	343		107	79	f
809	7	209		107	196	t
810	8	261		107	321	f
811	9	312		107	42	f
812	10	157		107	215	f
813	11	652		107	278	f
814	12	943		107	72	f
815	1	554		108	286	t
816	2	921		108	110	f
817	3	512		108	101	f
818	4	283		108	281	t
819	5	716		108	248	t
820	6	107		108	428	t
821	7	73		108	448	t
822	8	82		108	447	t
824	10	809		108	232	f
825	1	0		109	257	f
826	1	342		110	224	f
827	2	158		110	215	f
828	3	391		110	270	f
829	4	245		110	50	f
830	5	284		110	79	f
831	6	256		110	99	f
832	7	417		110	208	f
833	8	233		110	345	f
834	9	477		110	114	f
835	10	593		110	72	t
836	11	284		110	428	t
837	12	488		110	394	t
838	13	232		110	72	f
839	1	402		111	284	f
840	2	288		111	42	f
841	3	168		111	264	t
842	4	486		111	425	t
843	5	135		111	93	t
844	6	293		111	353	t
845	7	123		111	428	t
846	8	30		111	429	t
847	9	88		111	431	t
848	10	27		111	428	t
849	11	74		111	93	t
850	12	552		111	343	t
851	13	735		111	312	t
852	14	160		111	428	t
853	15	189		111	426	f
854	16	527	13 sec break before Sunshine Daydream	111	316	f
855	1	230		112	183	f
856	1	269		113	345	f
857	2	517		113	228	f
858	3	487		113	206	f
859	4	721		113	318	f
860	5	280		113	99	f
861	6	554		113	278	f
862	7	292		113	241	f
863	8	494		113	208	f
864	9	416		113	341	f
865	1	499		114	101	f
866	2	473		114	286	t
867	3	478		114	110	t
868	4	314		114	123	f
869	5	422		114	270	f
870	6	421		114	284	f
871	7	625		114	330	f
872	8	761		114	232	f
873	1	248		115	183	f
874	1	314		116	178	f
875	2	504		116	329	f
876	3	499		116	45	f
877	4	559		116	114	f
878	5	150		116	215	t
879	6	269		116	223	f
880	7	543		116	29	f
881	8	660		116	198	t
882	9	480		116	79	f
883	1	416		117	284	f
884	2	818		117	330	t
885	3	431		117	209	t
886	4	410		117	280	t
887	5	564		117	93	t
888	6	273		117	306	t
889	7	436		117	168	t
890	8	234		117	156	t
891	9	641		117	312	t
892	10	458		117	123	f
893	1	349		118	40	f
386	3	103		55	438	t
823	9	110		108	281	t
80	10	209		24	57	t
87	1	313	Get Back Truckin' On 7 Times	25	367	t
166	7	600		31	93	t
894	1	584		119	228	f
895	2	192		119	222	f
896	3	226		119	86	f
897	4	455		119	206	f
898	5	531		119	278	f
899	6	360		119	28	f
900	7	421		119	262	f
901	8	210		119	261	f
902	9	394		119	270	f
903	10	752		119	198	f
904	1	444		120	284	f
905	2	386		120	293	f
906	3	642		120	101	t
907	4	598		120	104	t
908	5	328		120	428	t
909	6	558		120	281	t
910	7	571		120	316	f
911	1	330		121	370	f
912	2	381		121	123	f
913	1	237		122	345	f
914	2	410		122	355	f
915	3	162		122	222	f
916	4	780		122	228	f
917	5	437		122	206	f
918	6	504		122	262	f
919	7	284		122	241	f
920	8	466		122	114	f
921	9	394		122	341	f
922	1	516		123	24	t
923	2	310		123	123	f
924	3	458		123	208	f
925	4	570		123	101	t
926	5	761		123	104	f
927	6	383		123	284	f
928	7	918		123	134	t
929	8	89		123	428	t
930	9	1178		123	248	f
931	10	510		123	367	f
932	1	640		124	330	f
933	1	378		125	64	f
934	2	413		125	241	f
935	3	338		125	94	f
936	4	276		125	106	f
937	5	179		125	222	t
938	6	305	startedwithBigRiver	125	223	f
939	7	276		125	397	f
940	8	181	nobeats	125	22	f
941	9	595		125	29	f
942	10	392		125	341	f
943	1	460		126	286	t
944	2	600		126	110	f
945	3	477		126	206	f
946	4	416		126	104	t
947	5	617		126	93	t
948	6	371		126	306	t
949	7	276		126	119	t
950	8	242		126	353	t
951	9	571		126	31	t
952	10	218		126	13	f
953	11	488		126	123	f
954	1	382		127	30	f
955	1	410		128	138	f
956	2	394		128	262	f
957	3	369		128	381	f
958	4	468		128	270	f
959	5	346	lotsofchat	128	185	f
960	6	421		128	341	f
961	7	220		128	88	f
962	1	778		129	286	t
963	2	957		129	110	f
964	3	157		129	264	t
965	4	444		129	425	t
966	5	781		129	330	t
967	6	680		129	93	t
968	7	484		129	306	t
969	8	307		129	156	t
970	9	528		129	312	t
971	10	362		129	368	f
972	1	434		130	175	f
973	1	226		131	125	f
974	2	474		131	108	f
975	3	347		131	309	f
976	4	191	7beats	131	22	f
977	5	417		131	270	f
978	6	361		131	50	f
979	7	701		131	35	f
980	1	253		132	139	t
981	2	398		132	300	t
982	3	525		132	113	f
983	4	578		132	206	f
984	5	597		132	134	t
985	6	177		132	428	t
986	7	430		132	93	t
987	8	454		132	306	t
988	9	243		132	159	t
989	10	569		132	343	t
990	11	596		132	394	t
991	12	554		132	357	t
992	13	463		132	248	f
993	1	339		133	370	f
995	2	0		134	318	f
996	3	0		134	255	f
997	4	0		134	29	f
998	5	0		134	45	f
999	6	0		134	329	f
1000	7	0		134	174	f
1001	8	0		134	208	f
1002	9	0		134	217	f
1003	1	780		135	286	t
1004	2	549		135	110	f
1005	3	735	Weir scat singing on outtro jam.	135	101	t
1006	4	555		135	104	t
1007	5	768		135	93	t
1008	6	442		135	306	t
1009	7	352		135	353	t
1010	8	42		135	428	t
1011	9	465		135	248	t
1012	10	54		135	428	t
1013	11	553		135	394	t
1014	12	542		135	316	f
1015	1	389		136	2	f
1016	1	222		137	248	f
1017	2	632		137	318	f
1018	3	420		137	383	f
1019	4	318		137	177	f
1020	5	412		137	267	f
1021	6	300	falsestart	137	42	f
1022	7	391		137	50	f
1023	8	463		137	329	f
1024	1	352		138	138	f
1025	2	604		138	286	t
1026	3	480		138	206	f
1027	4	778		138	330	t
1028	5	168		138	451	f
1029	6	361		138	93	t
1030	7	408		138	306	t
1031	8	294		138	343	t
1032	9	592		138	312	t
1033	10	343		138	368	f
1034	1	417		139	30	f
1035	1	412		140	341	f
1036	2	891		140	318	f
1037	3	153		140	215	f
1038	4	211		140	319	f
1039	5	300		140	79	f
1040	6	187		140	261	f
1041	7	324		140	42	f
1042	8	498		140	206	f
1043	9	317		140	177	f
1045	11	429		140	24	f
1046	1	422		141	284	f
1047	2	452		141	145	f
1048	3	388		141	28	f
1049	4	627		141	330	f
1050	5	514		141	101	t
1051	6	709		141	104	t
1052	7	39		141	93	t
1053	8	614		141	248	t
1054	9	176		141	452	t
1055	10	109		141	428	t
1056	11	108		141	248	t
1057	12	504		141	121	t
1058	13	405		141	13	f
1059	1	460		142	372	f
1060	1	192		143	27	f
1061	2	308		143	99	f
1062	3	194		143	235	f
1063	4	420		143	318	f
1064	5	158		143	215	f
1065	6	355		143	24	f
1066	7	320		143	25	f
1067	8	192		143	345	f
1068	9	483		143	132	f
1069	10	305		143	71	f
1070	11	330		143	49	f
1071	1	339	Get Back Truckin' On 7 x	144	367	t
1072	2	141		144	423	t
1073	3	90	Get Back Truckin' On 8 x	144	427	f
1074	4	208		144	57	t
1075	5	152		144	424	t
1076	6	293		144	155	f
1077	7	243		144	245	f
1078	8	358		144	316	f
1079	9	199		144	222	f
1080	10	340		144	248	t
1081	11	46		144	428	t
1082	12	305		144	121	t
1083	13	63		144	435	t
1084	14	248		144	428	t
1085	15	252		144	183	f
1086	1	402		145	24	f
1087	2	239		145	129	f
1088	3	358		145	143	f
1089	4	420		145	393	f
1090	5	332		145	267	f
1091	6	270		145	27	f
1092	7	412		145	50	f
1093	8	205		145	88	f
1094	1	711		146	289	f
1095	2	542		146	206	f
1096	3	433		146	372	t
1097	4	165		146	264	t
1098	5	181		146	425	t
1099	6	93		146	372	t
1100	7	64		146	428	t
1101	8	343		146	93	t
1102	9	446		146	306	t
1103	10	246		146	353	t
1104	11	287		146	119	t
1105	12	644		146	232	t
1106	13	355		146	368	f
1107	1	386		147	30	f
1044	10	318		140	241	f
994	1	0		134	241	f
1108	1	294		148	241	f
1109	2	453		148	270	f
1110	3	257		148	99	f
1111	4	338		148	79	f
1112	5	273		148	50	f
1113	6	465		148	262	f
1114	7	224	7 beats	148	22	f
1115	8	326		148	42	f
1116	9	488		148	101	f
1117	10	779		148	286	f
1118	1	504		149	284	f
1119	2	614		149	278	f
1120	3	246		149	345	f
1121	4	595		149	281	f
1122	5	501	first verse only	149	343	t
1123	6	122		149	428	t
1124	7	94		149	455	t
1125	8	200		149	430	t
1126	9	534		149	312	f
1127	10	481		149	13	f
1128	1	361		150	370	f
1129	2	653		150	330	f
1130	1	620		151	228	f
1131	2	329		151	178	f
1132	3	419		151	355	f
1133	4	297		151	50	f
1134	5	213		151	319	f
1135	6	314		151	79	f
1136	7	520		151	206	f
1137	8	432		151	208	f
1138	9	444		151	341	f
1139	1	394		152	284	f
1140	2	117		152	116	f
1141	3	309		152	139	t
1142	4	544		152	300	t
1143	5	1038		152	113	f
1144	6	611		152	101	t
1145	7	335		152	281	t
1146	8	393		152	248	t
1147	9	267		152	93	t
1148	10	51		152	281	t
1149	11	678		152	330	t
1150	12	515		152	316	f
1151	1	325		153	370	f
1152	2	301		153	257	f
1153	1	346		154	178	f
1154	2	771		154	318	f
1155	3	176		154	222	f
1156	4	321		154	28	f
1157	5	380		154	48	f
1158	6	387		154	241	f
1159	7	500		154	329	f
1160	8	389		154	209	t
1161	9	370		154	280	f
1162	10	0		154	79	f
1163	1	187		155	57	t
1164	2	251		155	424	t
1165	3	426		155	155	f
1166	4	478		155	206	f
1167	5	690		155	134	t
1168	6	533		155	428	t
1169	7	777		155	93	t
1170	8	459		155	452	t
1171	9	658		155	394	t
1172	10	442		155	13	f
1173	1	672		156	289	f
1174	1	693		157	318	f
1175	2	275		157	241	f
1176	3	636		157	278	f
1177	4	342		157	28	f
1178	5	599		157	208	f
1179	6	459		157	206	f
1180	7	448		157	355	f
1181	8	391		157	341	f
1182	9	893		157	286	f
1183	1	414		158	139	t
1184	2	593		158	300	t
1185	3	727		158	113	t
1186	4	896		158	72	t
1187	5	345		158	353	t
1188	6	422		158	284	f
1189	7	439		158	171	f
1190	8	403	first verse only	158	248	t
1191	9	469		158	93	t
1192	10	353		158	344	t
1193	11	114		158	429	t
1194	12	214		158	456	t
1195	13	67		158	428	t
1196	14	108		158	343	t
1197	15	135		158	429	t
1198	16	483		158	293	f
1199	17	699		158	316	f
1200	1	261		159	183	f
1201	1	333		160	241	f
1202	2	984		160	318	f
1203	3	194		160	223	f
1204	4	583		160	278	f
1205	5	194		160	261	f
1206	6	310		160	42	f
1207	7	499		160	174	f
1208	8	372		160	177	f
1209	9	202		160	196	f
1210	10	324		160	321	f
1211	1	396		161	24	t
1212	2	322		161	123	f
1213	3	441		161	270	f
1214	4	580		161	101	t
1215	5	1161		161	104	t
1216	6	227		161	93	t
1217	7	668	first verse only	161	343	t
1218	8	170		161	456	t
1219	9	675		161	394	t
1220	10	575	Weir plays China Cat riff	161	248	t
1221	11	96		161	428	t
1222	12	431		161	121	t
1223	13	62	Weir plays China Cat riff	161	435	t
1224	14	216		161	183	f
1225	1	451		162	40	f
1226	1	430	anymore 10x	163	24	f
1227	2	245		163	129	f
1228	3	389		163	64	f
1229	4	400		163	381	f
1230	5	616		163	278	f
1231	6	379		163	396	f
1232	7	381		163	309	f
1233	8	428		163	206	f
1234	9	458		163	79	f
1235	1	390		164	365	f
1236	2	517	Brent sings the 2nd verse	164	217	f
1237	3	484		164	293	f
1238	4	210	concluded from 7/2	164	426	t
1239	5	720		164	330	t
1240	6	616		164	93	t
1241	7	390		164	306	t
1242	8	232		164	159	f
1243	9	352		164	7	t
1244	10	668		164	232	t
1245	11	484		164	248	f
1246	1	340		165	370	f
1247	1	488		166	108	f
1248	2	422		166	228	t
1249	3	375		166	352	f
1250	4	343		166	267	f
1251	5	312		166	97	f
1252	6	309		166	42	f
1253	7	726		166	198	f
1254	1	545		167	111	t
1255	2	506		167	206	t
1256	3	539		167	134	t
1257	4	343		167	338	t
1258	5	642		167	93	t
1259	6	545		167	306	t
1260	7	384	no bass intro	167	343	t
1261	8	457		167	81	t
1262	9	221		167	13	f
1263	10	375		167	123	f
1264	1	373		168	30	f
1265	1	0		169	138	f
1266	2	0		169	94	f
1267	3	0		169	184	f
1268	4	0		169	33	f
1269	5	0		169	27	f
1270	6	0		169	263	f
1271	7	0		169	278	f
1272	8	0		169	35	f
1273	1	282		170	43	f
1274	2	592		170	376	t
1275	3	314		170	57	t
1276	4	30		170	424	t
1277	5	320		170	155	f
1278	6	371		170	217	f
1279	7	626		170	93	t
1280	8	509		170	306	t
1281	9	243		170	156	t
1282	10	320		170	80	f
1283	11	309		170	123	f
1284	12	660		170	232	f
1285	1	320		171	40	f
1286	1	257		172	125	f
1287	2	308		172	6	f
1288	3	248		172	129	f
1289	4	317		172	309	f
1290	5	390		172	381	f
1291	6	315		172	171	f
1292	7	368		172	267	f
1293	8	398		172	270	f
1294	9	710		172	198	f
1295	1	288		173	39	f
1296	2	304		173	376	f
1297	3	612		173	111	f
1298	4	609		173	206	f
1299	5	573		173	134	f
1300	6	541		173	93	t
1301	7	438		173	306	t
1302	8	287		173	156	t
1303	9	272		173	119	t
1304	10	654		173	232	f
1305	1	369		174	30	f
1306	1	265		175	125	f
1307	2	510		175	108	f
1308	3	198		175	86	f
1309	4	549		175	203	f
1310	5	417		175	270	f
1311	6	362		175	267	f
1312	7	437		175	184	f
1313	8	701		175	198	f
1314	1	547		176	111	t
1315	2	524		176	206	f
1316	3	678		176	104	t
1317	4	807		176	93	t
1318	5	538		176	306	t
1319	6	0		176	119	f
1320	7	389		176	7	f
1321	8	479		176	312	t
1322	9	343		176	368	f
1323	1	317		177	370	f
1324	1	732		178	289	f
1325	2	505		178	203	f
1326	3	398		178	262	f
1327	4	193		178	222	t
1328	5	281		178	223	f
1329	6	347		178	94	f
1330	7	345		178	50	f
1331	8	454		178	393	f
1332	9	259		178	224	f
1333	1	372		179	138	f
1334	2	449		179	293	f
1335	3	255		179	106	f
1336	4	580		179	134	t
1337	5	269		179	428	t
1338	6	567		179	93	t
1339	7	273		179	436	t
1340	8	299		179	453	t
1341	9	205		179	428	t
1342	10	351		179	343	t
1343	11	485		179	312	t
1344	12	223		179	13	f
1345	13	233		179	183	f
1346	1	254		180	190	f
1347	1	187		181	345	f
1348	2	268		181	42	f
1349	3	342		181	221	f
1350	4	320		181	286	f
1351	5	210		181	223	f
1352	6	304		181	171	f
1353	7	171		181	222	f
1354	8	471		181	329	f
1355	9	309	1 b7 4 jam	181	129	f
1356	10	207		181	57	t
1357	11	179		181	424	t
1358	12	104		181	438	t
1359	13	315		181	155	f
1360	14	297		181	13	f
1361	1	329		182	370	f
1362	2	305		182	28	f
1363	3	348		182	293	f
1364	4	170		182	264	t
1365	5	560		182	425	t
1366	6	196		182	431	t
1367	7	207		182	429	t
1368	8	262	21:31 mark is Phil cue	182	428	t
1369	9	602		182	394	t
1370	10	306		182	426	f
1371	11	687		182	104	t
1373	13	588		182	316	f
1374	1	347		183	49	t
1375	2	286		183	257	f
1372	12	180	was going into China Doll but guitars went out of tune and they stopped.	182	436	f
1405	1	460		187	228	f
1406	2	178		187	222	f
1407	3	405		187	318	f
1408	4	176		187	346	f
1409	5	278		187	42	f
1410	6	388		187	206	f
1411	7	190		187	88	f
1412	8	268		187	28	f
1413	9	192		187	57	t
1414	10	187		187	424	t
1415	11	97		187	438	t
1416	12	300		187	155	f
1417	13	286		187	13	f
1418	1	0		188	264	t
1419	2	0		188	425	t
1420	3	0		188	426	f
1421	4	0		188	278	f
1422	5	0		188	99	f
1423	6	0		188	207	f
1424	7	301	Get Back Truckin' On 7 times	188	367	t
1425	8	196		188	423	t
1426	9	108		188	93	t
1427	10	376		188	344	t
1428	11	182		188	428	t
1429	12	94	First Verse Only	188	343	t
1430	13	98		188	430	t
1431	14	273		188	429	t
1432	15	60		188	431	t
1433	16	151		188	430	t
1434	17	537		188	394	t
1435	18	332		188	221	f
1436	19	381		188	49	f
1437	1	343		189	64	f
1438	2	187	3 beats	189	22	f
1439	3	320	Alternate lyrics during third and fourth verse	189	355	f
1440	4	204		189	223	f
1441	5	461		189	318	f
1442	6	295		189	39	f
1443	7	251		189	99	f
1444	8	697		189	134	f
1445	9	276		189	178	f
1446	1	216		190	57	t
1447	2	247		190	424	t
1448	3	295		190	155	f
1449	4	251		190	28	f
1450	5	476		190	278	f
1451	6	202		190	345	f
1452	7	305	Get Back Truckin' On 7	190	367	t
1453	8	211	Ascending riff	190	423	t
1454	9	200		190	457	t
1455	10	284		190	344	t
1456	11	82	Phil cue	190	428	t
1457	12	164	first verse only	190	343	t
1458	13	203		190	431	t
1459	14	173		190	428	t
1460	15	553		190	104	t
1461	16	469		190	436	t
1462	17	738		190	232	f
1463	18	514		190	316	f
1464	1	169		191	10	f
1465	1	354		192	178	f
1466	2	446		192	208	f
1467	3	194	8 beats.	192	22	f
1468	4	450		192	270	t
1469	5	280		192	99	f
1470	6	247		192	27	f
1471	7	517		192	206	f
1472	8	232		192	106	f
1473	9	617		192	198	t
1474	10	265		192	79	f
1475	1	255		193	129	f
1476	2	494		193	9	f
1477	3	393		193	209	t
1478	4	377		193	280	f
1479	5	778		193	330	t
1480	6	769		193	93	f
1481	7	247		193	306	t
1482	8	401		193	248	t
1483	9	690		193	232	f
1484	10	464		193	123	f
1485	1	310		194	370	f
1486	1	384		195	168	f
1487	2	463		195	203	f
1488	3	343		195	24	f
1489	4	165		195	222	t
1490	5	241		195	223	f
1491	6	271		195	43	f
1492	7	350		195	263	f
1493	8	678		195	29	f
1494	1	555		196	111	f
1495	2	342		196	376	f
1496	3	477		196	69	f
1497	4	418		196	217	f
1498	5	564		196	134	t
1499	6	238		196	459	t
1500	7	467		196	93	t
1501	8	352		196	306	t
1502	9	199	Jerry playing Other One throughout	196	460	t
1503	10	359		196	343	t
1504	11	567		196	31	t
1505	12	403		196	368	f
1506	1	383		197	191	f
1507	1	360		198	138	f
1508	2	402		198	355	f
1509	3	451		198	241	f
1510	4	202		198	86	f
1511	5	340		198	267	f
1512	6	465		198	9	f
1513	7	738		198	198	f
1514	1	503		199	286	t
1515	2	624		199	110	f
1516	3	520		199	206	f
1517	4	665		199	330	t
1518	5	480		199	93	t
1519	6	546		199	306	t
1520	7	250		199	353	t
1521	8	315		199	7	t
1522	9	503		199	312	f
1523	10	507		199	316	f
1524	1	394		200	30	f
1525	1	544		201	228	f
1526	2	330		201	124	f
1527	3	412		201	208	f
1528	4	386		201	33	f
1529	5	327		201	185	f
1530	6	247		201	27	f
1531	7	493		201	341	f
1532	1	241		202	57	t
1533	2	238		202	424	t
1534	3	304		202	155	f
1535	4	380		202	388	f
1536	5	815		202	101	t
1537	6	605		202	372	t
1538	7	125		202	428	t
1539	8	785		202	93	t
1540	9	949		202	306	t
1541	10	434		202	96	t
1542	11	264		202	14	f
1543	12	399		202	123	f
1544	1	235		203	213	f
1545	1	361		204	341	f
1546	2	771		204	318	f
1547	3	141		204	215	f
1548	4	284		204	42	f
1549	5	255		204	50	f
1550	6	621		204	278	f
1551	7	452		204	206	f
1552	8	604		204	286	f
1553	9	146		204	196	t
1554	10	274		204	321	f
1555	11	415		204	48	f
1556	12	235		204	345	f
1557	1	275		205	353	f
1558	2	372		205	284	f
1559	3	292		205	139	t
1560	4	508		205	300	t
1561	5	669		205	113	f
1562	6	442		205	171	f
1563	7	740		205	72	f
1564	8	737		205	394	t
1565	9	393		205	13	f
1566	1	246		206	183	f
1567	1	551		207	108	f
1568	2	510		207	9	f
1569	3	546		207	203	f
1570	4	632		207	29	f
1571	5	177		207	222	t
1572	6	336		207	223	f
1573	7	458		207	262	f
1574	8	295		207	261	f
1575	9	506		207	329	f
1576	10	481		207	341	f
1577	1	200		208	57	t
1578	2	163		208	424	t
1579	3	413		208	155	f
1580	4	434		208	284	f
1581	5	663		208	134	t
1582	6	718		208	428	t
1583	7	761		208	93	t
1584	8	97		208	460	t
1585	9	313	Get Back Truckin' On 7	208	367	t
1586	10	60		208	423	t
1587	11	101		208	428	t
1588	12	567		208	31	t
1589	13	385		208	121	t
1590	14	74		208	435	t
1591	15	251		208	183	f
1592	1	316		209	370	f
1593	1	407		210	168	f
1594	2	449		210	108	f
1595	3	503		210	113	t
1596	4	529		210	203	f
1597	5	381		210	262	f
1598	6	528		210	315	f
1599	7	459		210	329	f
1600	8	274		210	345	f
1601	1	539		211	111	f
1602	2	326		211	376	f
1603	3	435		211	286	t
1604	4	635		211	110	t
1605	5	533		211	93	t
1606	6	178		211	306	t
1607	7	283		211	353	t
1608	8	502		211	312	t
1609	9	530		211	357	t
1610	10	494		211	248	f
1611	1	411		212	175	f
1612	1	311		213	178	f
1613	2	464		213	355	f
1614	3	399		213	45	f
1615	4	387		213	208	f
1616	5	396		213	217	f
1617	6	402		213	79	f
1618	1	236		214	340	t
1619	2	456		214	284	f
1620	3	582		214	134	t
1621	4	254		214	303	t
1622	5	352		214	66	t
1623	6	167		214	428	t
1624	7	529		214	93	t
1625	8	260		214	306	t
1626	9	389	No Bass intro. Bob sings first verse without drums.	214	343	t
1627	10	231		214	13	t
1628	11	519		214	123	f
1629	1	395		215	175	f
1630	1	768		216	289	f
1631	2	348		216	381	f
1632	3	333		216	106	f
1633	4	396		216	48	f
1634	5	525		216	315	f
1635	6	450		216	270	f
1636	7	293		216	257	f
1637	1	845		217	104	t
1638	2	729		217	101	t
1639	3	474		217	69	t
1640	4	558		217	372	t
1641	5	597		217	93	t
1642	6	580		217	306	t
1643	7	269		217	159	f
1644	8	292		217	156	t
1645	9	355		217	121	t
1646	10	63		217	435	f
1647	11	583		217	357	t
1648	12	351		217	368	f
1649	1	386		218	338	f
1650	2	153		218	10	f
1651	1	343		219	178	f
1652	2	412		219	355	f
1653	3	285		219	50	f
1654	4	416		219	270	f
1655	5	175		219	222	t
1656	6	373		219	28	f
1657	7	438		219	262	f
1658	8	577		219	198	t
1659	9	397		219	79	f
1660	1	467		220	24	f
1661	2	365		220	123	f
1662	3	374		220	171	f
1663	4	724		220	101	t
1664	5	738		220	104	t
1665	6	1071		220	93	t
1666	7	44		220	449	t
1667	8	496		220	460	t
1668	9	451		220	343	t
1669	10	614		220	394	t
1670	11	558		220	316	f
1671	1	321		221	370	f
1672	1	635	1st time played	222	330	f
1673	2	276		222	241	f
1674	3	410		222	355	f
1675	4	425	1st time played	222	101	f
1676	5	652		222	318	f
1677	6	154		222	215	f
1678	7	328		222	79	f
1679	8	146		222	264	t
1680	9	716		222	425	t
1681	10	268		222	353	t
1683	12	259		222	426	f
1684	1	358		223	284	f
1685	2	514		223	329	f
1686	3	367		223	341	f
1687	4	295		223	139	t
1688	5	485		223	300	t
1689	6	783		223	113	f
1690	7	245		223	345	f
1691	8	543		223	104	t
1692	9	170		223	463	t
1693	10	589		223	72	t
1694	11	406		223	13	f
1695	1	353		224	370	f
1682	11	44		222	460	t
1696	1	380		225	178	f
1697	2	482		225	355	f
1698	3	199		225	22	f
1699	4	441		225	393	f
1700	5	166		225	215	t
1701	6	384		225	71	f
1702	7	427		225	270	f
1703	8	245		225	106	f
1704	9	395		225	238	t
1705	10	265		225	224	f
1706	1	867		226	286	t
1707	2	686		226	110	f
1708	3	695		226	101	t
1709	4	586		226	104	t
1710	5	224	Only Brent & Drums	226	220	t
1711	6	429		226	93	t
1712	7	133		226	449	t
1714	9	257		226	306	t
1715	10	67		226	461	t
1716	11	673		226	232	f
1717	12	523		226	357	t
1718	13	520		226	123	f
1719	1	365		227	365	f
1713	8	211		226	465	t
1720	1	372		228	365	f
1721	2	453		228	108	t
1722	3	482		228	113	f
1723	4	519		228	203	f
1724	5	444		228	9	f
1725	6	295		228	389	f
1726	7	662		228	84	f
1727	8	199		228	88	f
1728	1	334		229	64	f
1729	2	478		229	217	f
1730	3	371	Debut Performace	229	311	f
1731	4	163		229	264	t
1732	5	623		229	425	t
1733	6	489		229	93	t
1734	7	491		229	306	t
1735	8	225		229	159	f
1736	9	619		229	134	t
1737	10	326		229	156	t
1738	11	702		229	232	f
1739	1	228		230	183	f
1740	1	338		231	139	t
1741	2	424		231	300	t
1742	3	802		231	113	f
1743	4	270		231	50	f
1744	5	315		231	42	f
1745	6	208		231	223	f
1746	7	490		231	329	f
1747	8	413		231	28	f
1748	9	443		231	262	f
1749	10	223		231	319	f
1750	11	475		231	341	f
1751	1	439	Anymore sang 10 times	232	24	t
1752	2	342		232	123	f
1753	3	453		232	293	f
1754	4	592		232	101	t
1755	5	377	1st verse only	232	343	t
1756	6	210		232	93	t
1757	7	601		232	248	t
1758	8	718		232	66	t
1759	9	575		232	316	f
1760	1	545		233	372	f
1761	1	349		234	143	f
1762	2	345		234	178	f
1763	3	434		234	208	f
1764	4	414		234	381	f
1765	5	305	1st Time Played	234	184	f
1766	6	358		234	311	f
1767	7	517		234	315	f
1768	8	634		234	29	f
1769	1	699		235	168	f
1770	2	390		235	376	f
1771	3	291		235	389	f
1772	4	668		235	372	t
1773	5	560		235	93	t
1774	6	461		235	306	t
1775	7	313		235	353	t
1776	8	574		235	357	t
1777	9	444		235	111	t
1778	10	439		235	123	f
1779	1	489		236	191	f
1780	1	300		237	241	f
1781	2	697		237	228	f
1782	3	432		237	206	f
1783	4	208		237	86	f
1784	5	144		237	215	t
1785	6	386		237	28	f
1786	7	422		237	48	f
1787	8	334		237	178	f
1788	9	387		237	79	f
1789	1	882		238	104	t
1790	2	465		238	284	f
1791	3	420		238	171	f
1792	4	658		238	101	t
1793	5	720		238	134	f
1794	6	135		238	93	f
1795	7	710		238	343	t
1796	8	32		238	460	t
1797	9	662		238	31	t
1798	10	595		238	316	f
1799	1	284		239	257	f
1800	1	377		240	138	f
1801	2	628		240	318	f
1802	3	456		240	241	f
1803	4	465		240	114	f
1804	5	157		240	215	t
1805	6	335		240	28	f
1806	7	405		240	208	f
1807	1	361		241	168	f
1808	2	503		241	206	f
1809	3	301		241	119	t
1810	4	277		241	466	t
1811	5	536		241	93	t
1812	6	477		241	306	t
1813	7	320		241	343	t
1814	8	561	Bob starts playing One More Saturday Night but Jerry plays Good Lovin'	241	394	t
1815	9	202		241	123	t
1816	10	293		241	257	f
1817	1	430		242	6	t
1818	2	249		242	129	f
1819	3	233		242	86	f
1820	4	186		242	222	t
1821	5	184		242	28	f
1822	6	404		242	64	f
1823	7	191		242	97	f
1824	8	666		242	9	f
1825	9	393		242	209	t
1826	10	360		242	280	f
1827	1	929		243	289	f
1828	2	628		243	284	f
1829	3	0		243	293	f
1830	4	780	Weir “We’re gonna beg your indulgence and do another semi-slow song but it won’t stay slow forever.”	243	134	t
1831	5	212		243	428	t
1832	6	402		243	343	t
1833	7	94		243	428	t
1834	8	48		243	453	t
1835	9	452		243	429	t
1836	10	147		243	93	f
1837	11	260		243	306	t
1838	12	731		243	31	t
1839	13	194		243	156	t
1840	14	392		243	24	f
1841	15	440		243	123	f
1842	1	248		244	183	f
1843	2	213		244	88	f
1844	1	480		245	108	f
1845	2	298		245	42	f
1846	3	470		245	348	f
1847	4	412		245	207	f
1848	5	511		245	315	f
1849	6	578		245	278	f
1850	7	768		245	198	f
1851	1	755		246	289	f
1852	2	432		246	284	f
1853	3	459		246	293	f
1854	4	174		246	264	t
1855	5	579		246	425	t
1856	6	881		246	93	t
1857	7	710		246	306	t
1858	8	60		246	460	t
1859	9	422	Second Verse only	246	74	t
1860	10	398	Jerry goes into Watchtower	246	7	t
1861	11	501		246	312	t
1862	12	463		246	123	f
1863	1	320		247	49	f
1864	1	322		248	178	f
1865	2	415		248	355	f
1866	3	177		248	215	f
1867	4	457		248	208	f
1868	5	465		248	206	f
1869	6	500		248	329	f
1870	7	312		248	241	f
1871	8	784		248	318	f
1872	9	260		248	345	f
1873	1	406	Anymore 12x	249	24	t
1874	2	353		249	123	f
1875	3	168		249	264	t
1876	4	439		249	425	t
1877	5	161		249	428	t
1878	6	180		249	429	t
1879	7	207		249	57	t
1880	8	134	They did not incorporate the ending part of the segue	249	424	t
1881	9	302	The first time Weir sings The Sun's Gonna Shine	249	155	t
1882	10	35		249	460	t
1883	11	411		249	59	t
1884	12	100	DP10 denoted this as "Playing Jam". That is not a stretch but to call it Playing would set an odd precedent throughout. Deadlists oddly denoted it as "space"	249	428	t
1885	13	159		249	93	t
1886	14	605		249	248	t
1887	15	265		249	426	f
1888	1	594		250	330	f
1889	2	253		250	183	f
1890	1	504		251	228	f
1891	2	417		251	381	f
1892	3	253		251	43	f
1893	4	277		251	389	f
1894	5	393		251	267	f
1895	6	392		251	48	f
1896	7	424		251	50	f
1897	8	372		251	365	f
1898	1	534	Weir plays the theme to James Bond warming up	252	286	t
1899	2	672		252	110	f
1900	3	665		252	101	t
1901	4	459		252	104	t
1902	5	78		252	428	t
1904	7	475		252	306	t
1905	8	298		252	353	t
1906	9	262		252	156	t
1907	10	393		252	311	t
1908	11	489		252	368	f
1909	1	331		253	370	f
1903	6	632		252	93	f
1910	1	413		254	228	f
1911	2	171		254	346	f
1912	3	458		254	318	f
1913	4	190		254	223	f
1914	5	296		254	39	f
1915	6	449		254	329	f
1916	7	274		254	178	f
1917	8	190		254	27	f
1918	9	242		254	99	f
1919	10	468		254	278	f
1920	11	428		254	206	f
1921	12	325		254	355	f
1922	13	169		254	264	t
1923	14	686		254	425	t
1924	15	132		254	426	f
1925	1	167		255	345	t
1926	2	330		255	24	t
1927	3	291		255	129	f
1928	4	728		255	134	t
1929	5	314	Get Back Truckin' On 7 times	255	367	t
1930	6	83		255	423	t
1931	7	58		255	428	t
1932	8	124		255	459	t
1933	9	93		255	93	t
1934	10	44		255	344	t
1935	11	387	arguably one of the greatest stretches 	255	428	t
1936	12	37		255	429	t
1938	14	73	First Verse Only	255	343	t
1939	15	359		255	430	t
1940	16	74		255	428	t
1941	17	96		255	438	t
1942	18	280		255	155	f
1943	19	521		255	316	f
1944	1	378		256	49	f
1937	13	116		255	467	t
1945	1	286	Funiculi Funicula played as warm up. Weir was playing Looks Like Rain	257	178	f
1946	2	468		257	9	f
1947	3	453		257	45	f
1948	4	656		257	29	f
1949	5	178	2 beats	257	22	f
1950	6	406		257	270	f
1951	7	540		257	108	f
1952	1	210		258	57	t
1953	2	135		258	424	t
1954	3	332		258	155	f
1955	4	380		258	217	f
1956	5	478		258	293	f
1957	6	652		258	101	t
1958	7	617		258	104	t
1959	8	607		258	93	t
1960	9	122		258	452	t
1961	10	215		258	428	t
1962	11	78		258	460	t
1963	12	295	Get Back Truckin' On 7	258	367	t
1964	13	98	Ascending Riff	258	423	t
1965	14	586		258	232	f
1966	1	241		259	183	f
1967	1	317	Weir sings 'We can share the women, we can share the wine, one more time.'	260	178	f
1968	2	399		260	94	f
1969	3	487		260	241	f
1970	4	294		260	42	f
1971	5	284		260	238	f
1972	6	614		260	29	f
1973	7	353		260	138	f
1974	8	269		260	224	f
1975	1	288	Get Back Truckin' On 7 - "Busted!" Crowd reaction due to Garcia's drug bust earlier in the year. 	261	367	t
1976	2	130		261	423	t
1977	3	672		261	330	f
1978	4	611	Weir sings Iko lyrics	261	217	t
1979	5	622		261	93	t
1980	6	220		261	306	t
1981	7	468		261	357	t
1982	8	386		261	365	f
1983	1	244		262	183	f
1984	1	178		263	345	f
1985	2	258		263	79	f
1986	3	197		263	223	f
1987	4	289		263	42	f
1988	5	189	10 beats	263	22	f
1989	6	464		263	278	f
1990	7	444		263	206	f
1991	8	331		263	386	f
1992	9	294		263	39	f
1993	10	240		263	28	f
1994	11	188		263	57	t
1995	12	144		263	424	t
1996	13	90		263	438	t
1997	14	303		263	155	f
1998	15	180		263	405	f
1999	16	278		263	178	f
2000	17	205		263	88	f
2001	18	166		263	264	t
2002	19	693		263	425	t
2003	20	161		263	426	f
2004	1	367		264	270	f
2005	2	175		264	222	f
2006	3	410		264	228	f
2007	4	301		264	129	f
2008	5	405		264	207	f
2009	6	248		264	99	f
2010	7	450		264	312	f
2011	8	271		264	13	f
2012	9	551		264	140	t
2013	10	149		264	428	t
2014	11	276		264	429	t
2015	12	163		264	431	t
2016	13	89		264	429	t
2017	14	356		264	221	f
2018	15	175		264	391	t
2019	16	774		264	104	t
2020	17	312		264	436	t
2021	18	340		264	59	f
2022	19	516		264	316	f
2023	20	400		264	49	f
2024	1	215		265	183	f
2025	2	120		265	10	f
2026	1	372		266	178	f
2027	2	250		266	86	f
2028	3	287		266	50	f
2029	4	435		266	355	f
2030	5	164		266	215	t
2031	6	204		266	222	f
2032	7	434		266	208	f
2033	8	453		266	206	f
2034	9	361		266	79	f
2035	10	744		266	198	f
2036	1	520		267	284	f
2037	2	486		267	48	f
2038	3	756		267	101	t
2039	4	870		267	104	t
2040	5	71		267	428	t
2042	7	155	Garcia doing same style of playing as he did on 4/30/77 Improv	267	452	t
2043	8	134		267	429	t
2044	9	893		267	248	t
2045	10	302		267	257	f
2046	1	381		268	365	f
2047	2	245		268	129	f
2048	3	284		268	177	f
2049	4	533		268	203	f
2050	5	334		268	309	f
2051	6	388		268	267	f
2052	7	323		268	338	f
2053	8	385		268	50	f
2054	9	503		268	79	f
2055	1	214		269	57	t
2056	2	136		269	424	t
2057	3	327		269	155	f
2058	4	331		269	184	f
2059	5	760		269	101	f
2041	6	102		267	468	t
2060	6	556		269	104	t
2061	7	510		269	93	t
2062	8	572		269	306	t
2063	9	381		269	353	t
2064	10	358		269	119	t
2065	11	728		269	394	t
2066	12	521		269	316	f
2067	1	532		270	191	f
2068	1	0		271	241	f
2069	2	0		271	50	f
2070	3	0		271	319	f
2071	4	0		271	261	f
2072	5	0		271	223	t
2073	6	0		271	222	f
2074	7	0		271	206	f
2075	8	0		271	99	t
2076	9	0		271	198	t
2077	10	0		271	345	f
2078	1	429		272	178	f
2079	2	556		272	72	t
2080	3	288		272	428	t
2081	4	134		272	72	t
2082	5	142		272	469	t
2083	6	303		272	72	t
2084	7	477		272	284	f
2085	8	172		272	264	t
2086	9	459		272	425	t
2087	10	377		272	93	t
2088	11	623		272	248	t
2089	12	161		272	428	t
2090	13	176		272	248	f
2091	14	539		272	13	f
2092	1	292		273	257	t
2093	1	288		274	168	f
2094	2	492		274	203	f
2095	3	316		274	309	f
2096	4	423	first performance	274	18	f
2097	5	302		274	71	f
2098	6	189		274	222	f
2099	7	482		274	359	f
2100	8	669		274	198	f
2101	1	313	Garcia plays the head of So What warming up	275	316	f
2102	2	655		275	286	t
2103	3	637		275	110	f
2104	4	630		275	101	t
2105	5	511		275	104	t
2106	6	461		275	93	t
2107	7	259		275	306	t
2108	8	93	Weir playing a distinct theme	275	455	t
2109	9	91	Same theme with Phil	275	430	t
2110	10	309		275	121	t
2111	11	44		275	435	t
2112	12	200		275	156	t
2113	13	292		275	80	f
2114	14	231		275	320	f
2115	1	325		276	370	f
2116	1	361		277	6	t
2117	2	253		277	129	f
2118	3	508		277	355	f
2119	4	169		277	215	t
2120	5	365		277	28	f
2121	6	524		277	9	f
2122	7	459		277	45	f
2123	8	485		277	329	f
2124	9	347		277	190	f
2125	1	857		278	286	t
2126	2	924		278	110	f
2127	3	791		278	101	t
2128	4	761		278	104	t
2129	5	298		278	428	t
2130	6	325		278	93	t
2131	7	269		278	455	t
2136	1	321		279	370	f
2137	1	0		280	263	f
2138	2	0		280	114	f
2139	3	0		280	222	f
2140	4	0		280	214	f
2141	5	0		280	42	f
2142	6	0		280	174	f
2143	7	0		280	329	f
2144	8	0		280	341	f
2145	1	849		281	104	t
2146	2	594		281	101	t
2147	3	748	opens with Inspiration arrangment	281	330	t
2148	4	265		281	428	t
2149	5	803		281	93	t
2150	6	458		281	306	t
2151	7	145		281	460	t
2152	8	388		281	343	t
2153	9	580		281	31	t
2154	10	465		281	13	f
2155	1	0		282	340	f
2156	1	255		283	345	f
2157	2	421		283	355	f
2158	3	181		283	222	t
2159	4	358		283	28	f
2160	5	402		283	48	f
2161	6	492		283	206	f
2162	7	469		283	270	f
2163	8	199		283	196	t
2164	9	308		283	321	f
2165	10	305		283	224	f
2166	1	405		284	284	f
2167	2	383		284	293	f
2168	3	369		284	123	f
2169	4	225		284	319	f
2170	5	626		284	286	t
2171	6	441		284	110	f
2172	7	650		284	101	t
2173	8	443		284	281	f
2174	9	330	7 times 'Get back Truckin' on!'	284	367	t
2175	10	170		284	423	t
2176	11	509		284	13	f
2177	1	605		285	330	f
2135	12	555		278	316	f
2134	11	550		278	312	t
2133	10	490		278	343	t
2132	9	155		278	460	t
2178	8	245		278	470	t
2179	1	521		286	108	f
2180	2	410		286	64	f
2181	3	217		286	22	f
2182	4	347		286	71	f
2183	5	561		286	203	f
2184	6	296		286	42	f
2185	7	343		286	238	f
2186	8	345		286	171	f
2187	9	890		286	198	f
2188	1	732		287	286	t
2189	2	925		287	110	f
2190	3	475		287	284	t
2191	4	704		287	93	t
2192	5	637		287	306	t
2193	6	48		287	460	t
2194	7	326		287	156	t
2195	8	618		287	232	t
2196	9	218		287	13	f
2197	10	245		287	183	f
2199	1	309		289	6	t
2200	2	258		289	345	f
2201	3	423		289	262	f
2202	4	291		289	50	f
2203	5	403		289	208	f
2204	6	272		289	99	f
2205	7	248		289	106	f
2206	8	288		289	329	f
2207	9	358		289	241	f
2208	10	473		289	9	f
2209	11	384		289	209	t
2210	12	414		289	280	f
2211	1	541		290	286	t
2212	2	543		290	110	f
2213	3	663		290	101	t
2214	4	590		290	104	t
2215	5	212		290	428	t
2216	6	124		290	429	t
2217	7	367		290	93	f
2218	8	646		290	31	t
2219	9	480		290	316	f
2220	1	342	Featuring John Belushi on vocals during chorus	291	370	f
2221	1	468		292	24	t
2222	2	360		292	123	f
2223	3	330		292	42	f
2224	4	278		292	50	f
2225	5	432		292	171	f
2226	6	234		292	319	f
2227	7	309		292	241	f
2228	8	357		292	94	f
2229	9	832		292	198	f
2230	1	443		293	284	f
2231	2	355	First time since 9/28/76	293	64	f
2232	3	175		293	264	t
2233	4	597		293	425	t
2234	5	771	First time it goes into Estimated	293	104	t
2235	6	700		293	101	t
2236	7	297	First Verse Only	293	343	t
2237	8	198		293	93	t
2238	9	606		293	168	t
2239	10	732		293	312	t
2240	11	126		293	428	t
2241	12	277		293	426	t
2242	1	0		294	183	f
2243	1	373		295	64	t
2244	2	242		295	129	f
2245	3	373		295	262	f
2246	4	155		295	215	t
2247	5	277		295	223	f
2248	6	516		295	329	f
2249	7	598		295	72	t
2250	8	652		295	113	f
2251	9	506		295	206	f
2252	10	265		295	79	f
2253	1	611		296	286	t
2254	2	696		296	110	f
2255	3	211		296	97	f
2256	4	609		296	198	f
2257	5	699		296	134	t
2258	6	306		296	367	t
2259	7	204		296	423	t
2260	8	479		296	93	t
2261	9	132	w/drums	296	306	t
2262	10	583		296	394	t
2263	11	251		296	183	f
2264	1	322		297	370	f
2198	1	260		288	190	f
2265	1	517		298	228	t
2266	2	642		298	113	f
2267	3	405		298	206	f
2268	4	454		298	262	f
2269	5	195		298	222	t
2270	6	329		298	28	f
2271	7	417		298	270	f
2272	8	318		298	241	f
2273	9	382		298	309	f
2274	10	430		298	341	f
2275	1	400	Anymore - 11 times	299	24	t
2276	2	363		299	123	f
2277	3	300		299	42	f
2278	4	610		299	101	t
2279	5	694		299	104	t
2280	6	607		299	93	t
2281	7	150		299	460	t
2282	8	348		299	248	t
2283	9	330		299	121	t
2284	10	53		299	435	t
2285	11	452		299	13	f
2286	1	328		300	370	f
2288	2	281		301	99	f
2289	3	442		301	48	f
2290	4	424		301	174	f
2291	5	396		301	208	f
2292	6	247		301	261	f
2293	7	343		301	309	f
2294	8	350		301	156	f
2295	1	402	anymore 8 times	302	24	t
2296	2	402		302	123	f
2297	3	206		302	115	f
2298	4	458		302	293	f
2299	5	677		302	101	t
2300	6	642		302	104	t
2301	7	492		302	93	t
2302	8	350	with Drums	302	306	t
2303	9	516		302	394	t
2304	10	507		302	248	t
2305	11	412		302	121	t
2306	12	84		302	435	f
2307	1	239		303	183	f
2287	1	601	In reference to Sugaree having the tempo pushed, Weir states, "We’re gonna take a moment to tune up while the rhythm section gets a grip of themselves."	301	318	f
2308	1	337		304	64	f
2309	2	241		304	345	f
2310	3	406		304	270	f
2311	4	414	Arranged similarly to 'Minglewood Blues.'	304	149	f
2312	5	426		304	29	t
2313	6	399		304	66	t
2314	7	374		304	79	f
2315	1	573		305	341	f
2316	2	292		305	185	f
2317	3	703		305	101	t
2318	4	683		305	330	t
2319	5	546		305	93	t
2320	6	236		305	306	t
2321	7	62		305	460	t
2322	8	243	Lesh mistakenly plays the Other One riff at the start of song.	305	156	t
2323	9	652		305	232	t
2324	10	542		305	357	t
2325	11	428		305	248	f
2326	1	246		306	190	f
2327	1	604		307	228	t
2328	2	633		307	113	f
2329	3	192		307	222	t
2330	4	337		307	28	f
2331	5	555		307	114	f
2332	6	452		307	206	f
2333	7	205		307	88	f
2334	8	400		307	209	t
2335	9	396		307	280	f
2336	1	789	Weir states, “This next set is respectfully dedicated to all the little mice and rats who are traps in laboratories all over the world. And also to the keepers of the peace up on that building over there with their cameras and binoculars and all that kinda stuff. Looking out for your best interest.	308	286	t
2337	2	1002		308	110	t
2338	3	571		308	93	t
2339	4	328	with Drums	308	306	t
2340	5	623		308	394	t
2341	6	281		308	156	t
2342	7	435	Anymore 17 times.	308	24	t
2343	8	394		308	123	f
2344	1	282		309	257	f
2345	1	359		310	178	t
2346	2	661		310	318	f
2347	3	478		310	203	f
2348	4	717		310	29	f
2349	5	491		310	174	f
2350	6	309		310	171	f
2351	7	643		310	198	f
2352	1	212		311	139	t
2353	2	397		311	300	t
2354	3	663		311	113	f
2355	4	716		311	101	t
2356	5	666		311	104	t
2357	6	543		311	93	t
2358	7	489		311	306	t
2359	8	246		311	156	t
2360	9	368		311	59	t
2361	10	296		311	121	t
2362	11	42		311	435	t
2363	12	473		311	123	f
2364	1	246		312	190	f
2365	1	328		313	178	f
2366	2	414		313	262	f
2367	3	442		313	45	f
2368	4	338		313	309	f
2369	5	250		313	238	f
2370	6	425		313	145	f
2371	7	186	zero beats	313	22	f
2372	8	267		313	345	f
2373	9	179		313	88	f
2374	1	397		314	168	f
2375	2	423		314	209	t
2376	3	433		314	280	f
2377	4	704		314	330	t
2378	5	344		314	428	t
2379	6	421		314	89	t
2380	7	61		314	429	t
2381	8	299		314	93	t
2382	9	435		314	306	t
2383	10	418		314	312	t
2384	11	494		314	316	f
2385	1	282		315	370	f
2386	1	287		316	119	f
2387	2	474		316	203	f
2388	3	333		316	309	f
2389	4	345		316	50	f
2390	5	483		316	329	f
2391	6	455		316	206	f
2392	7	297		316	27	f
2393	8	415		316	341	f
2394	1	765		317	289	f
2395	2	604		317	101	t
2396	3	756		317	104	f
2397	4	655		317	93	t
2398	5	559		317	306	t
2399	6	248		317	156	t
2400	7	485		317	31	t
2401	8	460		317	316	f
2402	1	288		318	39	f
2403	1	566		319	228	t
2404	2	579		319	113	f
2405	3	298		319	241	f
2406	4	410		319	48	f
2407	5	174		319	222	t
2408	6	315		319	28	f
2409	7	592		319	114	f
2410	8	490		319	174	f
2411	9	300		319	42	f
2412	10	313		319	196	t
2413	11	349		319	321	f
2414	1	668		320	286	t
2415	2	615		320	110	f
2416	3	420		320	284	f
2417	4	720		320	330	t
2418	5	172		320	264	t
2419	6	540		320	425	t
2420	7	86		320	428	t
2421	8	479		320	93	t
2422	9	107		320	460	t
2423	10	372		320	343	t
2424	11	661		320	394	t
2425	12	380		320	123	t
2426	1	321		321	370	f
2427	1	432		322	365	f
2428	2	460		322	203	f
2429	3	414		322	197	f
2430	4	296		322	396	f
2431	5	251		322	54	f
2432	6	279		322	71	f
2433	7	272		322	345	f
2434	1	820		323	289	f
2435	2	454		323	284	f
2436	3	706		323	305	f
2437	4	398		323	283	f
2438	5	839		323	67	t
2439	6	925		323	93	t
2440	7	768		323	306	t
2441	8	421		323	371	t
2442	9	563		323	316	f
2443	1	266		324	30	f
2444	2	288		324	39	f
2445	1	880	Weir says, “For the show we decided to come as a six-pack.”	325	289	f
2446	2	142		325	215	t
2447	3	332		325	28	f
2448	4	394		325	270	f
2449	5	512	w/ Matt Kelly on Harmonica	325	241	f
2450	6	267		325	27	f
2451	7	191		325	196	t
2452	8	527		325	321	f
2453	9	209		325	88	f
2454	1	0		326	365	f
2455	2	0		326	284	f
2456	3	0		326	293	f
2457	4	46		326	460	t
2458	5	322		326	156	t
2459	6	320		326	149	t
2460	7	701		326	134	f
2461	8	1	no timing	326	93	t
2462	9	647		326	306	t
2463	10	611		326	232	f
2464	11	219		326	13	f
2465	1	320		327	2	f
2466	1	409		328	365	f
2467	2	224		328	129	f
2468	3	201		328	86	f
2469	4	292		328	364	f
2470	5	396	Weir sings a verse from "I Ain't Superstitious'	328	91	f
2471	6	351		328	94	f
2472	7	181		328	222	t
2473	8	285		328	223	f
2474	9	453		328	393	f
2475	10	273		328	224	f
2476	1	195		329	57	t
2477	2	246		329	424	t
2478	3	350		329	155	f
2479	4	479		329	206	f
2480	5	767		329	134	t
2481	6	80		329	460	t
2482	7	330		329	308	t
2483	8	493		329	93	t
2484	9	452		329	306	t
2485	10	58		329	460	t
2486	11	318	no bass intro	329	343	t
2487	12	584		329	394	t
2488	13	480		329	316	f
2489	1	200		330	76	f
2490	1	374		331	365	f
2491	2	244		331	129	f
2492	3	423		331	262	f
2493	4	349		331	223	t
2494	5	446		331	214	f
2495	6	845		331	29	f
2496	1	398		332	357	t
2497	2	545		332	168	f
2498	3	460		332	7	t
2499	4	636		332	311	t
2500	5	607		332	134	t
2501	6	1231		332	93	t
2502	7	479		332	306	t
2503	8	86		332	460	t
2504	9	302		332	353	t
2505	10	220	Garcia started in with Other One	332	156	t
2506	11	85		332	428	t
2507	12	640		332	394	t
2508	13	282		332	357	t
2509	14	519		332	248	f
2510	1	288		333	40	f
2511	1	456		334	341	f
2512	2	526		334	329	f
2513	3	104		334	116	f
2514	4	184		334	222	f
2515	5	492		334	208	f
2516	6	332		334	178	f
2517	7	382		334	114	f
2518	8	213		334	196	t
2519	9	311		334	321	f
2520	1	662		335	316	f
2521	2	531		335	286	t
2522	3	420		335	110	f
2523	4	318	Get Back Truckin' On 7 times	335	367	t
2524	5	272	Ascending Riff	335	423	t
2525	6	60		335	459	t
2526	7	44		335	428	t
2527	8	286		335	472	t
2528	9	74		335	428	t
2529	10	37		335	460	t
2530	11	602		335	394	t
2531	12	159		335	441	t
2532	13	209		335	93	t
2533	14	901		335	248	t
2534	15	473		335	13	f
2535	1	302		336	257	f
2536	2	442		336	49	f
2537	1	357		337	64	f
2538	2	268		337	345	f
2539	3	387		337	48	f
2540	4	494		337	45	f
2541	5	303		337	42	f
2542	6	143		337	215	t
2543	7	263		337	223	f
2544	8	225		337	27	f
2545	9	469		337	206	f
2546	10	274		337	177	f
2547	11	390		337	174	f
2548	12	259		337	224	f
2549	1	776		338	289	t
2550	2	384		338	209	t
2551	3	389		338	280	f
2552	4	713		338	330	t
2553	5	698		338	93	t
2554	6	540		338	306	t
2556	8	77		338	423	t
2557	9	159	2nd verse only	338	343	f
2558	10	721		338	232	f
2559	11	516		338	316	f
2560	1	437		339	175	f
2561	1	481		340	108	f
2562	2	494		340	114	f
2563	3	424		340	241	f
2564	4	514		340	329	f
2565	5	381		340	50	f
2566	6	317		340	171	f
2567	7	178		340	255	t
2568	8	214	5 beats. Weir referencing the botched transition says, "Just like a Swiss watch." 	340	22	f
2569	9	360		340	309	f
2570	10	226		340	156	t
2571	11	362	anymore 10 times	340	24	f
2572	1	209		341	57	t
2573	2	238		341	424	t
2574	3	348		341	155	f
2575	4	397		341	209	t
2576	5	416		341	280	t
2577	6	783		341	104	t
2578	7	470		341	93	t
2579	8	531		341	306	t
2580	9	575		341	168	t
2581	10	295	‘Ever since she went an had her sex changed’	341	367	t
2582	11	106		341	423	t
2583	12	512		341	312	t
2584	13	637		341	316	f
2585	1	406		342	175	t
2586	2	242		342	183	f
2587	1	389	anymore 11 times	343	24	t
2588	2	332		343	123	f
2589	3	618		343	278	f
2590	4	295		343	241	f
2591	5	542		343	329	f
2592	6	212		343	196	t
2593	7	261		343	321	f
2594	8	347		343	177	f
2595	9	182		343	261	f
2596	10	299		343	42	f
2597	11	1109		343	72	f
2598	1	674		344	101	t
2599	2	768		344	104	t
2600	3	193		344	93	t
2601	4	378		344	284	f
2602	5	447		344	293	f
2603	6	315	Last verse not sung.	344	281	t
2604	7	686	Lyrics to 'Iko Iko' sung at start.	344	248	t
2605	8	126		344	428	t
2606	9	553		344	316	f
2607	1	521		345	372	f
2608	1	252		346	345	f
2609	2	1035		346	318	f
2610	3	188		346	223	t
2611	4	139		346	215	f
2612	5	342		346	309	f
2613	6	505		346	206	f
2614	7	466		346	79	f
2615	1	518	1st time played	347	156	f
2616	2	299		347	42	f
2617	3	630		347	101	t
2618	4	94		347	460	t
2619	5	554		347	343	t
2620	6	1017		347	104	t
2621	7	624		347	93	t
2622	8	578		347	306	t
2623	9	627	1st time played	347	166	t
2624	10	608		347	168	t
2625	11	527		347	13	f
2626	1	349		348	370	f
2627	1	435		349	108	f
2628	2	526		349	113	f
2629	3	408		349	240	f
2630	4	291		349	27	f
2631	5	556		349	315	f
2632	6	318		349	309	f
2633	7	264		349	345	f
2634	1	200		350	248	t
2635	2	400		350	286	t
2636	3	648		350	110	f
2637	4	450		350	217	t
2638	5	703		350	93	t
2639	6	385		350	306	t
2640	7	69		350	460	t
2641	8	314	No Bass intro; Weir vocals with Sound Effects.	350	343	t
2642	9	572		350	394	t
2643	10	600		350	357	t
2644	11	155		350	248	f
2645	1	361		351	30	f
2555	7	297	‘Ever she went an had her sex changed’; Get Back Truckin' On - 7 times. Whistle blow opening.	338	367	t
2646	1	332		352	178	f
2647	2	404		352	262	f
2648	3	491		352	45	f
2649	4	297		352	6	f
2650	5	235	Jerry plays opening to 'Promised Land'	352	129	f
2651	6	426		352	208	f
2652	7	489		352	206	f
2653	8	209		352	57	t
2654	9	162		352	424	t
2655	10	351		352	155	f
2656	1	732		353	289	f
2657	2	479		353	284	f
2658	3	422		353	171	f
2659	4	697		353	101	t
2660	5	468		353	104	t
2661	6	609		353	93	t
2662	7	208	w/ drums	353	306	t
2663	8	305	'ever since she had a little sex change. All I say it ain't the same.' Jerry laughs. Get back Truckin' on! 7 Times. 	353	367	t
2664	9	177		353	423	t
2665	10	590		353	31	t
2666	11	234		353	13	t
2667	12	233		353	183	f
2668	1	335	Weir states before Casey Jones encore, "On this date eighty one years ago there was a train wreck not too far from here and the engineer of the train died but his memory lives." Casey Jones was killed April 30, 1900.	354	49	f
2669	1	206		355	57	t
2670	2	253		355	424	t
2671	3	417		355	155	f
2672	4	286		355	50	f
2673	5	431		355	208	f
2674	6	185		355	222	t
2675	7	345		355	28	f
2676	8	485		355	9	f
2677	9	384		355	209	t
2678	10	335		355	280	f
2679	1	1032		356	289	f
2680	2	311		356	261	f
2681	3	466		356	270	f
2682	4	963		356	101	t
2683	5	830		356	104	t
2684	6	247		356	429	t
2685	7	490		356	93	t
2687	9	150		356	453	t
2688	10	118		356	460	t
2689	11	594		356	394	t
2690	12	314		356	367	t
2691	13	324	Ascending Riff	356	423	f
2692	1	270		357	183	f
2686	8	111		356	473	t
2693	1	190		358	57	t
2694	2	173		358	424	t
2695	3	408		358	155	f
2696	4	302		358	50	f
2697	5	518		358	114	f
2698	6	264		358	99	f
2699	7	465		358	309	f
2700	8	302	@3:34 mark Garcia plays his horrible signature scale riff.	358	261	f
2701	9	466		358	262	f
2702	10	530		358	341	f
2703	1	733		359	9	f
2704	2	207		359	97	f
2705	3	1350		359	104	t
2706	4	870		359	104	t
2707	5	824		359	113	t
2708	6	104		359	428	t
2709	7	223		359	429	t
2710	8	464		359	93	t
2711	9	128	with drums	359	306	t
2712	10	406		359	209	t
2713	11	311		359	280	t
2714	12	524		359	316	f
2715	1	348		360	49	f
2716	1	271		361	345	f
2717	2	980		361	318	t
2718	3	272	Weir says "I don't know how many of you know that today is Ho Chi Minh's birthday. It's true. I read it in my alamanc."	361	99	f
2719	4	486		361	262	f
2720	5	505		361	206	f
2721	6	648		361	278	f
2722	7	197		361	261	f
2723	8	508		361	208	f
2724	9	801		361	72	f
2725	1	409		362	284	f
2726	2	482		362	270	f
2727	3	612		362	101	f
2728	4	718		362	330	t
2729	5	169		362	264	t
2730	6	333		362	425	t
2731	7	69		362	429	t
2732	8	101		362	428	t
2733	9	674	Opens with Ending	362	372	t
2734	10	33		362	460	t
2735	11	328		362	93	t
2736	12	444		362	353	t
2737	13	465		362	59	t
2738	14	71		362	428	t
2739	15	103		362	455	t
2740	16	43		362	430	t
2741	17	37		362	456	t
2742	18	120		362	429	t
2743	19	242		362	426	f
2744	1	403		363	24	t
2745	2	335		363	123	t
2746	3	1111		363	318	f
2747	4	331		363	178	f
2748	5	629		363	278	f
2749	6	346		363	241	f
2750	7	388		363	48	f
2751	8	188		363	261	f
2752	9	332		363	42	f
2753	10	247		363	345	f
2754	1	421		364	284	f
2755	2	530		364	329	f
2756	3	692		364	101	t
2757	4	169		364	264	t
2758	5	286		364	425	t
2759	6	200		364	428	t
2760	7	666		364	330	t
2761	8	90		364	93	t
2762	9	613		364	248	t
2763	10	162		364	474	t
2764	11	136		364	428	t
2765	12	610		364	394	t
2766	13	146		364	428	t
2767	14	264		364	426	f
2768	15	290		364	257	f
2769	1	334		365	370	f
2770	1	260		366	119	f
2771	2	258		366	129	f
2772	3	413		366	393	f
2773	4	282		366	238	f
2774	5	320		366	309	f
2775	6	440		366	203	f
2776	7	453		366	329	f
2777	8	494		366	206	f
2778	9	180		366	88	f
2779	1	245		367	340	f
2780	2	405		367	284	f
2781	3	606		367	134	t
2782	4	249		367	156	t
2783	5	641		367	69	t
2784	6	458		367	93	t
2785	7	340		367	306	t
2786	8	304		367	343	t
2787	9	504		367	394	t
2788	10	400		367	316	f
2789	1	405		368	175	f
2790	1	278		369	345	f
2791	2	436		369	355	f
2792	3	183		369	215	t
2793	4	256		369	223	f
2794	5	333		369	42	f
2795	6	487		369	174	f
2796	7	704		369	278	f
2797	8	264		369	99	f
2798	9	463		369	309	f
2799	10	235		369	196	t
2800	11	447		369	321	f
2801	12	338		369	79	f
2802	1	833		370	286	t
2803	2	713		370	110	f
2804	3	490		370	284	f
2805	4	759		370	330	t
2806	5	164		370	264	t
2807	6	335		370	425	t
2808	7	147		370	428	t
2809	8	85		370	461	t
2810	9	352		370	93	f
2811	10	333		370	93	f
2812	11	492		370	306	t
2813	12	54		370	460	t
2814	13	343		370	343	t
2815	14	267		370	428	t
2816	15	400	first time since 12/29/77	370	59	t
2817	16	295		370	426	t
2818	17	409		370	123	f
2819	1	623		371	289	f
2820	1	349		372	24	f
2821	2	196		372	264	t
2822	3	54		372	425	t
2823	4	171		372	426	t
2824	5	443		372	318	f
2825	6	170		372	222	f
2826	7	382		372	329	f
2827	8	300		372	178	f
2828	9	202		372	27	f
2829	10	341		372	221	f
2830	11	335		372	71	f
2831	12	327		372	64	f
2832	13	194		372	223	f
2833	14	390		372	208	f
2834	15	187	5 beats	372	22	f
2835	16	267		372	99	f
2836	17	434		372	66	f
2837	18	262		372	257	f
2838	1	379		373	270	f
2839	2	356		373	316	f
2840	3	303	Get Back Truckin' On 4 times	373	367	t
2841	4	192		373	423	t
2842	5	138		373	344	t
2843	6	414		373	93	t
2844	7	243		373	343	t
2845	8	42		373	428	t
2846	9	46		373	344	t
2847	10	122		373	428	t
2848	11	221		373	429	t
2849	12	54		373	428	t
2850	13	112		373	442	t
2851	14	127		373	343	t
2852	15	222		373	183	f
2853	1	263		374	268	f
2854	2	760		374	289	f
2855	3	378		374	383	f
2856	4	410		374	64	f
2857	5	363		374	267	f
2858	6	455		374	9	f
2859	7	533		374	102	f
2860	8	190		374	88	f
2861	1	219		375	57	t
2862	2	152		375	424	t
2863	3	322		375	155	f
2864	4	741		375	101	t
2865	5	620		375	104	t
2866	6	779		375	93	t
2867	7	755		375	306	t
2868	8	60		375	460	t
2869	9	388		375	388	t
2870	10	593		375	77	t
2871	11	558		375	357	t
2872	12	360		375	248	f
2873	1	405		376	202	f
2874	1	594		377	228	f
2875	2	344		377	178	f
2876	3	412		377	355	f
2877	4	191		377	223	f
2878	5	436		377	262	f
2879	6	288		377	50	f
2880	7	484		377	208	f
2881	8	191		377	196	t
2882	9	264		377	321	f
2883	10	329		377	42	f
2884	11	257		377	345	f
2885	1	617		378	286	t
2886	2	671		378	110	f
2887	3	532		378	101	t
2888	4	819		378	134	t
2889	5	312		378	93	t
2890	6	656		378	343	t
2891	7	141		378	428	t
2893	9	30		378	460	t
2894	10	588		378	394	t
2895	11	51		378	460	t
2896	12	218		378	343	t
2897	13	324		378	353	t
2898	14	516		378	13	f
2899	1	246		379	183	f
2892	8	104		378	475	t
2900	1	370		380	138	f
2901	2	606		380	318	f
2902	3	401		380	241	f
2903	4	399		380	9	f
2904	5	346		380	50	f
2905	6	381		380	94	f
2906	7	708		380	198	f
2907	1	366		381	365	f
2908	2	620	in segue way Garcia starts with the scale riff.	381	101	t
2909	3	668		381	104	t
2910	4	612		381	93	t
2911	5	371		381	306	t
2912	6	628		381	232	t
2913	7	470		381	357	t
2914	8	279		381	368	f
2915	1	309		382	40	f
2916	1	466		383	108	f
2917	2	731		383	318	f
2918	3	176		383	222	t
2919	4	304		383	28	f
2920	5	441		383	262	f
2921	6	495		383	45	f
2922	7	503		383	9	f
2923	8	301	Garcia does that scale rife @3:58	383	261	f
2924	9	200		383	57	t
2925	10	130		383	424	t
2926	11	379		383	155	f
2927	1	312		384	6	f
2928	2	241		384	129	f
2929	3	505		384	293	f
2930	4	394		384	209	t
2931	5	421		384	280	t
2932	6	753		384	93	t
2933	7	145		384	460	t
2934	8	274		384	343	t
2935	9	44		384	460	t
2936	10	604		384	312	t
2937	11	209		384	156	t
2938	12	358	anymore 11 times	384	24	t
2939	13	437		384	123	f
2940	1	0	Weir says, "Thank you. We are going to do a song of social import."	385	257	f
2941	1	330	Anymore 5x	386	24	f
2942	2	182	8 beats	386	22	f
2943	3	184		386	88	f
2944	4	176		386	346	f
2945	5	354		386	71	f
2946	6	288		386	39	f
2947	7	464		386	278	f
2948	8	282		386	178	f
2949	9	322		386	355	f
2950	10	198		386	223	f
2951	11	460		386	329	f
2952	12	448		386	206	f
2953	13	345		386	386	f
2954	14	246		386	99	f
2955	15	495		386	140	f
2956	16	314		386	221	f
2957	17	392		386	208	f
2958	18	166		386	264	t
2959	19	842		386	425	t
2960	20	131		386	426	f
2961	1	168		387	345	f
2962	2	204		387	57	t
2963	3	150		387	424	t
2964	4	107		387	438	t
2965	5	311		387	155	f
2966	6	244		387	28	f
2967	7	427		387	312	f
2968	8	160		387	222	f
2969	9	818		387	134	t
2970	10	305	Get Back Truckin' On 7	387	367	t
2971	11	209		387	423	t
2972	12	83		387	428	t
2973	13	70		387	430	t
2974	14	32		387	447	t
2975	15	175		387	428	t
2976	16	165		387	457	t
2977	17	232		387	428	t
2978	18	246		387	470	t
2979	19	85		387	428	t
2980	20	285		387	431	t
2981	21	240	First Verse Only	387	74	t
2982	22	604	The band started with Wharf Rat	387	298	f
2983	23	521		387	316	f
2984	1	221		388	183	f
2985	1	282		389	6	f
2986	2	238		389	129	f
2987	3	467		389	29	f
2988	4	467		389	241	f
2989	5	388		389	262	f
2990	6	325		389	50	f
2991	7	423		389	208	f
2992	8	481		389	174	f
2993	9	272		389	94	f
2994	10	711		389	198	f
2995	1	238		390	139	t
2996	2	355		390	300	t
2997	3	659		390	113	f
2998	4	431		390	209	t
2999	5	415		390	280	f
3000	6	662		390	330	t
3001	7	501		390	93	t
3002	8	490		390	306	t
3003	9	187		390	460	t
3004	10	390		390	343	t
3005	11	528		390	394	t
3006	12	422	During ending 'Not Fade Away' vamp Weir implores crowd, "You got to sing now!"	390	248	f
3007	1	229		391	446	t
3008	2	419		391	175	f
3009	1	250		392	190	f
3010	2	468		392	241	f
3011	3	195		392	86	f
3012	4	208	10 Beats	392	22	f
3013	5	465		392	393	f
3014	6	498		392	174	f
3015	7	590		392	29	f
3016	8	370		392	138	f
3017	9	185		392	88	f
3018	1	771		393	286	t
3019	2	656		393	110	f
3020	3	720		393	101	t
3021	4	217		393	428	t
3022	5	412		393	93	t
3023	6	344		393	306	t
3024	7	312		393	353	t
3025	8	32		393	460	t
3026	9	306	whistle blow opening. Get Back truckin on 7 times	393	367	t
3027	10	75		393	423	t
3028	11	248		393	121	t
3029	12	67		393	435	f
3030	13	226		393	13	t
3031	14	462		393	123	f
3032	1	299		394	370	f
3033	1	312	Lesh says, “While we are testing our monitors there might be something that can be said about trying to be nice to this place. In other words, don’t stand on the seats or kick in the walls or rip out the ornaments seeing how this is the only place we’d like to play around here. And if we can’t come here back to this theatre we won’t come to back to this town, which means you’ll have to go to Kiel auditorium and listen to ‘Grand Funk Railroad’. So consider it”  Weir says, "Now ladies and gentlemen, here they are straight from Madison Square Gardens and famous New York - The Grateful Dead"  Get Back Truckin’ On!  7 times.	395	367	t
3034	2	143		395	423	t
3035	3	73	Get Back Truckin’ On!  7 times.	395	427	f
3036	4	264		395	42	f
3037	5	215		395	235	f
3038	6	281		395	178	f
3039	7	426		395	318	f
3040	8	184	5 beats	395	22	f
3041	9	362		395	170	f
3042	10	408		395	329	f
3043	11	262		395	99	f
3044	12	174		395	476	f
3045	13	527		395	31	f
3046	14	381		395	264	f
3047	15	334		395	49	f
3048	16	262		395	257	f
3049	1	354		396	270	f
3050	2	188		396	223	f
3051	3	298		396	25	f
3052	4	418		396	316	f
3053	5	287		396	248	t
3054	6	304		396	121	t
3055	7	89	Weir playing China Cat Sunflower riff.	396	435	t
3056	8	220		396	248	f
3057	1	435		397	241	f
3058	2	549		397	114	f
3059	3	161		397	215	t
3060	4	299		397	223	f
3061	5	430		397	208	f
3062	6	365		397	50	f
3063	7	415		397	270	f
3064	8	434		397	206	t
3065	9	434		397	79	f
3066	1	463		398	284	f
3067	2	548		398	113	f
3068	3	438		398	217	f
3069	4	463		398	293	f
3070	5	547		398	69	t
3071	6	447		398	93	t
3072	7	342		398	306	t
3073	8	489		398	248	t
3074	9	370		398	343	t
3075	10	538		398	394	t
3076	11	510		398	316	f
3077	1	281		399	2	t
3078	2	318		399	40	f
3079	1	257		400	345	f
3080	2	421		400	355	f
3081	3	358		400	28	f
3082	4	425		400	208	f
3083	5	527		400	206	f
3084	6	443		400	270	f
3085	7	320		400	178	f
3086	8	500		400	262	f
3087	9	258		400	99	f
3088	10	338		400	79	f
3089	11	206		400	196	t
3090	12	291		400	321	f
3091	13	807		400	318	f
3092	1	394		401	284	f
3093	2	300		401	42	f
3094	3	506		401	101	f
3095	4	574		401	286	t
3096	5	662		401	110	f
3097	6	352		401	123	f
3098	7	551		401	372	t
3099	8	120		401	428	t
3100	9	227		401	475	t
3101	10	593		401	394	t
3102	11	479		401	13	f
3103	1	321		402	40	f
3104	1	380		403	365	f
3105	2	283		403	345	f
3106	3	613		403	278	f
3107	4	441		403	262	f
3108	5	348		403	240	f
3109	6	382		403	50	f
3110	7	207		403	88	f
3111	1	434		404	168	f
3112	2	468		404	108	f
3113	3	497		404	293	f
3114	4	683		404	101	t
3115	5	716		404	93	t
3116	6	344		404	306	t
3117	7	150		404	460	t
3118	8	350	effects on vocals	404	343	t
3119	9	560		404	31	t
3120	10	515		404	357	t
3121	11	550	From 6:58 to 09:10 Band playing along with the crowd chant	404	248	f
3122	1	44		405	446	f
3123	2	260		405	340	f
3124	1	358		406	24	f
3125	2	207		406	129	f
3126	3	425		406	393	f
3127	4	584		406	84	f
3128	5	463		406	329	f
3129	6	387		406	241	f
3130	7	273		406	27	f
3131	8	762		406	198	f
3132	1	417		407	138	f
3133	2	653		407	318	f
3134	3	725		407	101	t
3135	4	632		407	104	t
3136	5	607		407	93	t
3137	6	143		407	465	t
3138	7	387		407	306	t
3139	8	0		407	353	t
3140	9	292		407	59	t
3141	10	567		407	357	t
3142	11	351		407	368	f
3143	1	275		408	340	f
3144	1	306		409	241	f
3145	2	425		409	208	f
3146	3	461		409	206	f
3147	4	412		409	270	f
3148	5	205		409	223	t
3149	6	145		409	215	f
3150	7	460		409	262	f
3151	8	282		409	50	f
3152	9	371		409	79	t
3153	10	485		409	341	f
3154	1	601		410	286	t
3155	2	543		410	110	f
3156	3	812		410	72	t
3157	4	669		410	93	t
3158	5	392		410	248	t
3159	6	647		410	312	t
3160	7	520		410	316	f
3161	1	0	Lesh says, "whomever is throwing all those firecrackers especially up on stage why don't you go on to a Ted Nugent concert instead of here so why don't y'all gone on home, ok?"	411	392	f
3162	1	367		412	64	f
3163	2	467		412	241	f
3164	3	193		412	86	f
3165	4	270		412	238	f
3166	5	302		412	27	f
3167	6	182		412	222	t
3168	7	361		412	28	f
3169	8	475		412	329	f
3170	9	655		412	198	f
3171	1	196		413	139	t
3172	2	260		413	300	t
3173	3	590		413	113	t
3174	4	154		413	264	t
3175	5	275		413	425	t
3176	6	150		413	429	t
3177	7	339		413	93	t
3178	8	261		413	306	t
3179	9	63		413	460	t
3180	10	368		413	357	t
3181	11	354		413	248	t
3182	12	538		413	31	t
3183	13	551		413	316	f
3184	1	192		414	88	f
3185	1	235		415	129	f
3186	2	378		415	365	f
3187	3	432		415	383	f
3188	4	426		415	240	f
3189	5	254		415	177	f
3190	6	302		415	396	f
3191	7	773		415	29	f
3192	8	681		415	198	f
3193	1	791		416	104	t
3194	2	465		416	284	f
3195	3	441		416	69	t
3196	4	307	Get Back Truckin' On - 8 times.	416	367	t
3197	5	155		416	423	t
3198	6	242		416	308	t
3199	7	95		416	428	t
3200	8	599		416	93	t
3201	9	477		416	306	t
3202	10	61		416	460	t
3203	11	252		416	159	f
3204	12	346		416	121	t
3205	13	72		416	435	t
3206	14	550	Noted Rock critic Robert Christgau described this performance as "creaky and transcendent".	416	31	f
3207	15	357		416	13	f
3208	1	263		417	340	f
3209	1	394		418	64	f
3210	2	442		418	108	f
3211	3	361		418	240	f
3212	4	151		418	215	t
3213	5	305		418	28	f
3214	6	382		418	207	f
3215	7	509		418	315	f
3216	8	591		418	278	f
3217	9	696		418	198	f
3218	1	479		419	69	f
3219	2	161		419	264	t
3220	3	466		419	425	t
3221	4	485		419	372	t
3222	5	268		419	425	t
3223	6	165	without Jerry	419	428	t
3224	7	458		419	93	t
3225	8	395		419	306	t
3226	9	353		419	80	t
3227	10	248		419	156	t
3228	11	473		419	31	f
3229	12	302		419	368	f
3230	1	345		420	30	f
3231	1	233		421	125	f
3232	2	377		421	365	f
3233	3	436		421	241	f
3234	4	382		421	262	f
3235	5	348		421	267	f
3236	6	415		421	208	f
3237	7	329		421	33	f
3238	8	827		421	29	f
3239	9	706		421	35	f
3240	1	668		422	286	t
3241	2	547		422	101	t
3242	3	117		422	428	t
3243	4	457		422	293	f
3244	5	404		422	217	f
3245	6	324		422	428	t
3246	7	578		422	93	t
3247	8	642		422	306	t
3248	9	415	No Bass Intro	422	343	t
3250	11	491		422	316	f
3251	1	304		423	338	f
3249	10	529		422	312	t
3252	1	752		424	289	f
3253	2	548		424	203	f
3254	3	308		424	309	f
3255	4	184		424	222	t
3256	5	308		424	223	f
3257	6	494		424	114	f
3258	7	342		424	184	f
3259	8	310		424	396	f
3260	9	418		424	270	f
3261	10	444		424	341	f
3262	1	478		425	168	f
3263	2	493		425	206	f
3264	3	536		425	134	t
3265	4	325	Get Back Truckin' On 8 times	425	367	t
3266	5	209		425	423	t
3267	6	285	Garcia does that scale riff @ 3:49	425	308	t
3268	7	155		425	306	t
3269	8	413		425	93	t
3270	9	684		425	306	t
3271	10	348		425	353	t
3272	11	368		425	7	t
3273	12	693		425	232	f
3274	1	316		426	370	f
3275	1	351		427	138	f
3276	2	402	Anymore - 9 times	427	24	f
3277	3	392		427	389	f
3278	4	281		427	177	f
3279	5	421		427	263	f
3280	6	328		427	42	f
3281	7	441		427	174	f
3282	8	502		427	79	f
3283	1	305		428	39	f
3284	2	691		428	111	f
3285	3	169		428	264	t
3286	4	343		428	425	t
3287	5	881		428	104	t
3288	6	615		428	93	t
3289	7	629		428	306	t
3290	8	371		428	59	t
3291	9	271		428	119	t
3292	10	350		428	121	t
3293	11	64		428	435	t
3294	12	340		428	13	f
3295	1	274		429	40	f
3296	1	444		430	108	f
3297	2	436		430	393	f
3298	3	344		430	97	f
3299	4	185	12 Beats	430	22	f
3300	5	365		430	171	f
3301	6	308		430	338	f
3302	7	415		430	263	f
3303	8	195		430	88	f
3304	1	487		431	286	t
3305	2	674		431	110	f
3306	3	402		431	284	f
3307	4	385		431	23	f
3308	5	303	Get Back Truckin' On 7 Times	431	367	t
3309	6	210		431	423	t
3310	7	148		431	428	t
3311	8	696		431	93	t
3312	9	492		431	306	t
3313	10	401		431	343	t
3314	11	32		431	460	t
3315	12	261		431	142	t
3316	13	238		431	80	t
3317	14	270	Brent sings a verse of Dear Mr. Fantasy	431	414	f
3318	15	464		431	316	f
3319	1	413		432	175	f
3320	1	361	Weir before Jack Straw, "This place got mice."	433	178	f
3321	2	347		433	64	f
3322	3	442		433	241	f
3323	4	355		433	48	f
3324	5	172		433	222	t
3325	6	316		433	223	f
3326	7	460		433	329	f
3327	8	458		433	206	f
3328	9	240		433	224	f
3329	1	641		434	286	t
3330	2	354		434	365	f
3331	3	466		434	217	f
3332	4	629		434	330	t
3333	5	121		434	469	t
3334	6	406		434	93	t
3335	7	1087	*with Ken Kesey and the Thunder Machine	434	306	t
3336	8	247		434	460	t
3337	9	414		434	343	t
3338	10	555		434	394	t
3339	11	232		434	156	t
3340	12	36		434	460	t
3341	13	690		434	232	f
3342	1	307	Weir prior to Sugar Mag, "Of course, we need a big hand for the Merry Pranksters on the Thunder Machine." No Sunshine Daydream.	435	316	f
3343	2	303		435	40	f
3344	1	385		436	178	f
3345	2	435		436	355	f
3346	3	154		436	215	t
3347	4	264		436	223	f
3348	5	435		436	48	f
3349	6	502		436	203	f
3350	7	282		436	27	f
3351	8	452		436	206	f
3352	9	543		436	9	f
3353	10	713		436	198	f
3354	11	460		436	79	f
3355	1	371		437	64	f
3356	2	252		437	129	f
3357	3	519		437	293	f
3358	4	371		437	209	t
3359	5	389		437	280	f
3360	6	755		437	330	f
3361	7	179		437	473	t
3362	8	779		437	93	t
3363	9	308		437	306	t
3364	10	107		437	453	t
3365	11	221		437	428	t
3366	12	50		437	460	t
3367	13	349		437	343	t
3368	14	480		437	312	t
3369	15	235		437	13	t
3370	16	487		437	123	f
3371	1	283		438	257	f
3372	1	323		439	224	f
3373	2	328		439	178	f
3374	3	552		439	329	f
3375	4	264		439	99	f
3376	5	488		439	114	f
3377	6	506		439	206	f
3378	7	219		439	86	f
3379	8	224		439	261	f
3380	9	459		439	262	f
3381	10	440		439	341	f
3382	1	650		440	330	t
3383	2	589		440	101	t
3384	3	72		440	460	t
3385	4	349	first verse only	440	343	t
3386	5	258		440	93	t
3387	6	755		440	394	t
3388	7	300		440	367	t
3389	8	187		440	423	t
3390	9	59		440	428	t
3391	10	478		440	13	f
3392	1	327		441	370	f
3393	1	391		442	178	f
3394	2	438		442	262	f
3395	3	379		442	99	f
3396	4	432		442	208	f
3397	5	382		442	303	t
3398	6	268		442	308	f
3399	7	503		442	168	f
3400	1	202		443	139	t
3401	2	436		443	300	t
3402	3	712		443	113	t
3403	4	420		443	209	t
3404	5	402		443	280	f
3405	6	637	Flanger effect on vocals during breakdown. After Wharf Rat are 56 seconds of directionless playing concluding on what to play next.	443	394	t
3406	7	318		443	119	t
3407	8	593		443	93	t
3408	9	654		443	306	t
3409	10	335		443	425	t
3410	11	122		443	426	t
3411	12	399	anymore 11 times	443	24	f
3412	13	472		443	123	f
3413	1	321		444	49	f
3414	1	405	anymore 13 times	445	24	t
3415	2	367	Weir says, "Welcome to the Rock n' Roll barbeque."	445	123	f
3416	3	490		445	329	f
3417	4	339		445	178	f
3418	5	499		445	114	f
3419	6	176		445	222	t
3420	7	337		445	28	f
3421	1	654	Technically, this show was played as one set but clearly divided into the 2 set format. Weir says, "Don't nobody catch a cold out there." referencing the 100 degree heat.	446	330	t
3422	2	155		446	264	t
3423	3	376		446	425	t
3424	4	514		446	93	t
3425	5	235	w/ drums	446	306	t
3426	6	657		446	101	t
3427	7	316		446	343	t
3428	8	596		446	394	t
3429	9	467		446	13	f
3430	1	239		447	183	f
3431	1	264		448	6	t
3432	2	240		448	345	f
3433	3	395		448	48	f
3434	4	148		448	222	t
3435	5	338		448	28	f
3436	6	439		448	9	f
3437	7	226		448	97	f
3438	8	375		448	241	f
3439	9	770		448	318	f
3440	10	364		448	209	t
3441	11	330		448	280	t
3442	12	258		448	79	f
3443	1	476		449	108	f
3444	2	188		449	88	f
3445	3	592		449	101	t
3446	4	493		449	372	t
3447	5	153	without Jerry	449	428	t
3448	6	493		449	93	t
3449	7	144		449	306	t
3450	8	591		449	394	t
3451	9	288		449	13	t
3452	10	228		449	183	f
3453	1	305		450	40	f
3454	1	675		451	289	f
3455	2	188		451	222	t
3456	3	342		451	28	f
3457	4	413		451	48	f
3458	5	213		451	99	f
3459	6	552		451	114	f
3460	7	358		451	241	f
3461	8	494		451	9	f
3462	9	434		451	209	t
3463	10	295		451	79	f
3464	1	295		452	156	t
3465	2	380	anymore 10 times	452	24	t
3466	3	386		452	123	f
3467	4	729		452	134	t
3468	5	58		452	428	t
3469	6	162		452	460	t
3471	8	743		452	93	f
3472	9	652		452	394	t
3473	10	303	get back truckin on 7 times	452	367	t
3474	11	78		452	423	t
3475	12	94		452	247	t
3476	13	199		452	423	f
3477	1	509		453	316	f
3478	1	338		454	178	f
3479	2	666		454	318	f
3480	3	379		454	383	f
3481	4	381		454	9	f
3482	5	293		454	267	f
3483	6	446		454	329	f
3484	7	551		454	102	f
3485	8	184		454	88	f
3486	1	211		455	57	t
3487	2	168		455	424	t
3488	3	265		455	155	f
3489	4	376		455	176	f
3490	5	411		455	280	f
3491	6	710		455	330	t
3492	7	316		455	428	t
3493	8	866		455	93	t
3494	9	620		455	306	t
3495	10	151		455	460	t
3496	11	394		455	343	t
3497	12	556		455	378	f
3498	13	296		455	257	f
3499	1	312		456	370	f
3500	1	280	Show billed as, "Mickey Hart & His Heartbeats" and underneath in smaller type "Bobby Ace & His Cards From The Bottom Of The Deck."	457	155	f
3501	2	175		457	88	f
3502	3	258		457	296	f
3503	4	218		457	114	f
3504	5	329		457	83	f
3505	6	171		457	380	f
3506	7	322	Garcia, at end of Candyman. "This is an electric guitar."	457	48	f
3507	8	337	Garcia, before start of Cumberland says, "Something new." At the prompt of hearing feedback Weir says, "That's the Bear solo."	457	71	f
3508	9	465	Garcia says, "Hey Where's Pig? Where gonna have Pig Pen come out and do some tunes. That is if we can find him."	457	244	f
3509	10	225		457	222	f
3510	11	176	Garcia says, "Pig Pen is going do something."	457	215	f
3511	12	89	fades out on SBD	457	188	f
3512	13	111		457	415	f
3513	14	205		457	419	f
3514	15	258		457	416	f
3515	16	245		457	418	t
3516	17	157		457	417	f
3517	1	397		458	64	f
3518	2	347		458	241	f
3519	3	241		458	86	f
3520	4	176		458	222	t
3521	5	386		458	28	f
3522	6	478		458	355	f
3523	7	485		458	206	f
3524	8	337		458	42	f
3525	9	496		458	174	f
3526	10	348		458	177	f
3527	11	212		458	196	t
3528	12	403		458	321	f
3529	1	485		459	156	t
3530	2	414	Anymore - 14 times	459	24	t
3531	3	420		459	123	f
3532	4	431		459	309	f
3533	5	835	Garcia doing that scale riff during end jam	459	101	t
3534	6	666		459	104	t
3535	7	487		459	93	t
3536	8	665		459	168	t
3537	9	123		459	460	t
3538	10	369	first verse only	459	343	t
3539	11	697		459	31	t
3540	12	485		459	13	f
3470	7	566	First verse only	452	343	t
3541	1	241		460	345	f
3542	2	412		460	48	f
3543	3	164		460	215	t
3544	4	255		460	223	f
3545	5	312		460	42	f
3546	6	430		460	206	f
3547	7	375		460	57	t
3548	8	369		460	155	f
3549	9	345		460	241	f
3550	10	357		460	309	f
3551	11	208		460	115	f
3552	12	447		460	341	f
3553	1	694		461	286	t
3554	2	643		461	110	f
3555	3	702		461	101	t
3556	4	645		461	104	t
3557	5	544		461	93	t
3558	6	132		461	306	t
3559	7	62		461	460	t
3560	8	537		461	343	t
3561	9	625		461	394	t
3562	10	387		461	156	t
3563	11	376		461	49	f
3564	1	271		462	257	f
3565	1	510		463	228	f
3566	2	253		463	326	f
3567	3	252		463	25	f
3568	4	164		463	222	t
3569	5	329		463	28	f
3570	6	301		463	42	f
3571	7	367		463	50	f
3572	1	1130		464	104	f
3573	2	435		464	371	f
3574	3	384		464	283	f
3575	4	306		464	367	t
3576	5	161	ascending riff	464	423	t
3577	6	98		464	428	t
3578	7	580		464	134	t
3579	8	960		464	93	t
3580	9	391		464	306	t
3581	10	379		464	338	t
3582	11	466		464	312	t
3583	12	478		464	13	f
3584	1	350		465	202	f
3585	1	244		466	345	f
3586	2	383		466	24	f
3587	3	168		466	215	f
3588	4	405		466	355	f
3589	5	441		466	206	f
3590	6	320		466	79	f
3591	7	168		466	264	t
3592	8	214		466	425	t
3593	9	583		466	428	t
3594	10	265		466	425	t
3595	11	148		466	426	f
3596	1	504		467	316	f
3597	2	746		467	104	t
3598	3	710		467	394	t
3730	5	186		484	222	f
3731	6	474		484	114	f
3599	4	55	At the end of this improv, one of the drummers is continually playing. However, we do not consider this anything other than passing the time. You can hear the band members discussing what to play next.	467	428	f
3600	5	44		467	460	t
3601	6	281	check into arrangement	467	123	t
3602	7	137		467	428	t
3603	8	433		467	284	f
3604	9	693		467	286	f
3605	10	481	we do not count this transition as intentful	467	13	f
3606	11	280		467	139	t
3607	12	300		467	300	t
3609	14	81		467	429	t
3610	15	102		467	457	t
3611	16	663		467	248	t
3612	17	894		467	232	f
3613	1	288		468	257	f
3614	2	498		468	372	t
3615	3	195		468	10	f
3608	13	271		467	477	t
3616	1	342		469	178	f
3617	2	440		469	393	f
3618	3	156		469	215	t
3619	4	257		469	28	f
3620	5	380		469	48	f
3621	6	288		469	238	f
3622	7	618		469	29	f
3623	8	558		469	84	f
3624	9	197		469	88	f
3625	1	196		470	57	t
3626	2	137		470	424	t
3627	3	368	rearranged the order of lyrics	470	155	f
3628	4	269		470	106	f
3629	5	504		470	217	f
3630	6	604		470	134	f
3631	7	422		470	93	t
3632	8	97		470	429	t
3633	9	380		470	306	t
3634	10	82		470	460	t
3635	11	269		470	353	t
3636	12	271		470	156	t
3637	13	541		470	31	t
3638	14	231		470	13	f
3639	15	415		470	123	f
3640	1	354		471	365	f
3641	1	272		472	282	f
3642	2	452		472	114	f
3643	3	374		472	383	f
3644	4	457		472	329	f
3645	5	330		472	41	f
3646	6	343		472	33	f
3647	7	456		472	305	f
3648	8	530		472	341	f
3649	1	623		473	111	f
3650	2	414		473	283	f
3651	3	307		473	367	t
3652	4	92		473	423	t
3653	5	98		473	428	t
3654	6	246		473	154	t
3655	7	218		473	331	t
3656	8	630		473	93	t
3657	9	704		473	306	t
3658	10	614		473	378	t
3659	11	561		473	316	f
3660	1	411		474	202	f
3661	1	248		475	345	f
3662	2	408		475	208	f
3663	3	166		475	215	t
3664	4	271		475	223	f
3665	5	409		475	355	f
3666	6	392		475	241	f
3667	7	230		475	86	f
3668	8	218		475	97	f
3669	9	372		475	209	t
3670	10	340		475	280	f
3671	1	588		476	286	t
3672	2	770		476	110	f
3673	3	415		476	284	f
3674	4	780		476	330	t
3675	5	168		476	264	t
3676	6	0		476	425	t
3677	7	0		476	428	t
3678	8	0		476	93	t
3679	9	0		476	429	t
3680	10	0		476	306	t
3681	11	611		476	394	t
3682	12	72		476	425	t
3683	13	0		476	426	f
3684	1	249		477	183	f
3685	1	335		478	178	f
3686	2	231		478	86	f
3687	3	264		478	50	f
3688	4	458		478	262	f
3689	5	204		478	223	t
3690	6	146		478	215	f
3691	7	411		478	355	f
3692	8	315		478	241	f
3693	9	593		478	286	t
3694	10	540		478	110	f
3695	1	425		479	284	f
3696	2	460		479	293	f
3697	3	725		479	101	t
3698	4	666		479	104	t
3699	5	887		479	93	t
3700	6	270		479	306	t
3701	7	728		479	168	t
3702	8	590		479	316	f
3703	1	307		480	370	f
3704	1	332		481	178	f
3705	2	494		481	29	f
3706	3	536		481	203	f
3707	4	426		481	270	f
3708	5	493		481	174	f
3709	6	394		481	48	f
3710	7	320		481	238	f
3711	8	269		481	27	f
3712	9	240		481	129	f
3713	1	226		482	139	t
3714	2	244		482	300	t
3715	3	720		482	113	t
3716	4	805		482	101	t
3717	5	303		482	93	t
3718	6	663		482	306	t
3719	7	357		482	353	t
3720	8	510		482	357	t
3721	9	278		482	248	t
3722	10	303		482	121	t
3723	11	70		482	435	t
3724	12	231		482	183	f
3725	1	444		483	175	f
3726	1	417	Anymore 8 times	484	24	t
3727	2	352		484	123	f
3728	3	325		484	42	f
3729	4	217		484	223	t
3732	7	297		484	50	f
3733	8	416		484	48	f
3734	9	273		484	261	f
3735	10	227		484	319	f
3736	11	347		484	79	f
3737	12	426		484	341	f
3738	1	346		485	178	f
3739	2	412		485	171	f
3740	3	784		485	101	t
3741	4	612		485	134	t
3742	5	149		485	429	t
3743	6	388		485	93	t
3744	7	484		485	343	t
3745	8	74		485	460	t
3746	9	630		485	394	t
3747	10	610		485	113	f
3748	11	464		485	13	f
3749	1	325		486	370	f
3750	1	495		487	108	f
3751	2	677		487	318	f
3752	3	448		487	241	f
3753	4	475		487	270	f
3754	5	327		487	33	f
3755	6	285		487	177	f
3756	7	379		487	50	t
3757	8	199		487	88	f
3758	1	588		488	286	t
3759	2	849		488	110	t
3760	3	312	Get Back Truckin; On  8 Times	488	367	t
3761	4	233		488	423	t
3762	5	70		488	460	t
3763	6	874		488	330	t
3764	7	341		488	428	t
3765	8	489		488	93	t
3766	9	572		488	306	t
3767	10	82		488	460	t
3768	11	637		488	343	t
3769	12	633		488	394	t
3770	13	552		488	316	f
3771	1	308		489	370	f
3772	1	404		490	168	f
3773	2	244		490	345	f
3774	3	456		490	393	f
3775	4	259		490	238	f
3776	5	330		490	42	f
3777	6	488		490	241	f
3778	7	653		490	278	f
3779	8	513		490	206	f
3780	9	290		490	224	f
3781	1	199		491	139	t
3782	2	494		491	300	t
3783	3	625		491	113	f
3784	4	429		491	217	f
3785	5	700		491	330	t
3786	6	252		491	453	t
3787	7	588		491	93	t
3788	8	396		491	306	t
3789	9	114		491	460	t
3790	10	287		491	343	t
3791	11	304	Whistle Intro, Get Back Truckin' On 8 times	491	367	t
3792	12	56		491	423	t
3793	13	49		491	304	t
3794	14	495		491	312	t
3795	15	387		491	121	t
3796	1	312		492	40	f
3797	1	308		493	178	f
3798	2	424		493	113	f
3799	3	484		493	45	f
3800	4	428		493	270	f
3801	5	304		493	364	f
3802	6	153		493	215	t
3803	7	334		493	28	f
3804	8	410		493	48	f
3805	9	598		493	84	f
3806	10	200		493	88	f
3807	1	367		494	365	f
3808	2	642		494	101	t
3809	3	675		494	330	t
3810	4	663		494	93	t
3811	5	385		494	306	t
3812	6	428		494	372	t
3813	7	218		494	156	t
3814	8	484		494	312	t
3815	9	220		494	13	f
3816	10	298		494	368	f
3817	1	343		495	40	f
3818	1	0		496	88	f
3819	2	0		496	241	f
3820	3	0		496	355	f
3821	4	0		496	215	t
3822	5	0		496	223	f
3823	6	0		496	262	f
3824	7	0		496	174	f
3825	8	0		496	309	f
3826	9	0		496	261	f
3827	10	0		496	208	f
3828	11	0		496	341	f
3829	1	0		497	286	t
3830	2	0		497	110	f
3831	3	0		497	284	f
3832	4	0		497	293	f
3833	5	164		497	264	t
3834	6	248		497	425	t
3835	7	0		497	104	t
3836	8	0		497	428	f
3837	9	0		497	93	t
3838	10	0		497	248	t
3839	11	0		497	31	t
3840	12	0		497	13	f
3841	1	0		498	370	f
3842	1	321		499	178	f
3843	2	387		499	262	f
3844	3	554		499	203	f
3845	4	508		499	329	f
3846	5	293		499	261	f
3847	6	292		499	83	f
3848	7	474		499	206	f
3849	8	391		499	79	f
3850	1	0		500	108	f
3851	2	0		500	359	f
3852	3	0		500	198	f
3853	4	0		500	330	f
3854	5	0		500	93	f
3855	6	0		500	306	f
3856	7	0		500	248	f
3857	8	0		500	31	f
3858	9	0		500	316	f
3859	1	0		501	370	f
3860	1	735		502	289	f
3861	2	506		502	203	f
3862	3	398		502	262	f
3863	4	193		502	222	t
3864	5	274		502	223	f
3865	6	347		502	94	f
3866	7	346		502	50	f
3867	8	452		502	393	f
3868	9	260		502	224	f
3869	1	377		503	138	f
3870	2	451		503	293	f
3871	3	254		503	106	f
3872	4	560		503	134	t
3873	5	302		503	428	t
3874	6	554		503	93	t
3875	7	288		503	452	t
3876	8	495		503	460	t
3877	9	360		503	343	t
3878	10	469		503	312	t
3879	11	214		503	13	f
3880	12	233		503	183	f
3881	1	254		504	190	f
3882	1	195		505	345	f
3883	2	472		505	228	f
3884	3	413		505	33	f
3885	4	241		505	114	f
3886	5	308		505	178	f
3887	6	340		505	208	f
3888	7	248		505	99	f
3889	8	209		505	57	t
3890	9	245		505	424	t
3891	10	99		505	438	t
3892	11	311		505	155	f
3893	12	175		505	222	f
3894	13	349		505	171	f
3895	14	78		505	391	t
3896	15	271		505	390	t
3897	16	653		505	198	f
3898	1	612		506	286	f
3899	2	234		506	28	f
3900	3	302		506	270	f
3901	4	198		506	223	f
3902	5	732		506	134	t
3903	6	505		506	428	t
3904	7	45		506	429	t
3905	8	357		506	431	t
3906	9	65		506	477	t
3907	10	455		506	343	t
3908	11	108		506	470	t
3910	13	149		506	343	t
3911	14	498		506	312	f
3912	15	510		506	316	f
3913	1	323		507	49	f
3914	2	0		507	370	f
3909	12	190		506	437	t
3915	1	343		508	178	f
3916	2	408		508	355	f
3917	3	154		508	215	t
3918	4	262		508	223	f
3919	5	323		508	42	f
3920	6	445		508	108	f
3921	7	250		508	106	f
3922	8	454		508	9	f
3923	9	371		508	209	t
3924	10	358		508	280	f
3925	1	194		509	88	f
3926	2	489		509	284	f
3927	3	760		509	330	t
3928	4	171		509	264	t
3929	5	712		509	425	t
3930	6	405		509	93	t
3931	7	303		509	449	t
3932	8	88		509	429	t
3933	9	615		509	394	t
3934	10	437		509	123	f
3935	1	265		510	183	f
3936	1	256		511	345	f
3937	2	223		511	86	f
3938	3	162		511	215	t
3939	4	386		511	28	f
3940	5	459		511	208	f
3941	6	483		511	206	f
3942	7	518	Jerry is suffering from laryngitisl.	511	329	f
3943	8	325		511	241	f
3944	9	418		511	79	f
3945	10	208		511	196	t
3946	11	325		511	321	f
3947	1	165		512	264	t
3948	2	480		512	425	t
3949	3	152		512	428	t
3950	4	404	Presuming Jerry left stage to deal with his laryngitis.	512	472	t
3951	5	161		512	428	t
3952	6	703		512	101	t
3953	7	440		512	93	t
3954	8	435	Phil intro	512	343	t
3955	9	308		512	367	t
3956	10	365	ascending riff	512	423	t
3957	1	260		513	183	f
3958	1	389		514	72	f
3959	2	200		514	86	f
3960	3	516		514	203	f
3961	4	293		514	42	f
3962	5	389		514	50	f
3963	6	457		514	329	f
3964	7	726		514	198	f
3965	1	613		515	286	t
3966	2	752		515	110	f
3967	3	247		515	106	f
3968	4	754		515	101	t
3969	5	502		515	104	t
3970	6	605		515	93	t
3971	7	620		515	306	t
3972	8	136		515	460	t
3973	9	433		515	343	t
3974	10	439		515	312	t
3975	11	547		515	316	f
3976	1	287		516	370	f
3977	1	358		517	64	f
3978	2	181		517	346	f
3979	3	474		517	355	f
3980	4	361		517	45	f
3981	5	424		517	145	f
3982	6	178	3 beats	517	22	f
3983	7	217		517	345	f
3984	8	487		517	79	f
3985	1	575		518	286	t
3986	2	574		518	110	f
3987	3	425		518	217	t
3988	4	320		518	121	t
3989	5	56		518	435	t
3990	6	47		518	428	t
3991	7	884		518	93	t
3992	8	402		518	455	t
3993	9	101		518	460	t
3994	10	360		518	343	t
3995	11	464		518	66	t
3996	12	570		518	316	f
3997	1	328		519	24	t
3998	2	303		519	123	f
3999	3	323		519	42	f
4000	4	265		519	50	f
4001	5	375		519	262	f
4002	6	445		519	206	f
4003	7	217		519	86	f
4004	8	201		519	261	f
4005	9	400		519	48	f
4006	10	266		519	99	f
4007	11	473		519	114	f
4008	12	412		519	341	f
4009	1	329		520	64	f
4010	2	209		520	196	t
4011	3	291		520	321	f
4012	4	504		520	286	t
4013	5	542		520	110	f
4014	6	617		520	101	t
4015	7	581		520	134	f
4016	8	301	Whistle Blow Opening	520	367	t
4017	9	135	Ascending Riff	520	423	t
4018	10	70		520	428	t
4019	11	88		520	460	t
4020	12	743		520	394	t
4021	13	452		520	13	f
4022	1	411		521	284	f
4023	1	691		522	228	f
4024	2	354		522	178	f
4025	3	523		522	329	f
4026	4	195		522	223	t
4027	5	182		522	222	f
4028	6	523		522	114	f
4029	7	285		522	241	f
4030	8	326		522	94	f
4031	9	233		522	261	f
4032	10	217		522	86	f
4033	11	466		522	341	f
4034	1	458		523	284	f
4035	2	234		523	319	f
4036	3	644		523	286	t
4037	4	581		523	110	f
4038	5	381		523	123	f
4039	6	472		523	281	t
4040	7	245		523	93	t
4041	8	480		523	248	t
4042	9	38		523	460	t
4043	10	671		523	394	t
4044	11	68		523	281	f
4045	12	346		523	367	t
4046	13	81	Ascending Riff	523	423	t
4047	14	84		523	428	t
4048	15	128	Ascending Riff	523	423	f
4049	1	293		524	183	f
4050	1	364		525	138	f
4051	2	533		525	318	f
4052	3	431		525	241	f
4053	4	378		525	262	f
4054	5	187		525	222	t
4055	6	316		525	28	f
4056	7	412		525	208	f
4057	8	368		525	376	f
4058	9	420		525	311	f
4059	1	349		526	143	f
4060	2	309		526	367	t
4061	3	99	It trailed off into Smokestack Lighting' Jam before going into Terrapin	526	423	t
4062	4	725		526	330	t
4063	5	272		526	428	t
4064	6	535		526	93	t
4065	7	66		526	449	t
4066	8	424		526	306	t
4067	9	47		526	460	t
4068	10	232		526	159	f
4069	11	313		526	7	t
4070	12	704		526	232	f
4071	13	418		526	123	f
4072	1	325		527	40	f
4073	1	327		528	168	f
4074	2	441		528	241	f
4075	3	314		528	364	f
4076	4	435		528	393	f
4077	5	222		528	396	f
4078	6	273		528	223	f
4079	7	521		528	29	f
4080	8	250		528	345	f
4081	1	707		529	289	f
4082	2	501		529	206	f
4083	3	707		529	330	t
4084	4	516		529	93	t
4085	5	383		529	306	t
4086	6	407		529	343	t
4087	7	433		529	312	t
4088	8	528		529	357	t
4089	9	450		529	248	f
4090	1	382		530	365	f
4091	1	421		531	178	f
4092	2	538		531	114	f
4093	3	633		531	174	f
4094	4	178		531	86	f
4095	5	403		531	28	f
4096	6	382		531	94	f
4097	7	248		531	255	f
4098	8	495		531	393	f
4099	9	194		531	196	t
4100	10	438		531	321	f
4101	11	263		531	224	f
4102	1	1040		532	318	f
4103	2	489		532	284	f
4104	3	775		532	134	t
4105	4	529		532	93	t
4106	5	272		532	306	t
4107	6	142		532	470	t
4108	7	199		532	428	t
4109	8	307	Weir, "ever since she went and had all her pets changed." Get back Truckin' On 7 times 	532	367	t
4110	9	126	Weir quotes spoonful during jam.	532	423	t
4111	10	572		532	394	t
4112	11	246		532	13	t
4113	12	523		532	123	f
4114	1	312		533	370	f
4115	1	355		534	168	f
4116	2	517		534	203	f
4117	3	191		534	86	f
4118	4	459		534	174	f
4119	5	280		534	389	f
4120	6	299		534	42	f
4121	7	357		534	267	f
4122	8	455		534	329	f
4123	9	469		534	341	f
4124	1	701		535	289	f
4125	2	500		535	217	t
4126	3	460		535	111	t
4127	4	663		535	93	t
4128	5	490		535	306	t
4129	6	57		535	460	t
4130	7	259		535	353	t
4131	8	323		535	80	t
4132	9	143		535	414	t
4133	10	231		535	13	t
4134	11	284		535	121	t
4135	12	59		535	435	t
4136	13	319		535	368	f
4137	1	389		536	175	f
4138	1	375	Anymore 9 Times	537	24	t
4139	2	230		537	345	f
4140	3	451		537	393	f
4141	4	358		537	238	f
4142	5	367		537	48	f
4143	6	482		537	241	f
4144	7	308		537	42	f
4145	8	424		537	206	f
4146	9	204		537	57	t
4147	10	130		537	424	t
4148	11	362		537	155	f
4149	1	228		538	139	t
4150	2	258		538	300	t
4151	3	590		538	113	f
4152	4	297	Ever since she went and had her sex change. Get Truckin' Back On 8 Times	538	367	t
4153	5	85		538	423	t
4154	6	87		538	459	t
4155	7	45		538	304	t
4156	8	81		538	428	t
4157	9	150		538	429	t
4158	10	420		538	93	t
4159	11	234		538	306	t
4160	12	81	Bob sings, "Little Star" with mic volume off	538	455	t
4161	13	60		538	460	t
4162	14	386		538	357	t
4163	15	47		538	428	t
4164	16	39	Here Comes Sunshine riff	538	437	t
4165	17	463		538	31	t
4166	18	279		538	121	t
4167	19	59		538	435	t
4168	20	251		538	257	f
4169	1	301		539	2	f
4170	1	369		540	138	f
4171	2	675		540	318	f
4172	3	418		540	241	f
4173	4	281		540	177	f
4174	5	352		540	33	f
4175	6	431		540	270	f
4176	7	299		540	396	f
4177	8	704		540	29	f
4178	9	276		540	345	f
4179	1	218		541	57	t
4180	2	180		541	424	t
4181	3	404		541	155	f
4182	4	377		541	280	f
4183	5	562		541	69	t
4184	6	162		541	264	t
4185	7	210		541	425	t
4186	8	273		541	429	t
4187	9	620		541	93	t
4188	10	577		541	306	t
4189	11	127		541	425	t
4190	12	120		541	426	t
4191	13	556		541	312	t
4192	14	614		541	357	t
4193	15	418	Weir started with One More Saturday Night	541	248	f
4194	1	309		542	257	f
4195	1	516		543	111	f
4196	2	448		543	241	f
4197	3	369	Did not do the ending	543	228	f
4198	4	360		543	267	f
4199	5	407		543	270	f
4200	6	193		543	22	f
4201	7	897		543	29	f
4202	8	247		543	183	f
4203	1	600		544	35	f
4204	2	420		544	284	f
4205	3	224		544	139	t
4206	4	395		544	300	t
4207	5	490		544	113	t
4208	6	206		544	428	t
4209	7	366		544	429	t
4210	8	370		544	93	f
4211	9	560		544	306	t
4212	10	36		544	460	t
4213	11	239		544	156	t
4214	12	543		544	312	t
4215	13	584		544	357	t
4216	14	588		544	248	f
4217	1	0		545	30	f
4218	1	391		546	64	f
4219	2	247		546	129	f
4220	3	486		546	393	f
4221	4	323		546	138	f
4222	5	410		546	208	f
4223	6	526		546	203	f
4224	7	630		546	29	f
4225	8	740		546	198	f
4226	1	269		547	57	t
4227	2	251		547	424	t
4228	3	403		547	155	f
4229	4	718		547	101	t
4230	5	1140		547	104	t
4231	6	71		547	473	t
4232	7	577		547	93	t
4233	8	408		547	306	t
4234	9	167	Birds chirping and singing sound effects	547	430	t
4235	10	75		547	460	t
4236	11	583		547	357	t
4237	12	478		547	343	t
4238	13	545		547	394	t
4239	14	289		547	13	t
4240	15	581		547	123	f
4241	1	663		548	228	t
4242	2	1106		548	113	f
4243	3	259		548	99	t
4244	4	253		548	223	f
4245	5	530		548	329	f
4246	6	207		548	196	t
4247	7	289		548	321	f
4248	8	333		548	79	f
4249	1	329		549	156	t
4250	2	405	Anymore 12 times	549	24	t
4251	3	405		549	209	t
4252	4	342		549	280	t
4253	5	813	garcia doing scale riff	549	428	t
4254	6	569		549	93	t
4255	7	282	w/ drums	549	306	t
4256	8	547		549	248	t
4257	9	71		549	460	t
4258	10	591		549	312	t
4259	11	490		549	316	f
4260	1	372	Weir before song, "This is only a test."	550	49	f
4261	1	451		551	228	f
4262	2	202		551	223	f
4263	3	219		551	27	f
4264	4	405		551	33	f
4265	5	281		551	286	f
4266	6	196	5 beats	551	22	f
4267	7	501		551	329	f
4268	8	334		551	221	f
4269	9	424		551	318	f
4270	10	282		551	178	f
4271	11	313		551	171	f
4272	12	249		551	99	f
4273	13	287		551	207	f
4274	14	255		551	230	f
4275	15	223		551	57	t
4276	16	184		551	424	t
4277	17	107		551	438	t
4278	18	317		551	155	f
4279	1	197		552	345	t
4280	2	372		552	24	t
4281	3	335		552	129	f
4282	4	365		552	293	f
4283	5	83		552	391	t
4284	6	274		552	390	t
4285	7	396		552	198	t
4286	8	334		552	428	t
4287	9	636		552	394	f
4288	10	294		552	28	f
4289	11	354		552	262	f
4290	12	302	7 gbto	552	367	t
4291	13	179		552	423	t
4292	14	77		552	247	t
4293	15	386		552	428	t
4294	16	100		552	437	t
4295	17	114		552	428	t
4296	18	361		552	248	t
4297	19	68		552	428	t
4298	20	354		552	121	t
4299	21	66		552	435	f
4300	22	312		552	257	f
4301	1	320		553	370	f
4302	1	196		554	345	f
4303	2	429		554	318	f
4304	3	203	Weir, "It's Polka time, ladies and gentleman!"	554	223	f
4305	4	464		554	329	f
4306	5	282		554	178	f
4307	6	290		554	42	f
4308	7	184	8 beats	554	22	f
4309	1	200		555	57	t
4310	2	172		555	424	t
4311	3	117		555	438	t
4312	4	323		555	155	f
4313	5	257		555	99	f
4314	6	320		555	370	f
4315	7	285		555	129	f
4316	8	316		555	171	f
4317	9	312	Lesh, "This is a sensitive song about all sorts of things."	555	221	f
4318	10	267		555	79	f
4319	11	312		555	13	f
4320	1	458		556	228	f
4321	2	294		556	367	t
4322	3	121	ascending riff	556	423	t
4323	4	187		556	247	t
4324	5	79		556	428	t
4325	6	34		556	432	t
4326	7	276		556	428	t
4327	8	260	first verse only - botched lyrics	556	343	t
4328	9	43		556	429	t
4329	10	224		556	431	t
4330	11	349		556	428	t
4331	12	136		556	437	t
4332	13	480		556	278	f
4333	14	298		556	28	f
4334	15	350		556	293	f
4335	16	552		556	316	f
4336	1	0		557	24	f
4337	2	0		557	222	f
4338	3	0		557	39	f
4339	4	0		557	79	f
4340	5	0		557	206	f
4341	6	0		557	329	f
4342	7	0		557	346	f
4343	8	198		557	57	t
4344	9	165		557	424	t
4345	10	88		557	438	t
4346	11	311		557	155	f
4347	12	0	4 Beats	557	22	f
4348	13	0		557	355	f
4349	14	0		557	264	t
4350	15	0		557	425	t
4351	16	0		557	426	f
4352	1	175		558	345	f
4353	2	295		558	42	f
4354	3	206		558	223	f
4355	4	488		558	278	f
4356	5	0		558	178	f
4357	6	0		558	27	f
4358	7	0		558	129	f
4359	8	0		558	140	f
4360	9	0		558	28	f
4361	10	0		558	208	f
4362	11	0		558	99	f
4363	12	0		558	49	f
4364	1	308		559	367	t
4365	2	205		559	423	t
4366	3	76		559	247	t
4367	4	493		559	428	t
4368	5	134		559	93	t
4369	6	226		559	343	t
4370	7	101		559	431	t
4371	8	142		559	430	t
4372	9	62		559	429	t
4373	10	102		559	428	t
4374	11	397		559	104	t
4375	12	304		559	436	t
4376	13	47		559	428	t
4377	14	513		559	312	t
4378	15	584		559	316	f
4379	1	0		560	183	f
4380	1	232		561	139	t
4381	2	348		561	300	t
4382	3	557		561	113	f
4383	4	520		561	203	f
4384	5	193		561	86	f
4385	6	399		561	174	f
4386	7	344		561	185	f
4387	8	471		561	263	f
4388	9	193		561	88	f
4389	1	411		562	168	f
4390	2	162		562	264	t
4391	3	397		562	425	t
4392	4	342		562	59	t
4393	5	497		562	372	t
4394	6	782		562	330	t
4395	7	588		562	93	t
4396	8	690		562	306	t
4397	9	229		562	156	t
4398	10	295		562	119	t
4399	11	533		562	311	f
4400	12	390		562	248	f
4401	1	299		563	14	f
4402	1	738		564	289	f
4403	2	431		564	241	f
4404	3	466		564	114	f
4405	4	166		564	222	f
4406	5	326		564	28	f
4407	6	562		564	29	f
4408	7	502		564	203	f
4409	8	390	Anymore 9 times	564	24	f
4410	9	302		564	217	f
4411	1	1	no recording exists	565	57	t
4412	2	75	SBD cut	565	424	t
4413	3	324		565	155	f
4414	4	700		565	101	t
4415	5	401		565	104	t
4416	6	685		565	93	t
4417	7	213		565	306	t
4418	8	441		565	248	t
4419	9	576		565	312	t
4420	10	599		565	316	f
4421	1	338		566	40	f
4422	1	390		567	24	f
4423	2	160		567	215	f
4424	3	469		567	208	f
4425	4	398		567	28	f
4426	5	421		567	355	f
4427	6	494		567	206	f
4428	7	504		567	329	f
4429	8	503		567	101	f
4430	9	620		567	330	t
4431	10	162		567	264	t
4432	11	236		567	425	t
4433	12	349		567	428	t
4434	13	421		567	284	t
4435	14	49		567	428	t
4436	15	162		567	458	t
4437	16	216		567	428	t
4438	17	66		567	425	t
4439	18	165		567	426	f
4440	1	621		568	104	t
4441	2	90		568	428	t
4442	3	164		568	456	t
4443	4	636		568	72	t
4444	5	591		568	394	t
4445	6	801		568	113	t
4446	7	549		568	316	f
4447	1	299		569	257	f
4448	2	540		569	372	f
4449	1	308		570	178	f
4450	2	165		570	86	f
4451	3	402		570	45	f
4452	4	383		570	48	f
4453	5	429		570	174	f
4454	6	472		570	69	t
4455	7	228		570	129	f
4456	8	236		570	190	f
4457	1	329		571	365	f
4458	2	565		571	206	f
4459	3	540		571	134	t
4460	4	94	Weir quotes Spoonful	571	460	t
4461	5	252		571	303	t
4462	6	73		571	458	t
4463	7	113		571	428	t
4464	8	610		571	93	t
4465	9	523		571	306	t
4466	10	278		571	353	t
4467	11	469		571	312	t
4468	12	524		571	357	t
4469	13	282		571	368	f
4470	1	291		572	39	f
4471	1	376	Weir says, "...we are not all that late anyway. The news is circulating backstage that we will be going on soon and pretty soon the whole band will be here. Donna says, "Calling Doctor Beachwood, Doctor Beachwood calling Doctor Shot, Doctor Shot. You're needed on he stage please. Assistance on the stage please."	573	341	f
4472	2	428		573	270	f
4473	3	268		573	50	f
4474	4	310		573	42	f
4475	5	293		573	241	f
4476	6	498		573	114	f
4477	7	271		573	99	f
4478	8	327		573	177	f
4479	9	475		573	206	f
4480	10	422		573	286	t
4481	11	782		573	110	f
4482	1	410	Weir says, "We are getting everything just exactly right. I don't know if you are going to understand this any better than I do but Mickey wanted me to inform you in his opinion, "The first law of rock n roll is drummers do not make house calls". I don't understand either.	574	284	f
4483	2	391	anymore - 10 times	574	24	f
4484	3	588		574	101	t
4485	4	347		574	93	t
4486	5	578		574	344	t
4487	6	198		574	475	t
4488	7	211	first verse only	574	343	t
4489	8	711		574	312	t
4490	9	426		574	121	t
4491	10	59		574	435	t
4492	11	288		574	257	f
4493	1	343		575	370	f
4494	1	330		576	143	f
4495	2	437		576	241	f
4496	3	475		576	228	f
4497	4	186		576	222	t
4498	5	309		576	223	f
4499	6	551		576	359	f
4500	7	288		576	396	f
4501	8	692		576	29	f
4502	1	214		577	57	t
4503	2	168		577	424	t
4504	3	326		577	155	f
4505	4	451		577	293	f
4506	5	691		577	101	t
4507	6	694		577	330	t
4508	7	579		577	93	t
4509	8	491		577	306	t
4510	9	227		577	156	t
4511	10	294		577	80	t
4512	11	144		577	414	t
4513	12	509		577	316	f
4514	1	408		578	175	f
4515	1	399		579	365	f
4516	2	376		579	383	f
4517	3	415		579	208	f
4518	4	156		579	215	t
4519	5	328		579	223	f
4520	6	355		579	94	f
4521	7	289		579	396	f
4522	8	456		579	207	f
4523	9	756		579	198	f
4524	1	638		580	111	f
4525	2	168		580	264	t
4526	3	493		580	425	t
4527	4	740		580	372	t
4528	5	326		580	428	t
4529	6	821		580	93	t
4530	7	701		580	306	t
4531	8	301		580	460	t
4532	9	323		580	343	t
4533	10	699		580	394	f
4534	11	281		580	183	f
4535	1	422		581	175	f
4536	1	430		582	241	f
4537	2	504		582	114	f
4538	3	345		582	50	f
4539	4	421		582	208	f
4540	5	467		582	108	f
4541	6	487		582	329	f
4542	7	453		582	206	f
4543	8	260		582	224	f
4544	1	337		583	64	f
4545	2	414		583	284	f
4546	3	507		583	69	t
4547	4	362		583	156	t
4548	5	279		583	428	t
4549	6	463		583	93	t
4550	7	85		583	306	t
4551	8	82		583	460	t
4552	9	576		583	343	t
4553	10	384		583	121	t
4554	11	78		583	435	t
4555	12	559		583	394	t
4556	13	235		583	13	t
4557	14	477		583	123	f
4558	1	310		584	40	f
4559	1	305		585	6	t
4560	2	248		585	129	f
4561	3	188		585	86	f
4562	4	311		585	138	f
4563	5	569		585	393	f
4564	6	185		585	222	t
4565	7	310		585	223	f
4566	8	433		585	9	f
4567	9	486		585	45	f
4568	10	263		585	224	f
4569	1	231		586	139	t
4570	2	423		586	300	t
4571	3	579		586	113	f
4572	4	874		586	198	f
4573	5	644		586	134	t
4574	6	508		586	93	t
4575	7	541		586	455	t
4576	8	61		586	460	t
4577	9	320	Whistle blowing opening; Get Back Truckin' On 	586	367	t
4578	10	122		586	423	t
4579	11	645		586	383	t
4580	12	608		586	232	t
4581	13	222		586	13	t
4582	14	612		586	316	f
4583	1	299		587	370	f
4584	1	333		588	178	f
4585	2	405		588	355	f
4586	3	177		588	222	t
4587	4	366		588	28	f
4588	5	504		588	9	f
4589	6	519		588	203	f
4590	7	348		588	42	f
4591	8	642		588	198	t
4592	9	187		588	57	t
4593	10	164		588	424	t
4594	11	306		588	155	f
4595	1	917		589	289	f
4596	2	420		589	209	t
4597	3	389		589	280	t
4598	4	369		589	353	t
4599	5	374		589	428	t
4600	6	454		589	240	t
4601	7	114		589	449	t
4604	10	406		589	93	f
4605	11	93		589	429	t
4607	13	30		589	306	t
4608	14	156		589	455	t
4609	15	292		589	470	t
4610	16	319	Sex Change!	589	367	t
4611	17	106	Ascending Riff	589	423	t
4612	18	102		589	428	t
4613	19	597		589	394	t
4614	20	517		589	316	f
4615	1	313		590	370	f
4602	8	82		589	478	t
4603	9	42		589	479	t
4606	12	116		589	480	t
4616	1	580		591	289	f
4617	2	226		591	129	f
4618	3	502		591	114	f
4619	4	508		591	203	f
4620	5	385		591	262	f
4621	6	172		591	222	t
4622	7	330		591	28	f
4623	8	404		591	9	f
4624	9	458		591	206	f
4625	10	247		591	224	f
4626	1	204		592	57	t
4627	2	155		592	424	t
4628	3	386		592	155	f
4629	4	164		592	264	t
4630	5	415		592	425	t
4631	6	144		592	429	t
4632	7	669		592	330	t
4633	8	557		592	93	t
4634	9	86		592	449	t
4635	10	417		592	306	t
4636	11	73		592	460	t
4637	12	294		592	367	t
4638	13	82		592	423	t
4639	14	100		592	247	t
4640	15	577		592	31	t
4641	16	107		592	425	t
4642	17	137		592	426	t
4643	18	184		592	13	t
4644	19	435		592	123	f
4645	1	187		593	88	f
4646	1	355		594	168	f
4647	2	412		594	381	f
4648	3	256		594	177	f
4649	4	356		594	174	f
4650	5	268		594	397	f
4651	6	505		594	315	f
4652	7	680		594	29	f
4653	8	316		594	178	f
4654	1	211		595	57	t
4655	2	165		595	424	t
4656	3	330		595	155	f
4657	4	649		595	101	t
4658	5	566		595	134	t
4659	6	600		595	93	t
4660	7	485		595	306	t
4661	8	461		595	372	t
4662	9	33		595	460	t
4663	10	334		595	156	t
4664	11	501		595	111	t
4665	12	465		595	368	f
4666	1	425		596	175	f
4667	1	377	anymore 12 times	597	24	f
4668	2	214		597	129	f
4669	3	441		597	393	f
4670	4	538		597	241	f
4671	5	465		597	329	f
4672	6	352		597	138	f
4673	7	557		597	278	f
4674	8	504		597	206	f
4675	9	527		597	79	f
4676	1	213		598	139	t
4677	2	347		598	300	t
4678	3	618		598	113	t
4679	4	517		598	284	f
4680	5	737	Garcia does scale riff	598	104	t
4681	6	588		598	93	t
4682	7	220		598	452	t
4683	8	153		598	455	t
4684	9	232		598	470	t
4685	10	212		598	460	t
4686	11	376		598	343	t
4687	12	155	several attempted starts	598	312	t
4688	13	536		598	312	t
4689	14	213		598	13	t
4690	15	507		598	123	f
4691	1	266		599	190	f
4692	1	247		600	345	f
4693	2	544		600	228	f
4694	3	160		600	215	f
4695	4	278		600	79	f
4696	5	332		600	241	f
4697	6	517		600	262	f
4698	7	362		600	28	f
4699	8	673		600	318	f
4700	9	254		600	183	f
4701	1	429		601	284	f
4702	2	481		601	66	t
4703	3	398		601	428	t
4704	4	100		601	93	t
4705	5	328		601	343	t
4706	6	73		601	429	t
4707	7	242		601	306	t
4708	8	243		601	429	t
4709	9	47		601	428	t
4710	10	471		601	104	t
4711	11	433		601	428	t
4712	12	163		601	343	t
4713	13	51		601	460	t
4714	14	352		601	121	t
4715	15	80		601	435	t
4716	16	314		601	257	f
4717	1	382		602	370	f
4718	2	835		602	248	f
4719	1	652		603	228	f
4720	2	182		603	222	t
4721	3	393		603	28	f
4722	4	411		603	355	f
4723	5	507		603	206	f
4724	6	380		603	79	f
4725	7	256		603	99	f
4726	8	422		603	171	f
4727	9	224		603	196	t
4728	10	309		603	321	f
4729	1	463		604	284	f
4730	2	693		604	286	t
4731	3	682		604	110	f
4732	4	705		604	101	t
4733	5	674		604	104	t
4734	6	48		604	460	t
4735	7	898		604	93	t
4736	8	345	with Drums	604	306	t
4738	10	633		604	316	f
4739	1	299		605	257	f
4737	9	36		604	481	t
4740	1	299		606	83	f
4741	2	237		606	73	f
4742	3	293	Weir says, "I'd like a show of hands. It's a simple question: How many of you out there have ever seen a gorilla play a piano? More than one you expect! I've never seen a gorilla play a piano. Not for the squeamish."	606	165	f
4743	4	187	appears on Reckoning. This next number is a drummer's choice.	606	255	f
4744	5	518		606	359	f
4745	6	385		606	137	f
4746	7	276		606	274	f
4747	1	281		607	6	t
4748	2	260		607	345	f
4749	3	428		607	262	f
4750	4	155		607	215	t
4751	5	273		607	223	f
4752	6	496		607	208	f
4753	7	418		607	241	f
4754	8	484		607	9	f
4755	9	398		607	209	t
4756	10	390		607	280	f
4757	1	768		608	289	f
4758	2	411		608	284	f
4759	3	705		608	134	t
4760	4	152	Garcia does scale riff	608	428	f
4761	5	339	whistle blow opening; Get Back Truckin' On  7 times	608	367	t
4762	6	113		608	423	t
4763	7	125		608	428	f
4764	8	669	with Billy Cobham	608	93	t
4765	9	159		608	460	t
4766	10	374		608	343	t
4767	11	571		608	394	t
4768	12	404		608	123	f
4769	1	256		609	183	f
4770	1	343		610	138	f
4771	2	273		610	177	f
4772	3	442		610	348	f
4773	4	315		610	309	f
4774	5	347		610	33	f
4775	6	192		610	86	f
4776	7	682		610	198	f
4777	1	552		611	286	t
4778	2	646		611	110	f
4779	3	166		611	264	t
4780	4	338		611	425	t
4781	5	332		611	74	t
4782	6	690		611	330	t
4783	7	320		611	428	t
4784	8	677		611	93	t
4785	9	485		611	428	t
4786	10	419		611	96	t
4787	11	599		611	77	t
4788	12	389		611	123	f
4789	1	0		612	151	f
4790	1	388		613	138	f
4791	2	652		613	318	f
4792	3	278		613	99	f
4793	4	367		613	94	f
4794	5	468		613	203	f
4795	6	437		613	393	f
4796	7	703		613	198	f
4797	1	462		614	329	f
4798	2	319		614	71	f
4799	3	218		614	156	t
4800	4	532		614	69	t
4801	5	455		614	93	t
4802	6	528		614	306	t
4803	7	407		614	66	t
4804	8	270		614	119	t
4805	9	283	Get back Truckin' On 7 times	614	367	t
4806	10	67		614	423	t
4807	11	458		614	31	t
4808	12	438		614	123	f
4809	1	227		615	190	f
4810	1	339		616	178	f
4811	2	443		616	355	f
4812	3	180		616	222	t
4813	4	312		616	28	f
4814	5	529		616	329	f
4815	6	322		616	241	f
4816	7	471		616	309	f
4817	8	501		616	206	f
4818	9	378		616	79	f
4819	1	165		617	88	f
4820	2	529	Weir says, "Tomorrow's Sunday, we're not gonna be here, so we're going to take advantage of today to give you some inspirational words of advice."	617	284	f
4821	3	567		617	114	f
4822	4	821		617	330	t
4823	5	171		617	264	t
4824	6	656		617	425	t
4825	7	770		617	93	t
4826	8	382		617	306	t
4827	9	661		617	248	t
4828	10	489		617	312	f
4829	11	444		617	123	f
4830	1	691		618	289	t
4831	2	247		618	257	f
4832	1	307	Get Back Truckin' On' 5	619	367	t
4833	2	163		619	423	t
4834	3	55	Get Back Truckin' On' 7	619	427	f
4835	4	343		619	24	f
4836	5	205		619	264	t
4837	6	51		619	425	t
4838	7	120		619	426	f
4839	8	291		619	79	f
4840	9	297		619	178	f
4841	10	377		619	208	f
4842	11	183	7 beats	619	22	f
4843	12	276		619	75	t
4844	13	124		619	428	t
4845	14	126		619	74	t
4846	15	243		619	428	t
4847	16	292	There was a full stop after El Paso. They did not go into another jam but they did return to a jam.	619	99	f
4848	17	214		619	429	t
4849	18	252		619	428	f
4850	19	339		619	49	f
4851	20	259		619	257	f
4852	1	182		620	222	f
4853	2	368		620	270	f
4854	3	203		620	223	f
4855	4	330		620	40	f
4856	5	344		620	221	f
4857	6	327		620	71	f
4858	7	423		620	316	f
4859	8	144		620	407	f
4860	9	210		620	248	t
4861	10	541	Weir and Garcia play the China Cat during one section. 	620	428	t
4862	11	385		620	121	t
4863	12	121		620	435	t
4864	13	191		620	248	t
4865	1	243		621	183	f
4866	1	263		622	6	t
4867	2	241		622	345	f
4868	3	524		622	114	f
4869	4	339		622	50	f
4870	5	507		622	208	f
4871	6	443		622	45	f
4872	7	357		622	171	f
4873	8	423		622	241	f
4874	1	0		623	286	t
4875	2	736		623	110	f
4876	3	673		623	101	t
4877	4	583		623	104	f
4878	5	826		623	93	t
4879	6	275	with drums	623	306	t
4880	7	148		623	461	t
4881	8	390		623	248	t
4882	9	153		623	428	t
4883	10	659		623	394	t
4884	11	490		623	316	f
4885	1	197		624	88	f
4886	1	438		625	6	t
4887	2	247		625	345	f
4888	3	426		625	355	f
4889	4	178		625	222	t
4890	5	331		625	28	f
4891	6	448		625	145	f
4892	7	388		625	241	f
4893	8	433		625	309	f
4894	9	206		625	97	f
4895	10	487		625	206	f
4896	11	310		625	79	f
4897	1	365	Ending jam on main riff not played	626	341	t
4898	2	910		626	318	f
4899	3	717		626	101	t
4900	4	609	garcia does scale riff	626	104	t
4901	5	157		626	428	t
4902	6	586		626	93	t
4903	7	230		626	306	t
4904	8	84		626	460	t
4905	9	412		626	248	t
4906	10	624		626	31	t
4907	11	423		626	123	f
4908	1	317		627	370	f
4909	1	461		628	124	f
4910	2	111		628	70	t
4911	3	363		628	343	t
4912	4	399		628	70	t
4913	5	344		628	87	f
4914	6	319		628	163	f
4915	7	711		628	368	f
4916	1	426		629	142	f
4917	1	180		630	345	f
4918	2	417		630	318	f
4919	3	195	8 beats	630	22	f
4920	4	233		630	88	f
4921	5	379		630	33	f
4922	6	477		630	329	f
4923	7	198		630	223	f
4924	8	212		630	57	t
4925	9	171		630	424	t
4926	10	101		630	438	t
4927	11	315		630	155	f
4928	12	289		630	28	f
4929	13	538		630	278	f
4930	14	168		630	222	f
4931	15	293		630	42	f
4932	16	174		630	264	t
4933	17	686		630	425	t
4934	18	154		630	426	f
4935	1	297		631	13	f
4936	2	660		631	104	t
4937	3	162		631	436	t
4938	4	104		631	428	t
4939	5	94		631	391	t
4940	6	261		631	390	t
4941	7	491		631	198	f
4942	8	416		631	49	f
4943	9	550		631	316	t
4944	10	458		631	121	t
4945	11	54		631	435	f
4946	12	275		631	257	f
4947	1	193		632	10	f
4948	1	495		633	228	t
4949	2	490		633	113	f
4950	3	418		633	241	f
4951	4	383		633	48	f
4952	5	196		633	222	f
4953	6	292		633	223	f
4954	7	463		633	9	f
4955	8	312		633	217	f
4956	9	389		633	270	f
4957	10	625		633	198	t
4958	11	379		633	79	f
4959	1	612		634	289	t
4960	2	437		634	284	f
4961	3	405		634	240	f
4962	4	605		634	101	t
4963	5	504		634	134	t
4964	6	138		634	428	t
4965	7	384		634	93	t
4966	8	276		634	455	t
4967	9	48		634	460	t
4968	10	471		634	357	t
4969	11	346		634	121	t
4970	12	50		634	460	t
4971	13	277		634	353	t
4972	14	326		634	343	t
4973	15	528		634	394	t
4974	16	458		634	123	f
4975	1	182		635	88	f
4976	1	225		636	139	t
4977	2	495		636	300	t
4978	3	794		636	113	f
4979	4	478		636	203	f
4980	5	498		636	270	f
4981	6	395		636	263	f
4982	7	302		636	42	f
4983	8	295		636	345	f
4984	1	866		637	104	t
4985	2	468		637	217	f
4986	3	401		637	293	f
4987	4	321		637	367	t
4988	5	180	ascending riff	637	423	t
4989	6	37		637	428	t
4990	7	108		637	467	t
4991	8	818		637	330	t
4992	9	329		637	428	t
4993	10	736		637	93	t
4994	11	522		637	306	t
4995	12	76		637	460	t
4996	13	411		637	343	t
4997	14	569		637	394	t
4998	15	524		637	357	t
4999	16	521		637	248	f
5000	1	0		638	191	f
5001	1	234		639	139	t
5002	2	389		639	300	t
5003	3	540		639	113	f
5004	4	479		639	348	f
5005	5	285		639	177	f
5006	6	320		639	185	f
5007	7	698		639	198	f
5008	1	865		640	104	t
5009	2	377		640	388	f
5010	3	772		640	101	t
5011	4	592		640	134	t
5012	5	439		640	93	t
5013	6	834		640	306	t
5014	7	37		640	460	t
5015	8	366		640	353	t
5016	9	240		640	156	t
5017	10	25		640	460	t
5018	11	398		640	305	f
5019	12	488		640	123	f
5020	1	333		641	370	f
5021	1	376		642	178	f
5022	2	421		642	9	f
5023	3	162		642	215	t
5024	4	333		642	28	f
5025	5	364		642	262	f
5026	6	280		642	396	f
5027	7	471		642	210	f
5028	8	469		642	341	f
5029	1	422	Anymore - 9 times	643	24	f
5030	2	305		643	71	f
5031	3	576		643	206	t
5032	4	702		643	330	t
5033	5	742		643	93	t
5034	6	361		643	306	t
5035	7	117		643	460	t
5036	8	305	"It's a rotten stinkin' fucking shame!" Get back Truckin' On: 7 Times	643	367	t
5037	9	70		643	423	t
5038	10	318		643	121	t
5039	11	69		643	435	t
5040	12	624		643	232	f
5041	1	250		644	183	f
5042	1	259		645	6	f
5043	2	243		645	345	f
5044	3	395		645	262	f
5045	4	266		645	50	f
5046	5	412		645	208	f
5047	6	440		645	241	f
5048	7	238		645	106	f
5049	8	481		645	9	f
5050	9	462		645	206	f
5051	10	313		645	79	f
5052	1	460		646	108	f
5053	2	473		646	293	f
5054	3	365		646	209	t
5055	4	360		646	280	t
5056	5	173	garica scale riff	646	428	t
5057	6	664		646	394	t
5058	7	487	after 4:53 the dynamic of the jam changes.	646	343	t
5059	8	493		646	93	t
5060	9	175	with drums	646	306	t
5061	10	229		646	156	t
5062	11	362	anymore - 9 times	646	24	t
5063	12	485		646	316	f
5064	1	315		647	370	f
5065	2	371		647	40	f
5066	1	223		648	139	t
5067	2	324		648	300	t
5068	3	672		648	113	f
5069	4	336		648	381	f
5070	5	475		648	9	f
5071	6	169		648	222	t
5072	7	332		648	28	f
5073	8	334		648	185	f
5074	9	437		648	305	f
5075	10	276		648	345	f
5076	1	691		649	286	t
5077	2	959		649	110	f
5078	3	382		649	388	f
5079	4	467		649	280	f
5080	5	648		649	330	t
5081	6	322		649	428	t
5082	7	713		649	93	t
5083	8	1083		649	306	t
5084	9	361		649	338	f
5085	10	680		649	312	f
5086	11	291		649	257	f
5087	1	472		650	202	f
5088	1	278		651	143	f
5089	2	368		651	178	f
5090	3	443		651	393	f
5091	4	238		651	396	f
5092	5	494		651	114	f
5093	6	355		651	50	f
5094	7	442		651	9	f
5095	8	232		651	129	t
5096	9	130		651	85	t
5097	10	57		651	122	t
5098	11	59		651	85	f
5099	1	199		652	57	t
5100	2	99		652	424	t
5101	3	321		652	155	f
5102	4	164		652	264	t
5103	5	212		652	425	t
5104	6	205		652	428	t
5105	7	341		652	59	t
5106	8	57		652	425	t
5107	9	435		652	93	t
5108	10	415		652	306	t
5109	11	282		652	353	t
5110	12	265		652	119	t
5111	13	538		652	357	t
5112	14	480		652	248	f
5113	1	62		653	448	f
5114	2	253		653	340	f
5115	1	332		654	64	f
5116	2	142		654	215	f
5117	3	276		654	79	f
5118	4	192	5 beats	654	22	f
5119	5	424		654	208	f
5120	6	320		654	178	f
5121	7	477		654	329	f
5122	8	249		654	99	f
5123	9	368		654	40	f
5124	10	209		654	57	t
5125	11	216		654	424	t
5126	12	100		654	438	t
5127	13	325		654	155	f
5128	14	299		654	13	f
5129	1	169		655	264	t
5130	2	617		655	425	t
5131	3	250		655	93	t
5132	4	786		655	248	t
5133	5	36		655	344	t
5134	6	294		655	93	t
5135	7	212		655	344	t
5136	8	87		655	428	t
5137	9	81		655	429	t
5138	10	245	First Verse Only	655	343	t
5139	11	31		655	460	t
5140	12	527		655	394	t
5141	13	211		655	425	t
5142	14	177		655	426	f
5143	1	709		656	123	f
5144	2	331		656	171	f
5145	3	185		656	345	f
5146	4	567		656	104	t
5147	5	160		656	436	t
5148	6	173		656	300	t
5149	7	515		656	312	f
5150	8	509		656	316	f
5151	1	450		657	228	t
5152	2	96		657	10	f
5153	1	240		658	125	f
5154	2	0		658	108	f
5155	3	444		658	113	f
5156	4	490		658	203	f
5157	5	384		658	262	f
5158	6	192		658	222	t
5159	7	55	aborted 	658	223	t
5160	8	291		658	28	t
5161	9	788		658	29	f
5162	1	294		659	39	f
5163	2	331		659	376	f
5164	3	550		659	111	f
5165	4	427		659	217	t
5166	5	399		659	104	t
5167	6	473		659	93	t
5168	7	402		659	306	f
5169	8	283		659	121	t
5170	9	47		659	435	t
5171	10	232		659	156	t
5172	11	643		659	232	f
5173	1	299		660	257	f
5174	2	279		660	274	f
5175	1	367		661	178	f
5176	2	634		661	84	f
5177	3	413		661	393	f
5178	4	186	6 beats	661	22	f
5179	5	298		661	71	f
5180	6	307		661	309	f
5181	7	378		661	50	f
5182	8	457		661	79	f
5183	1	392		662	365	f
5184	2	451		662	284	f
5185	3	491		662	293	f
5186	4	610		662	101	t
5187	5	563		662	134	t
5188	6	265		662	93	t
5189	7	410		662	306	t
5190	8	73		662	460	t
5191	9	393	first verse sung with no drums	662	343	t
5192	10	518		662	394	t
5193	11	542		662	357	t
5194	12	330		662	248	f
5195	1	306		663	40	f
5196	1	262		664	125	f
5197	2	672		664	289	f
5198	3	408		664	381	f
5199	4	435		664	359	f
5200	5	443		664	174	f
5201	6	436		664	208	f
5202	7	822		664	198	f
5203	1	419	anymore 10 times	665	24	f
5204	2	234		665	129	t
5205	3	496		665	69	t
5206	4	328	Get back truckin' on 7 times	665	367	t
5207	5	61		665	423	t
5208	6	82		665	428	t
5209	7	717		665	93	t
5210	8	320		665	306	t
5211	9	230		665	353	f
5212	10	230		665	156	f
5213	11	351		665	80	t
5214	12	101		665	414	f
5215	13	353		665	368	f
5216	1	395		666	30	f
5217	1	358		667	365	f
5218	2	473		667	203	f
5219	3	307		667	364	f
5220	4	482		667	114	f
5221	5	277		667	238	f
5222	6	481		667	329	f
5223	7	292		667	396	f
5225	9	390	With Carlos Santana	667	124	f
5226	10	349	With Carlos Santana	667	169	f
5227	1	357		668	138	f
5228	2	283		668	397	f
5229	3	660		668	101	t
5230	4	544		668	104	t
5231	5	349		668	93	t
5232	6	373		668	306	t
5233	7	236	first verse without drums	668	343	t
5234	8	309		668	121	t
5235	9	68		668	435	t
5236	10	535		668	357	t
5237	11	332		668	368	t
5238	1	311		669	370	f
5224	8	592	After the song, Weir says, "We've been friends with Carlos Santana for a long time and just to prove it, we're gonna invite him out and see if he remembers this tune like we do. Or if we even remember it."	667	29	f
5239	1	317		670	178	f
5240	2	541		670	114	f
5241	3	544		670	203	f
5242	4	279		670	42	f
5243	5	163		670	215	t
5244	6	300		670	223	f
5245	7	455	Afterwards, Weir says, "We're gonna do a tune we did last night. On account we need to do it again because we need to practice."	670	9	f
5246	8	351		670	238	f
5247	9	496		670	79	t
5248	10	236		670	345	f
5249	1	737		671	286	t
5250	2	613		671	110	f
5251	3	681		671	101	t
5252	4	74		671	428	t
5253	5	493		671	104	t
5254	6	68		671	460	t
5255	7	216		671	343	t
5256	8	471		671	93	t
5257	9	107		671	475	t
5258	10	65		671	458	t
5259	11	324		671	430	t
5260	12	126		671	343	t
5261	13	450		671	312	t
5262	14	229		671	13	f
5263	15	310		671	257	f
5264	1	389		672	365	f
5265	1	295		673	24	f
5266	2	280		673	241	f
5267	3	405		673	270	f
5268	4	256		673	50	f
5269	5	286		673	42	f
5270	6	157		673	215	f
5271	7	559		673	262	f
5272	8	386		673	174	f
5273	9	470		673	208	f
5274	10	430	At the 6:23 mark there is a 15 second drum break	673	198	t
5275	11	251		673	428	t
5276	12	47		673	198	f
5277	13	643		673	318	f
5278	1	162		674	196	t
5279	2	261		674	321	f
5280	3	652		674	228	f
5281	4	737	a 27 sec drum intro	674	72	f
5282	5	498		674	68	f
5283	6	633		674	286	f
5284	7	255		674	281	t
5285	8	543		674	248	t
5286	9	53	Phil plays Fire On The Mountain	674	428	t
5287	10	214		674	93	t
5288	11	56		674	457	t
5289	12	71		674	428	t
5290	13	123		674	281	t
5291	14	555		674	316	f
5292	1	339		675	64	f
5293	2	189	19 beats	675	22	f
5294	3	236		675	235	f
5295	4	427		675	318	f
5296	5	290		675	178	f
5297	6	280	Phil says, "And now ladies and gentlemen, the '' man in showbiz, Pigpen!"	675	245	f
5298	7	423		675	329	f
5299	8	257		675	99	f
5300	9	341		675	40	f
5301	10	200		675	476	f
5302	11	219		675	407	f
5303	12	326		675	71	f
5304	13	0		675	49	f
5305	1	380		676	316	f
5306	2	364		676	270	f
5307	3	314		676	25	f
5308	4	190		676	223	f
5309	5	268		676	42	f
5310	6	166		676	222	f
5311	7	739		676	303	f
5312	8	332		676	79	f
5313	9	314		676	367	t
5314	10	103		676	423	t
5315	11	84		676	427	f
5316	12	373		676	248	t
5317	13	401		676	121	t
5318	14	117		676	435	t
5319	15	199		676	248	f
5320	1	283		677	257	f
5321	1	234		678	27	f
5322	2	280		678	178	f
5323	3	437		678	318	f
5324	4	197		678	223	f
5325	5	748		678	140	f
5326	6	404		678	33	f
5327	7	372		678	71	f
5328	8	512		678	278	f
5329	9	182		678	346	f
5330	10	290		678	42	f
5331	11	185	7 beats	678	22	f
5332	12	467		678	329	f
5333	13	242		678	99	f
5334	14	217		678	57	t
5335	15	200		678	424	t
5336	16	109		678	438	t
5337	17	320		678	155	f
5338	18	304		678	13	f
5339	1	308		679	367	t
5340	2	151	ascending riff	679	423	t
5341	3	465		679	428	t
5342	4	208		679	344	t
5343	5	75		679	430	t
5344	6	66		679	428	t
5345	7	189		679	343	t
5346	8	323		679	431	t
5347	9	292		679	28	t
5348	10	168		679	344	t
5349	11	196		679	428	t
5350	12	686		679	104	t
5351	13	61	Seemingly they couldn't find their way into Untitled Post Eyes Jam	679	428	t
5352	14	258	with the Cryptical ending	679	343	t
5353	15	523		679	394	f
5354	16	168		679	222	f
5355	17	364		679	121	t
5356	18	78		679	435	t
5357	19	282		679	257	f
5358	1	795		680	289	f
5359	2	432		680	241	f
5360	3	435		680	355	f
5361	4	275		680	99	f
5362	5	288		680	177	f
5363	6	488		680	203	f
5364	7	524		680	145	f
5365	8	356		680	50	f
5366	9	524		680	9	f
5367	10	540		680	341	f
5368	1	341		681	64	f
5369	2	468		681	284	f
5370	3	427		681	171	f
5371	4	835		681	101	t
5372	5	739		681	104	t
5373	6	448		681	93	t
5374	7	167		681	460	t
5375	8	394		681	209	t
5376	9	410		681	280	t
5377	10	623		681	394	t
5378	11	547		681	316	f
5379	1	194		682	88	f
5380	1	252		683	345	f
5381	2	206		683	86	f
5382	3	209	Weir says, "Polka time, ladies and gentleman. It's time to do the polka.	683	223	t
5383	4	335	Lesh says, “Excuse me but we appreciate that there are some rules that apparently you can’t climb over this railing down here. But I think we can all appreciate it if the security folks would do their job with just a little less zeal.  Weir says, “And if the PA folks did their job with a little less squeal.”  Lesh says, “He’s a poet on his toes and it shows.”	683	28	f
5384	5	323	Weir says, “As you can readily see one of our highly trained and expert crack equipment crew is taking care of Mickey’s drums which were not just exactly perfect. We are going to take a moment to get everything just exactly perfect.  Hart says, “We’re perfect. We’re exactly perfect.”  Weir says, “Mickey has informed me we are exactly perfect now we can proceed.”  Garcia mentions off mic “moving myself out claustrophobic.”  Weir says, “Meanwhile Jerry is improving his situation over here as well.”  Garcia, “I’m trying to make it as fucked up as possible. I’m not into that perfection shit. It’s almost perfectly fucked. Now where were we?”	683	42	f
5385	6	473		683	206	f
5386	7	417		683	262	f
5387	8	460		683	174	f
5388	9	335		683	79	f
5389	10	201		683	196	t
5390	11	320		683	321	f
5392	2	314		684	123	f
5393	3	458		684	293	f
5394	4	748		684	101	t
5395	5	710		684	104	t
5396	6	377		684	428	t
5397	7	563		684	312	t
5398	8	817		684	113	t
5399	9	473		684	13	f
5400	1	235		685	183	f
5401	1	1606	At 13:46 into Love Light they shift into a blues riff resembling the beginning of Hand Me Down My Walkin Cane, then slip back into Turn On Your Love Light 34 seconds later.	686	368	f
5402	2	402		686	87	f
5403	3	517		686	133	t
5404	4	200		686	57	t
5405	5	92		686	428	t
5406	6	540		686	336	t
5407	7	408		686	81	f
5408	8	240		686	8	t
5409	9	453	Drummer's do a scat for 15 seconds	686	93	t
5410	10	378		686	281	t
5411	11	237		686	107	t
5412	12	192		686	10	f
5413	1	261		687	345	f
5414	2	411		687	355	f
5415	3	200		687	223	f
5416	4	224		687	86	f
5417	5	262		687	50	f
5418	6	342		687	79	f
5419	7	206		687	261	f
5420	8	490		687	329	f
5421	9	293		687	241	f
5422	10	547		687	262	f
5423	11	473		687	341	f
5424	1	369	anymore 14 times	688	24	t
5425	2	311		688	123	f
5426	3	438		688	171	f
5427	4	583		688	101	t
5428	5	580		688	104	t
5429	6	128		688	447	t
5430	7	416	Cowbells!	688	72	t
5431	8	237		688	428	t
5432	9	291		688	93	t
5433	10	640		688	248	t
5434	11	543		688	31	f
5435	12	485		688	13	f
5391	1	382	anymore - 13 times	684	24	t
5436	1	394		689	178	f
5437	2	475		689	9	f
5438	3	157		689	215	t
5439	4	292		689	223	f
5440	5	519		689	114	f
5441	6	527	with Matt Kelly, harmonica.	689	241	f
5442	7	486	with Matt Kelly, harmonica.	689	79	f
5443	1	492		690	341	t
5444	2	671		690	113	f
5445	3	685		690	101	t
5446	4	418		690	308	t
5447	5	60		690	428	t
5448	6	425	with Hamza El-Din, tar	690	93	t
5449	7	340		690	254	t
5450	8	675		690	306	t
5451	9	451		690	217	t
5452	10	489		690	31	t
5453	11	451		690	123	f
5454	1	315	noticeably bad performance.	691	40	f
5455	1	311		692	241	f
5456	2	410		692	355	f
5457	3	288		692	50	f
5458	4	223		692	86	f
5459	5	464		692	206	f
5460	6	265		692	42	f
5461	7	193	Weir says, "Candy, can we have a different light for the drummers. I don't want to be the same color as the drummers."	692	196	t
5462	8	253		692	321	f
5463	9	846		692	318	f
5464	10	457		692	341	f
5465	1	428		693	284	f
5466	2	653		693	286	t
5467	3	609		693	110	f
5468	4	574		693	101	t
5469	5	647	Garcia solo on intro.	693	134	t
5470	6	339	Get Back Truckin' On: 7 Times	693	367	t
5471	7	193		693	423	t
5472	8	387		693	93	t
5473	9	646		693	330	t
5474	10	477		693	13	f
5475	1	588		694	49	f
5476	1	330	Anymore 6 times	695	24	f
5477	2	186		695	222	f
5478	3	221		695	245	f
5479	4	543		695	232	f
5480	5	251		695	264	f
5481	6	360		695	208	f
5482	7	581		695	98	f
5483	8	341		695	221	f
5484	9	152		695	129	t
5485	10	212		695	183	f
5486	1	311	Get Back Truckin' On 7 Times	696	367	t
5487	2	108		696	423	t
5488	3	82	Get Back Truckin' On 7 Times	696	427	f
5489	4	466		696	132	f
5490	5	275	Weir, "This stage is filled with flotsam, you don't know. 	696	79	f
5491	6	339		696	316	f
5492	7	298		696	49	f
5493	8	123		696	123	t
5494	9	310		696	93	t
5495	10	279		696	428	t
5496	11	674		696	123	f
5497	12	307		696	121	t
5498	13	71		696	435	t
5499	14	347		696	281	t
5500	15	284		696	248	t
5501	16	375		696	372	f
5502	1	314		697	6	t
5503	2	239		697	129	f
5504	3	449		697	355	f
5505	4	484		697	241	f
5506	5	574		697	29	f
5507	6	456		697	206	f
5508	7	448		697	329	f
5509	8	293		697	238	f
5510	9	537		697	79	f
5511	1	804		698	289	f
5512	2	408		698	217	f
5513	3	418		698	293	f
5514	4	833		698	101	t
5515	5	597		698	104	t
5516	6	535		698	93	t
5517	7	511		698	306	t
5518	8	482		698	343	t
5519	9	577		698	31	t
5520	10	558		698	123	f
5521	1	268		699	257	f
5522	1	383		700	241	f
5523	2	421		700	355	f
5524	3	152		700	215	t
5525	4	284		700	223	f
5526	5	400		700	48	f
5527	6	493		700	203	f
5528	7	279		700	71	f
5529	8	177	11 beats	700	22	f
5530	9	540		700	9	f
5531	10	440		700	209	t
5532	11	436		700	280	f
5533	12	484		700	79	f
5534	1	441		701	108	f
5535	2	826		701	113	f
5536	3	339		701	217	f
5537	4	770		701	134	t
5538	5	319	Whistle Opening - Ever since she had a sex change!	701	367	t
5539	6	94	ascending riff	701	423	t
5540	7	215		701	428	t
5541	8	42		701	469	t
5542	9	79		701	480	t
5543	10	514		701	93	t
5544	11	162		701	452	t
5545	12	149		701	429	t
5546	13	193		701	460	t
5547	14	487		701	343	t
5548	15	662		701	232	f
5549	16	264		701	183	f
5550	1	183		702	88	f
5551	1	334		703	6	t
5552	2	239		703	129	f
5553	3	484		703	355	f
5554	4	176		703	222	t
5555	5	324		703	28	f
5556	6	489		703	262	f
5557	7	522		703	45	f
5558	8	636		703	29	f
5559	9	453		703	174	f
5560	10	461		703	9	f
5561	11	780		703	198	f
5562	1	855		704	286	t
5563	2	665		704	110	f
5564	3	684		704	101	t
5565	4	487		704	104	t
5566	5	81		704	428	t
5567	6	445		704	240	t
5568	7	54		704	455	t
5569	8	437		704	93	t
5570	9	145		704	430	t
5571	10	30		704	306	t
5572	11	656		704	248	t
5573	12	537		704	312	t
5574	13	276		704	257	f
5575	1	317		705	370	f
5576	1	420		706	24	f
5577	2	279		706	345	f
5578	3	331		706	309	f
5579	4	529		706	383	f
5580	5	352		706	305	f
5581	6	353		706	267	f
5582	7	416		706	207	f
5583	8	536		706	387	f
5584	9	205		706	88	f
5585	1	295		707	257	f
5586	2	449		707	228	f
5587	3	630		707	101	t
5588	4	431		707	134	t
5589	5	148	Without Jerry, Phil doing the "passive aggressive"	707	428	t
5590	6	1054		707	93	t
5591	7	501		707	306	t
5592	8	395		707	353	f
5593	9	362		707	7	f
5594	10	668		707	31	f
5595	11	479		707	316	f
5596	1	314		708	370	f
5597	1	359		709	138	f
5598	2	200		709	86	f
5599	3	490		709	203	f
5600	4	420		709	94	f
5601	5	365		709	50	f
5602	6	444		709	393	f
5603	7	199	4 beats	709	22	f
5604	8	404		709	365	f
5605	1	598		710	372	f
5606	2	444		710	284	f
5607	3	465		710	293	f
5608	4	169		710	264	t
5609	5	448		710	425	t
5610	6	430		710	59	t
5611	7	37		710	425	t
5612	8	45		710	469	t
5613	9	440		710	93	t
5614	10	610		710	306	t
5615	11	45		710	460	t
5616	12	305		710	367	t
5617	13	110	ascending riff	710	423	t
5618	14	193		710	308	t
5619	15	542		710	31	t
5620	16	217		710	13	f
5621	17	181		710	426	f
5622	1	0		711	190	f
5623	1	232		712	345	f
5624	2	551		712	228	f
5625	3	242		712	50	f
5626	4	510	Afterwards, Weir says, Weir "I want to thank the Oakland A's for making this afternoon possible...by losing."	712	329	f
5627	5	495		712	206	f
5628	6	410		712	355	f
5629	7	276		712	241	f
5630	8	720		712	286	f
5631	9	195		712	196	t
5632	10	283		712	321	f
5633	11	684		712	318	f
5634	1	272		713	281	t
5635	2	715		713	248	t
5636	3	48		713	281	f
5637	4	336		713	139	t
5638	5	197		713	300	t
5639	6	129		713	428	t
5640	7	210		713	93	t
5641	8	435		713	284	f
5642	9	34		713	428	t
5643	10	374		713	300	t
5644	11	763		713	113	f
5645	12	280		713	257	f
5646	1	358		714	370	f
5647	1	243		715	345	f
5648	2	416		715	355	f
5649	3	247		715	50	f
5650	4	498		715	262	f
5651	5	318		715	28	f
5652	6	478		715	270	f
5653	7	472		715	206	f
5654	8	325		715	79	f
5655	9	252		715	99	f
5656	10	531		715	329	f
5657	11	355		715	341	f
5658	12	572		715	286	f
5659	1	267		716	241	f
5660	2	600		716	228	f
5661	3	418		716	284	f
5662	4	383		716	293	f
5663	5	594		716	72	t
5664	6	175		716	428	t
5665	7	532	a jam near the end worth denotiing	716	394	t
5666	8	392		716	72	f
5667	9	430		716	13	f
5668	1	229		717	183	f
5669	1	362		718	138	f
5670	2	405		718	24	f
5671	3	442		718	348	f
5672	4	346		718	262	f
5673	5	353		718	267	f
5674	6	358		718	41	f
5675	7	411		718	207	f
5676	8	408		718	50	f
5677	9	337		718	49	f
5678	1	720		719	104	f
5679	2	692		719	101	t
5680	3	407		719	66	f
5681	4	635		719	67	t
5682	5	696		719	93	t
5683	6	610		719	306	t
5684	7	263		719	353	t
5685	8	350		719	7	t
5686	9	588		719	77	f
5687	10	282		719	257	f
5688	1	159		720	151	f
5689	1	342		721	168	f
5690	2	337		721	178	f
5691	3	472		721	278	f
5692	4	430		721	267	f
5693	5	628		721	29	f
5694	6	356		721	138	f
5695	1	310		722	39	f
5696	2	365		722	376	f
5697	3	594		722	111	f
5698	4	454		722	217	t
5699	5	486		722	93	t
5700	6	354		722	306	t
5701	7	244		722	156	t
5702	8	0		722	80	t
5703	9	124		722	414	f
5704	10	345		722	30	f
5705	11	535		722	316	f
5706	1	271		723	340	f
5707	1	268		724	125	f
5708	2	392		724	108	f
5709	3	435		724	113	f
5710	4	343		724	381	f
5711	5	406		724	23	f
5712	6	534		724	315	f
5713	7	323		724	94	f
5714	8	328		724	178	f
5715	1	375	Prior to song Weir says, "so on the count of 3 everyone say Happy Birthday, Brentski. 1..2..3!"	725	383	f
5716	2	362		725	376	f
5717	3	693		725	111	f
5718	4	456		725	217	t
5719	5	534		725	93	t
5720	6	347		725	306	t
5721	7	35		725	460	t
5722	8	242		725	159	f
5723	9	317		725	121	t
5724	10	61		725	435	f
5725	11	330		725	7	t
5726	12	512		725	312	t
5727	13	480		725	316	f
5728	1	309		726	40	f
5729	1	370		727	138	f
5730	2	759		727	318	f
5731	3	332		727	381	f
5732	4	530		727	114	f
5733	5	311		727	223	t
5734	6	363		727	71	f
5735	7	303	starts with a False Start - off key 00:21	727	396	f
5736	8	741		727	29	f
5737	1	675		728	286	t
5738	2	784		728	110	f
5739	3	0		728	101	t
5740	4	0		728	134	t
5741	5	246		728	344	t
5742	6	609	with Babatunde Olatunji and Sikiru Adepoju on percussion	728	93	t
5743	7	514	with Babatunde Olatunji and Sikiru Adepoju on percussion	728	428	t
5744	8	83		728	344	t
5745	9	621		728	306	t
5746	10	367		728	343	t
5747	11	556		728	394	t
5748	12	463		728	13	f
5749	1	291		729	340	f
5750	1	364		730	140	f
5751	2	584		730	108	f
5752	3	374		730	177	f
5753	4	452		730	348	f
5754	5	386		730	197	f
5755	6	321		730	99	f
5756	7	566		730	244	f
5757	8	310		730	345	f
5758	1	656		731	286	t
5759	2	1073		731	110	f
5760	3	167		731	264	t
5761	4	162		731	425	t
5762	5	246		731	428	t
5763	6	452	First Verse Only	731	74	t
5764	7	167	Garcia continually plays the opening of Comes A Time	731	428	t
5765	8	305		731	93	t
5767	10	551		731	306	t
5771	14	0		731	316	f
5772	1	0		732	202	f
5766	9	305		731	482	t
5797	1	397		736	138	f
5768	11	451		731	429	t
5769	12	0		731	156	t
5770	13	0		731	312	t
5773	1	444		733	108	f
5774	2	468		733	355	f
5775	3	469		733	203	f
5776	4	196		733	86	f
5777	5	333		733	50	f
5778	6	231		733	27	f
5779	7	416		733	341	f
5780	8	175		733	88	f
5781	1	112		734	70	t
5782	2	443		734	343	t
5783	3	124		734	70	f
5784	4	583		734	104	t
5785	5	65		734	460	t
5786	6	364		734	89	t
5787	7	453		734	93	t
5788	8	0		734	449	f
5789	9	0	add 27 sseconds	734	306	f
5790	10	281		734	246	t
5791	11	300		734	367	t
5792	12	72	ascending riff	734	423	t
5793	13	164		734	303	t
5794	14	388		734	66	t
5795	15	379		734	368	f
5796	1	475		735	175	f
5798	2	382		736	64	f
5799	3	529		736	203	f
5800	4	491	w/ Bruce Hornsby	736	329	f
5801	5	561		736	315	f
5802	6	535		736	359	f
5803	7	743		736	198	f
5804	1	606		737	134	f
5805	2	548		737	206	f
5806	3	758		737	330	t
5807	4	563		737	93	t
5808	5	464		737	306	t
5809	6	64	Brent Solo Piano	737	460	t
5810	7	255		737	159	f
5811	8	159		737	460	t
5812	9	473		737	343	t
5813	10	662		737	394	t
5814	11	582		737	357	f
5815	12	0		737	123	f
5816	1	346		738	370	f
5817	1	0		739	140	f
5818	2	182	21 beat false start: Weir says, "wait a minute. We got to teach our drummer how to count til 20." 5 beat	739	22	f
5819	3	392		739	208	f
5820	4	388		739	33	f
5821	5	321		739	355	f
5822	6	342		739	71	f
5823	7	260		739	99	f
5824	8	188		739	405	f
5825	9	77		739	391	t
5826	10	267		739	390	t
5827	11	616		739	198	f
5828	1	168		740	264	t
5829	2	424		740	425	t
5830	3	467		740	228	t
5831	4	288		740	28	t
5832	5	450		740	428	t
5833	6	134		740	426	f
5834	7	779		740	134	t
5835	8	302		740	367	t
5836	9	277	ascending riff	740	423	t
5837	10	0		740	394	t
5838	11	562		740	316	f
5839	12	460		740	121	t
5840	13	83		740	435	t
5841	14	281		740	257	f
5842	1	333		741	143	f
5843	2	641		741	84	f
5844	3	486		741	329	f
5845	4	530		741	203	f
5846	5	286		741	71	f
5847	6	385		741	174	f
5848	7	301		741	39	f
5849	8	200		741	88	f
5850	1	379	Anymore - 8 times	742	24	f
5851	2	439		742	217	f
5852	3	468		742	293	f
5853	4	691		742	101	t
5854	5	650		742	93	t
5855	6	414		742	306	t
5856	7	274	'a fuckin' shame' get back truckin' on 12 times	742	367	t
5857	8	68		742	423	t
5858	9	511		742	31	t
5859	10	503		742	316	f
5860	1	315		743	40	f
5861	1	341		744	6	t
5862	2	269		744	183	f
5863	3	386		744	240	f
5864	4	398		744	355	f
5865	5	320		744	267	f
5866	6	276		744	397	f
5867	7	366		744	50	f
5868	8	206		744	88	f
5869	1	365	Weir says, "And now from our album, 'A Touch of Grey - the hit single."	745	365	f
5870	2	604	Thunder clap effects	745	206	f
5871	3	315		745	367	t
5872	4	74		745	423	t
5873	5	712		745	134	t
5874	6	70		745	428	t
5875	7	518		745	93	t
5876	8	322		745	306	t
5877	9	453	no bass intro	745	343	t
5878	10	528		745	312	t
5879	11	297		745	123	f
5880	12	309		745	80	t
5881	13	87		745	414	f
5882	1	297		746	370	f
5883	1	265		747	125	f
5884	2	501		747	113	f
5885	3	282		747	396	f
5886	4	266		747	177	f
5887	5	418		747	381	f
5888	6	411		747	145	f
5889	7	407		747	50	f
5890	8	191		747	88	f
5891	1	500		748	286	t
5892	2	562		748	110	f
5893	3	696		748	101	t
5894	4	528		748	104	t
5895	5	576		748	93	t
5896	6	389		748	306	t
5897	7	31		748	460	t
5898	8	280		748	353	t
5899	9	325		748	119	t
5900	10	616		748	394	t
5901	11	366		748	7	f
5902	1	345		749	370	f
5903	1	390	Anymore 9 times	750	24	t
5904	2	225		750	129	f
5905	3	409		750	355	f
5906	4	480		750	174	f
5907	5	301		750	42	f
5908	6	403		750	138	f
5909	7	470		750	270	f
5910	8	510		750	341	f
5911	9	258		750	224	f
5912	1	201		751	57	t
5913	2	218		751	424	t
5914	3	312		751	155	f
5915	4	379		751	209	t
5916	5	383		751	280	t
5917	6	379		751	428	t
5918	7	512		751	93	t
5919	8	450	with drums for 1:14	751	306	t
5920	9	516		751	104	t
5921	10	40	aborted	751	31	t
5922	11	58		751	460	t
5923	12	316	get back truckin on 7 times	751	367	t
5924	13	103	Spoonful quotes included	751	423	t
5925	14	515		751	31	t
5926	15	675		751	316	f
5927	1	297		752	370	f
5928	1	328		753	370	f
5929	2	200		753	345	f
5930	3	286		753	42	f
5931	4	198		753	223	f
5932	5	466		753	329	f
5933	6	392		753	33	f
5934	7	365		753	286	f
5935	8	194	7 beats	753	22	f
5936	9	276		753	171	f
5937	10	254		753	99	f
5938	11	282		753	79	f
5939	12	228		753	57	t
5940	13	185		753	424	t
5941	14	107		753	438	t
5942	15	323		753	155	f
5943	16	80		753	391	t
5944	17	262		753	390	t
5945	18	570		753	198	f
5946	1	167		754	264	t
5947	2	573	At the 4:49 mark Phil cues an improv	754	425	t
5948	3	556	At the 5:40 mark Phil cues the PITB jam	754	372	t
5949	4	751		754	232	t
5950	5	387		754	372	t
5951	6	188		754	426	f
5952	7	344		754	293	f
5953	8	304		754	28	f
5954	9	382		754	270	f
5955	10	163		754	222	f
5956	11	364		754	24	f
5957	12	295		754	13	f
5958	13	564		754	394	t
5959	14	517		754	316	f
5960	1	459		755	49	f
5961	2	287		755	257	f
5962	1	376		756	138	f
5963	2	943		756	289	f
5964	3	384		756	383	f
5965	4	530		756	114	f
5966	5	316		756	396	f
5967	6	301		756	42	f
5968	7	774		756	198	f
5969	1	743		757	111	t
5970	2	481		757	206	f
5971	3	506		757	69	t
5972	4	68	Hornsby plays Dark Star	757	428	t
5973	5	160		757	264	t
5974	6	311	Hornsby plays Dark Star	757	425	t
5975	7	804		757	330	t
5976	8	356	Hornsby & Welnick play Dark Star	757	428	t
5977	9	735		757	93	t
5978	10	533		757	306	t
5979	11	383		757	75	t
5980	12	52		757	428	t
5981	13	117		757	425	t
5982	14	129		757	426	t
5983	15	612		757	31	f
5984	16	306		757	257	f
5985	1	338		758	352	f
5986	1	0		759	318	f
5987	2	0		759	241	f
5988	3	0		759	270	f
5989	4	0		759	206	f
5990	5	0		759	208	f
5991	6	0		759	99	f
5992	7	0		759	286	f
5993	8	0		759	341	f
5994	1	463		760	284	f
5995	2	408		760	171	f
5996	3	168		760	264	t
5997	4	678		760	425	t
5998	5	217		760	93	t
5999	6	326		760	353	t
6000	7	311		760	428	t
6001	8	261		760	123	t
6002	9	226		760	428	t
6003	10	509		760	66	t
6004	11	86		760	428	t
6005	12	466		760	72	t
6006	13	86	Weir plays his China Cat riff	760	428	t
6007	14	402		760	248	t
6008	15	86		760	428	t
6009	16	40		760	93	t
6010	17	106		760	428	t
6011	18	241		760	72	f
6012	19	424		760	13	f
6013	1	304		761	178	f
6014	2	636		761	318	f
6015	3	307		761	99	f
6016	4	620		761	29	f
6017	5	306		761	50	f
6018	6	416		761	48	f
6019	7	405		761	241	f
6020	8	496		761	9	f
6021	9	236		761	345	f
6022	1	702		762	286	t
6023	2	567		762	110	f
6024	3	723		762	101	t
6025	4	706		762	330	t
6026	5	511		762	93	t
6027	6	207		762	306	t
6028	7	447		762	248	t
6029	8	498		762	312	t
6030	9	229		762	13	t
6031	10	456		762	123	f
6032	1	266		763	257	f
6033	1	332		764	241	f
6034	2	227		764	86	f
6035	3	489		764	206	f
6036	4	427		764	355	f
6037	5	358		764	28	t
6038	6	256		764	99	f
6039	7	296		764	42	f
6040	8	716		764	198	f
6041	1	465		765	284	f
6042	2	246		765	319	f
6043	3	697		765	330	t
6044	4	170		765	264	t
6045	5	311		765	428	t
6046	6	449		765	429	t
6047	7	107		765	457	t
6048	8	209		765	428	t
6049	9	548		765	281	t
6050	10	546		765	248	t
6051	11	215		765	442	t
6052	12	106		765	425	t
6054	1	283		766	261	f
6053	13	176		765	426	f
6055	1	0		767	228	f
6056	2	0		767	113	f
6057	3	0		767	241	f
6058	4	0		767	270	f
6059	5	0		767	364	f
6060	6	0		767	39	f
6061	7	0		767	50	f
6062	8	0		767	6	f
6063	9	0		767	345	f
6066	3	0		768	155	f
6067	4	0		768	217	f
6068	5	0		768	30	f
6065	2	0		768	424	t
6069	6	0		768	156	f
6070	7	0		768	71	f
6071	8	0		768	93	f
6072	9	0		768	306	f
6073	10	0		768	343	f
6074	11	0		768	394	f
6075	12	0		768	248	f
6076	1	0		769	40	f
6064	1	0		768	57	t
6077	1	534		770	228	f
6078	2	217		770	223	f
6079	3	359		770	28	f
6080	4	420		770	48	f
6081	5	437		770	174	f
6082	6	315		770	42	f
6083	7	211	18 Beats	770	22	f
6084	8	529		770	114	f
6085	9	212		770	196	t
6086	10	368		770	321	f
6087	1	402	Anymore 10 times	771	24	t
6088	2	357		771	123	f
6089	3	231		771	319	f
6090	4	799		771	72	t
6091	5	172		771	457	t
6092	6	221		771	93	t
6093	7	352	Close Encounters @ 5:23	771	428	t
6094	8	100		771	442	t
6095	9	338		771	428	t
6096	10	728		771	394	t
6097	11	319	Get Back Truckin' On - 7 Times	771	367	t
6098	12	214		771	423	t
6099	13	481		771	13	f
6100	1	566		772	316	f
6101	1	380		773	168	f
6102	2	537		773	203	f
6103	3	300		773	42	f
6104	4	256		773	396	f
6105	5	680		773	29	f
6106	6	403		773	341	f
6107	1	271		774	397	f
6108	2	446		774	217	f
6109	3	460		774	293	f
6110	4	576		774	372	t
6111	5	118	Garcia scale riff.	774	428	t
6112	6	457		774	93	t
6113	7	577		774	306	t
6114	8	459	No bass Intro. Weir voice has sound effects. Sings first verse without drums.	774	343	t
6115	9	490		774	312	t
6116	10	546		774	357	t
6117	11	453		774	248	f
6118	1	47		775	248	t
6119	2	300		775	40	f
6120	1	414		776	138	f
6121	2	302		776	177	f
6122	3	332		776	45	t
6123	4	267		776	172	f
6124	5	253	18 beat false start	776	22	f
6125	6	458		776	393	f
6126	7	306		776	396	f
6127	8	368		776	309	f
6128	9	282		776	183	f
6129	1	527		777	79	f
6130	2	519		777	284	f
6131	3	538		777	228	f
6132	4	507		777	108	t
6133	5	1000		777	93	t
6134	6	629		777	306	t
6135	7	513	Weir started Throwing Stones	777	59	f
6136	8	316		777	121	t
6137	9	63		777	435	t
6138	10	526		777	357	t
6139	11	457		777	248	f
6140	1	337		778	40	f
6141	1	386		779	24	t
6142	2	333		779	123	f
6143	3	349		779	42	f
6144	4	251		779	99	f
6145	5	496		779	329	f
6146	6	226		779	319	f
6147	7	310		779	241	f
6148	8	488		779	114	f
6149	9	299		779	261	f
6150	10	380		779	79	f
6151	1	654		780	284	f
6152	2	766		780	286	t
6153	3	982		780	110	f
6154	4	311		780	367	t
6155	5	234	ascending riff	780	423	t
6156	6	128		780	93	t
6157	7	464		780	343	t
6158	8	39		780	428	t
6159	9	42		780	455	t
6160	10	538		780	394	t
6161	11	492		780	13	f
6162	1	311		781	370	f
6163	1	478		782	108	f
6164	2	470		782	113	f
6165	3	298		782	39	f
6166	4	521	Weir says, "Of course now, we're gonna welcome back Bruce." And Jerry added, "We don't let just anybody sit in on the accordion!"	782	318	f
6167	5	544	Lesh says "Ladies and Gentleman, Bruce Hornsby on the accordion!" Weir says, "Say 'thank you Bruce'".	782	315	f
6168	6	414		782	393	f
6169	7	369		782	50	t
6170	8	452		782	79	f
6171	1	381		783	376	f
6172	2	408		783	35	f
6173	3	421		783	111	t
6174	4	714		783	330	t
6175	5	612		783	93	t
6176	6	412		783	306	t
6177	7	67		783	460	t
6178	8	357	Weir sings first verse with sparse drums	783	343	t
6179	9	552		783	394	t
6180	10	565		783	357	t
6181	11	381		783	248	f
6182	1	517		784	191	f
6183	1	200		785	345	f
6184	2	477		785	318	f
6185	3	200		785	223	f
6186	4	260		785	86	f
6187	5	409		785	33	f
6188	6	418		785	48	f
6189	7	296		785	178	f
6190	8	233		785	27	f
6191	9	308		785	28	f
6192	10	855		785	140	f
6193	11	262		785	99	f
6194	12	386		785	270	f
6195	13	168		785	264	t
6196	14	917		785	425	t
6197	15	165		785	426	f
6198	1	448		786	228	t
6199	2	348		786	221	f
6200	3	565		786	278	f
6201	4	90		786	391	t
6202	5	304		786	390	t
6203	6	555		786	198	f
6204	7	643		786	134	t
6205	8	311		786	367	t
6206	9	119	ascending riff	786	423	t
6207	10	658		786	246	t
6208	11	67		786	457	t
6210	13	36		786	457	t
6211	14	461		786	428	t
6212	15	115		786	343	t
6213	16	372		786	306	t
6214	17	526		786	312	t
6215	18	334		786	13	f
6216	1	433		787	49	f
6209	12	215		786	483	t
6217	1	388	effects on Weir's voice.	788	138	f
6218	2	507		788	318	f
6219	3	484	Brent takes a verse	788	203	f
6220	4	466		788	114	f
6221	5	410		788	267	f
6222	6	457		788	329	f
6223	7	416		788	50	f
6224	8	197		788	88	f
6225	1	328		789	376	t
6226	2	527		789	286	t
6228	4	619		789	93	f
6229	5	638		789	306	t
6230	6	407	effects on Weir's voice	789	343	t
6231	7	231		789	156	t
6232	8	426		789	372	t
6233	9	651		789	232	f
6234	1	301		790	257	f
6227	3	572	Lyric flub "Drown in your troubles and get to the store."	789	110	t
6235	1	391		791	365	f
6236	2	454		791	241	f
6237	3	596		791	278	f
6238	4	516		791	174	f
6239	5	317		791	42	f
6240	6	306		791	396	f
6241	7	581		791	29	f
6242	8	277		791	345	f
6243	1	200		792	57	t
6244	2	175		792	424	t
6245	3	338		792	155	f
6246	4	470		792	280	f
6247	5	574		792	134	t
6248	6	61	a very familiar riff.	792	428	t
6249	7	506		792	93	t
6250	8	382		792	306	t
6251	9	294		792	121	t
6252	10	66		792	435	t
6253	11	361		792	80	t
6254	12	229		792	414	f
6255	1	364		793	30	f
6256	1	299		794	6	t
6257	2	236		794	129	f
6258	3	497		794	114	f
6259	4	464		794	203	f
6260	5	321		794	27	f
6261	6	173		794	222	t
6262	7	266		794	223	f
6263	8	478		794	9	f
6264	9	472		794	206	f
6265	10	234		794	224	f
6266	1	540		795	286	f
6267	2	352		795	365	f
6268	3	593		795	101	t
6269	4	626	Garcia scale riff	795	104	t
6270	5	607	with Jerry	795	93	t
6271	6	440		795	306	t
6272	7	144		795	460	t
6273	8	422		795	343	t
6274	9	536		795	394	t
6275	10	231		795	13	f
6276	11	238		795	183	f
6277	1	274		796	370	f
6278	1	406		797	6	t
6279	2	236		797	345	f
6280	3	326		797	42	f
6281	4	292		797	50	f
6282	5	723		797	278	f
6283	6	432		797	241	f
6284	7	442		797	48	f
6285	8	213		797	196	t
6286	9	339		797	321	f
6287	10	338		797	79	f
6288	1	864		798	289	t
6289	2	441		798	284	f
6290	3	430		798	145	f
6291	4	214		798	97	f
6292	5	827		798	330	t
6293	6	408		798	209	t
6294	7	345		798	280	t
6295	8	328	Garcia scale riff	798	428	t
6296	9	120	redefine	798	461	t
6297	10	321		798	93	t
6298	11	273		798	306	t
6299	12	122	Garcia scale riff	798	428	t
6300	13	708		798	31	f
6301	14	258		798	156	t
6302	15	377	Anymore - 16 times	798	24	t
6303	16	437		798	123	f
6304	1	205	  Before encore, “Hey everybody, I think what we just heard tonight was the Grateful Dead in St. Louis They know they are on their way home and they are very, very happy about it. They’ve been playing encores all along this tour and they probably do another one tonight. So if we let them know to come back. They’ll come back I’m sure of that.”	799	88	f
6305	1	368		800	224	f
6306	2	154		800	215	f
6307	3	528		800	278	f
6308	4	351		800	174	f
6309	5	415		800	208	f
6310	6	305		800	241	f
6311	7	369		800	24	f
6312	8	198		800	196	t
6313	9	337		800	321	f
6314	10	623		800	318	f
6315	11	245		800	345	f
6316	1	623		801	104	t
6317	2	365		801	341	f
6318	3	397		801	171	f
6319	4	413		801	284	f
6320	5	837		801	134	t
6321	6	75		801	428	t
6322	7	321		801	93	t
6323	8	791		801	343	t
6324	9	46		801	460	t
6325	10	534		801	66	t
6326	11	95		801	428	t
6327	12	750		801	113	t
6328	13	518		801	316	f
6329	1	338		802	64	f
6330	2	270		802	50	f
6331	3	528		802	286	f
6332	4	309		802	341	f
6333	5	658		802	69	f
6334	6	331		802	28	f
6335	7	385		802	355	f
6336	8	465		802	206	f
6337	9	437		802	293	f
6338	10	194		802	345	f
6339	1	0		803	281	t
6340	2	367		803	428	t
6341	3	87		803	281	f
6342	4	887		803	104	t
6343	5	165		803	428	t
6344	6	411		803	198	t
6345	7	51		803	93	t
6346	8	143		803	198	f
6347	9	280		803	42	f
6348	10	170		803	196	t
6349	11	251		803	321	f
6350	12	529		803	145	f
6351	13	355		803	284	f
6352	14	419		803	171	f
6353	15	748		803	72	t
6354	16	652		803	394	t
6355	17	387		803	13	f
6356	1	563		804	113	f
6357	1	315		805	139	t
6358	2	413		805	300	f
6359	3	383	with Mathew Kelly on Harmonica	805	341	f
6360	4	389		805	355	f
6361	5	194	10 beats; with Mathew Kelly on Harmonica	805	22	f
6362	6	455		805	113	f
6363	7	288		805	28	f
6364	8	353		805	171	f
6365	9	288	Get Back Truckin' On: 3 times with scream on 4th measure.	805	367	t
6366	10	225		805	423	t
6367	11	335		805	428	t
6368	12	351		805	93	t
6370	14	595	First Verse Only	805	248	t
6371	15	386		805	121	t
6372	16	68		805	435	f
6373	17	307		805	257	f
6374	1	720		806	289	f
6375	2	450		806	241	f
6376	3	465		806	355	f
6377	4	319		806	50	f
6378	5	418		806	208	f
6379	6	425		806	238	f
6380	7	491		806	79	f
6381	1	206		807	57	t
6382	2	153		807	424	t
6383	3	338		807	155	t
6384	4	468	At end of song Weir says, "Done Already"	807	284	f
6385	5	688	Weir says, "You people are gonna get real flat and bugged eyed real quick."	807	134	t
6386	6	330	Whistle Blowing opening; Get Back Truckin' On:  7 times Weir quips, "That's true" after 'sometimes I can barley see"	807	367	t
6387	7	148	Garcia does scale riff	807	423	t
6388	8	85		807	447	t
6389	9	140		807	93	t
6390	10	405		807	306	t
6391	11	86		807	460	t
6392	12	462		807	357	t
6393	13	587		807	394	t
6394	14	494	At end of song Weir says, "And I mean it."	807	123	f
6395	1	297		808	370	f
6369	13	405		805	484	t
6396	1	199		809	345	f
6397	2	548		809	318	f
6398	3	264		809	50	f
6399	4	447		809	355	f
6400	5	308		809	341	f
6401	6	280		809	42	f
6402	7	213		809	196	t
6403	8	174		809	321	f
6404	9	529		809	278	f
6405	10	340		809	28	f
6406	11	410		809	227	f
6407	12	531		809	206	f
6408	13	335		809	224	f
6409	1	372		810	284	f
6410	2	254		810	139	t
6411	3	449		810	300	t
6412	4	624		810	113	f
6413	5	386		810	198	t
6414	6	58		810	93	t
6415	7	188		810	198	f
6416	8	474		810	114	f
6417	9	166		810	264	t
6418	10	112		810	425	t
6419	11	166		810	428	t
6420	12	175		810	430	t
6421	13	104		810	429	t
6422	14	73		810	428	t
6423	15	54		810	429	t
6424	16	78		810	432	t
6425	17	51		810	460	t
6426	18	662		810	72	f
6427	19	331		810	370	f
6428	1	356		811	365	f
6429	2	446		811	203	f
6430	3	423		811	9	f
6431	4	176		811	222	t
6432	5	296		811	28	f
6433	6	295		811	168	f
6434	7	286		811	364	f
6435	8	373		811	108	f
6436	9	189		811	88	f
6437	1	286		812	39	f
6438	2	422		812	217	f
6439	3	429		812	293	f
6440	4	309		812	367	t
6441	5	77	ascending riff	812	423	t
6442	6	206		812	428	t
6443	7	576		812	93	t
6444	8	72		812	452	t
6445	9	247		812	430	t
6446	10	245		812	460	t
6447	11	298		812	343	t
6448	12	502		812	312	t
6449	13	469		812	357	t
6450	14	283		812	368	f
6451	1	294		813	370	f
6452	1	377		814	178	f
6453	2	427		814	318	f
6454	3	353		814	381	f
6455	4	298		814	6	f
6456	5	166		814	222	t
6457	6	341		814	28	f
6458	7	189		814	88	f
6459	1	206		815	57	t
6460	2	190		815	424	t
6461	3	320		815	155	f
6462	4	499		815	284	f
6463	5	383	 an embarrassment.	815	167	f
6464	6	422		815	244	t
6465	7	834		815	101	t
6466	8	729		815	93	t
6467	9	1238		815	306	t
6468	10	358		815	156	t
6469	11	276		815	14	f
6470	12	267		815	183	f
6471	1	404		816	175	f
6472	1	384		817	64	f
6473	2	487		817	45	f
6474	3	372		817	48	f
6475	4	187	9 Beats	817	22	f
6476	5	308		817	309	f
6477	6	177		817	222	t
6478	7	356		817	28	f
6479	8	303		817	262	f
6480	9	706		817	198	f
6481	1	553		818	286	t
6482	2	600		818	110	f
6483	3	646		818	101	t
6484	4	661		818	104	t
6485	5	461		818	93	t
6486	6	340		818	306	t
6487	7	268		818	119	t
6488	8	540		818	394	t
6489	9	509		818	316	f
6490	1	0	Garcia botched opening. They restarted it again. 	819	40	f
6491	1	551		820	108	f
6492	2	510		820	114	f
6493	3	522		820	45	f
6494	4	688		820	29	f
6495	5	393		820	138	f
6496	6	465		820	393	f
6497	7	365		820	50	f
6498	8	395		820	270	f
6499	9	729		820	198	f
6500	1	204		821	57	t
6501	2	256		821	424	t
6502	3	295		821	155	f
6503	4	428		821	284	f
6504	5	715		821	330	t
6505	6	452		821	428	t
6506	7	305	Jerry & Bob left the stage	821	89	t
6507	8	133		821	479	t
6508	9	351		821	93	t
6509	10	971		821	306	t
6510	11	285		821	367	t
6511	12	73	ascending riff	821	423	t
6512	13	60		821	459	t
6513	14	466		821	312	t
6514	15	508		821	316	f
6515	1	251		822	190	f
6516	1	984		823	318	f
6517	2	544		823	203	f
6518	3	542		823	114	f
6519	4	330		823	238	f
6520	5	747		823	29	f
6521	6	378		823	138	f
6522	7	635		823	79	f
6523	1	372		824	365	f
6524	2	537		824	284	f
6525	3	539		824	359	f
6526	4	432		824	217	f
6527	5	765		824	330	t
6528	6	594		824	93	f
6529	7	105		824	475	t
6530	8	381		824	455	t
6531	9	162		824	460	t
6532	10	422		824	353	t
6533	11	278		824	156	t
6534	12	388		824	121	t
6535	13	55		824	435	t
6536	14	473	Brent plays La Bamba at the start	824	123	f
6537	1	304		825	272	f
6538	1	410		826	241	f
6539	2	572	Mack The Knife played during technical difficulties. "We will work that up for next time."	826	29	f
6540	3	528		826	203	f
6541	4	394		826	355	f
6542	5	312		826	50	f
6543	6	491		826	329	f
6544	7	756	Garcia scale riff	826	198	f
6545	8	196		826	88	f
6546	1	329		827	217	f
6547	2	345		827	171	f
6548	3	662	Garcia scale riff	827	101	t
6550	5	406		827	93	t
6551	6	328	w/ drums	827	306	t
6552	7	106		827	460	t
6553	8	417		827	343	t
6554	9	601		827	394	t
6555	10	504		827	316	f
6556	1	259		828	224	f
6549	4	836		827	104	t
6557	1	375		829	138	f
6558	2	185		829	86	f
6559	3	462		829	241	f
6560	4	372		829	94	f
6561	5	281		829	238	f
6562	6	304		829	42	f
6563	7	477		829	206	f
6564	8	280		829	224	f
6565	1	417		830	284	f
6566	2	471		830	64	f
6567	3	160		830	264	t
6568	4	429	Garcia scale riff	830	425	t
6570	6	335		830	59	t
6571	7	58		830	425	t
6572	8	599		830	93	t
6573	9	328		830	306	t
6574	10	679	Phil goes into Playing In The Band.	830	330	t
6569	5	238		830	428	t
6575	11	516	Weir has effects on vocals.	830	357	t
6576	12	138		830	248	t
6577	13	310		830	368	t
6578	14	228		830	248	f
6579	1	321		831	40	f
6580	1	682		832	140	f
6581	2	176		832	222	f
6582	3	383		832	270	f
6583	4	467		832	206	f
6584	5	180		832	223	f
6585	6	319		832	355	f
6586	7	249		832	99	f
6587	8	552		832	278	f
6588	9	299		832	178	f
6589	10	207		832	57	t
6590	11	216	great, great transition into FG Jam	832	424	t
6591	12	101		832	438	t
6592	13	321		832	155	f
6593	14	175		832	264	t
6594	15	578		832	425	t
6595	16	271		832	428	t
6596	17	179		832	426	f
6597	1	470		833	228	f
6598	2	277		833	28	f
6599	3	65		833	460	t
6600	4	318		833	75	t
6601	5	401		833	428	t
6602	6	185		833	437	t
6603	7	165	First verse only	833	74	t
6604	8	105		833	428	t
6605	9	123		833	430	t
6606	10	330		833	428	t
6607	11	474		833	312	t
6608	12	488		833	104	t
6609	13	481		833	436	t
6610	14	79		833	460	t
6611	15	85		833	391	t
6612	16	274		833	390	t
6613	17	569		833	198	f
6614	18	421		833	121	t
6615	19	82		833	435	t
6616	20	232		833	183	f
6617	1	305		834	257	f
6618	1	0		835	125	f
6619	2	352		835	178	f
6620	3	264		835	177	f
6621	4	348		835	381	f
6622	5	460		835	114	f
6623	6	354		835	33	f
6624	7	462		835	329	f
6625	8	313		835	396	f
6626	9	382		835	64	f
6627	10	304		835	345	f
6628	1	840		836	286	t
6629	2	854		836	110	f
6630	3	692		836	101	t
6631	4	595		836	134	t
6632	5	776		836	93	t
6633	6	516		836	306	t
6634	7	293		836	59	t
6635	8	284		836	353	t
6636	9	599		836	357	t
6637	10	437		836	248	f
6638	1	0		837	352	f
6639	1	808		838	289	f
6640	2	461		838	241	f
6641	3	203		838	86	f
6642	4	345		838	50	f
6643	5	519		838	9	f
6644	6	319		838	99	f
6645	7	286		838	177	f
6646	8	206		838	196	t
6647	9	441		838	321	f
6648	10	195		838	88	f
6649	11	265		838	345	f
6650	1	467		839	270	f
6651	2	174		839	264	t
6652	3	369		839	425	t
6653	4	184		839	428	t
6654	5	45		839	460	t
6655	6	329		839	59	t
6656	7	198		839	428	t
6657	8	756		839	93	t
6658	9	62		839	452	t
6659	10	384		839	306	t
6660	11	232		839	425	t
6661	12	139		839	426	t
6662	13	366		839	353	t
6663	14	62		839	428	t
6664	15	238		839	13	t
6665	16	278		839	183	f
6666	1	0		840	370	f
6667	1	312		841	24	f
6668	2	194		841	223	f
6669	3	445		841	278	f
6670	4	204	8 Beats	841	22	f
6671	5	467		841	286	f
6672	6	372		841	33	f
6673	7	246	Afterwards Weir says, "Thank you. And now for our next number we're going to do a tune on death and destruction. 	841	318	f
6674	8	242		841	99	f
6675	9	304		841	171	f
6676	10	302		841	178	f
6677	11	204		841	57	t
6678	12	329		841	424	t
6679	13	92		841	438	t
6680	14	277		841	155	f
6681	15	254		841	13	f
6682	1	320		842	370	f
6683	2	172		842	346	f
6684	3	762		842	104	t
6685	4	330		842	436	t
6686	5	116		842	460	t
6687	6	320		842	28	f
6688	7	169		842	264	t
6689	8	295		842	425	t
6690	9	64		842	429	t
6691	10	264		842	428	t
6692	11	118		842	452	t
6693	12	330		842	429	t
6694	13	38		842	306	t
6695	14	215		842	428	t
6697	1	475		843	329	f
6698	2	168		843	222	f
6699	3	332		843	79	f
6700	4	309		843	129	f
6701	5	357		843	293	f
6702	6	305		843	367	t
6703	7	134	ascending riff	843	423	t
6704	8	209		843	246	t
6705	9	416	Garcia puts on a distortion pedal	843	428	t
6706	10	188		843	437	t
6707	11	576		843	394	t
6708	12	400		843	121	t
6709	13	70		843	435	f
6710	1	418	Phil says, "Thanks a billion, folks! See you next year!"	844	49	f
6696	15	101		842	426	f
6711	1	586	Jerry loses the lyrics & compensates with extra solo sections.	845	49	f
6712	2	280		845	178	f
6713	3	226		845	319	f
6714	4	314		845	42	f
6715	5	249		845	99	f
6716	6	308		845	94	f
6717	7	725		845	198	f
6718	8	396		845	79	f
6719	1	391		846	284	f
6720	2	537		846	286	t
6721	3	705		846	110	f
6722	4	177		846	264	t
6723	5	260		846	425	t
6724	6	113	with Phil - Re Label	846	452	t
6725	7	358		846	93	t
6726	8	316		846	353	t
6727	9	338	Get Back Truckin' On: 7 times	846	367	t
6728	10	195		846	423	t
6729	11	441		846	343	t
6730	12	652		846	394	t
6731	13	530		846	316	f
6732	1	249		847	183	f
6733	1	1		848	228	f
6734	2	1		848	178	f
6735	3	1		848	262	f
6736	4	1		848	99	f
6737	5	1		848	355	f
6738	6	1		848	28	f
6739	7	1		848	94	f
6740	8	1		848	198	f
6741	9	1		848	79	f
6742	1	1		849	284	f
6743	2	1		849	319	f
6744	3	448		849	270	f
6745	4	220		849	261	f
6746	5	892		849	330	t
6747	6	164		849	264	t
6748	7	479		849	425	t
6749	8	290		849	93	t
6750	9	433	sloppy transition	849	168	t
6751	10	296		849	353	t
6752	11	36		849	460	t
6753	12	811		849	394	t
6754	13	573		849	316	f
6755	1	291		850	257	f
6756	1	367		851	138	f
6757	2	435		851	113	f
6758	3	393		851	241	f
6759	4	422		851	208	f
6760	5	284		851	238	f
6761	6	554		851	29	f
6762	1	92		852	306	t
6763	2	408		852	168	f
6764	3	491		852	206	f
6765	4	391		852	79	t
6766	5	565		852	93	t
6767	6	612		852	306	t
6768	7	289		852	119	f
6769	8	277		852	7	t
6770	9	272		852	353	t
6771	10	284		852	343	t
6772	11	523		852	394	t
6773	12	477		852	316	f
6774	1	275		853	257	f
6775	1	359		854	49	f
6776	2	452		854	108	f
6777	3	480		854	9	f
6778	4	368		854	50	f
6779	5	478		854	329	f
6780	6	392		854	206	f
6781	7	287		854	224	f
6782	1	212		855	57	t
6783	2	233		855	424	t
6784	3	337		855	155	f
6785	4	390	Weir says, "Same old story and it's sad but true but if you don't know it I got news for you."	855	217	f
6786	5	722		855	134	t
6787	6	316		855	428	t
6788	7	589		855	93	t
6789	8	601		855	306	t
6790	9	487		855	89	t
6791	10	47		855	460	t
6792	11	311		855	367	t
6793	12	81	ascending riff	855	423	t
6794	13	53		855	428	t
6795	14	204		855	383	t
6796	15	553		855	312	t
6797	16	224		855	13	f
6798	17	448		855	123	f
6799	1	254		856	190	f
6800	1	265		857	241	f
6801	2	418		857	208	f
6802	3	269		857	99	f
6803	4	380		857	270	f
6804	5	463		857	101	f
6805	6	487		857	262	f
6806	7	281		857	123	f
6807	8	513		857	228	f
6808	9	384		857	341	f
6809	10	768		857	286	f
6810	1	399		858	284	f
6811	2	500		858	281	t
6812	3	543		858	248	t
6813	4	267		858	93	f
6814	5	594		858	330	t
6815	6	812		858	232	t
6816	7	553		858	316	f
6817	1	251		859	183	f
6818	1	696		860	289	f
6819	2	345		860	118	f
6820	3	346		860	262	f
6821	4	330		860	381	f
6822	5	361		860	171	f
6823	6	346		860	174	f
6824	7	631		860	278	f
6825	8	276		860	238	f
6826	9	643		860	29	f
6827	10	323		860	178	f
6828	1	266		861	397	f
6829	2	422		861	284	f
6830	3	359		861	30	f
6831	4	640		861	134	t
6832	5	429		861	308	t
6833	6	582		861	93	t
6834	7	96		861	428	t
6835	8	439		861	104	t
6836	9	605		861	31	t
6837	10	276		861	13	f
6838	11	544		861	316	f
6839	1	314		862	370	f
6840	1	384		863	168	f
6841	2	491		863	45	f
6842	3	184		863	86	f
6843	4	341		863	50	f
6844	5	412		863	270	f
6845	6	175		863	222	t
6846	7	275		863	223	f
6847	8	175		863	57	t
6848	9	142		863	424	t
6849	10	287		863	155	f
6850	1	428		864	284	f
6851	2	778		864	134	t
6852	3	286		864	308	t
6853	4	685		864	104	t
6854	5	314		864	121	t
6855	6	64		864	428	t
6856	7	743		864	93	t
6857	8	600	with drums	864	306	t
6858	9	301		864	59	t
6859	10	348		864	16	t
6860	11	500		864	316	f
6861	1	259		865	190	f
6862	1	0		866	345	f
6863	2	615		866	228	f
6864	3	465		866	206	f
6865	4	366		866	79	f
6866	5	262		866	99	f
6867	6	467		866	329	f
6868	7	458		866	101	f
6869	8	465		866	262	f
6870	9	0		866	264	t
6871	10	0		866	425	t
6872	11	0		866	428	t
6873	12	0		866	426	f
6874	1	467		867	286	t
6875	2	733		867	110	f
6876	3	363		867	284	f
6877	4	421		867	171	f
6878	5	504		867	72	t
6879	6	204		867	127	t
6880	7	366		867	72	t
6881	8	375		867	353	t
6882	9	703		867	330	f
6883	1	0		868	345	f
6884	2	0		868	355	f
6885	3	293		868	241	f
6886	4	560		868	278	f
6887	5	258		868	99	f
6888	6	533		868	329	f
6889	7	378		868	174	f
6890	8	323		868	42	f
6891	9	446		868	198	t
6892	10	42		868	93	t
6893	11	287		868	198	t
6894	12	354		868	224	f
6895	1	492		869	341	f
6896	2	416		869	48	f
6897	3	455		869	284	f
6898	4	410		869	171	f
6899	5	329		869	28	f
6900	6	0		869	114	f
6901	7	547		869	72	t
6902	8	87		869	428	t
6903	9	243		869	93	t
6904	10	562		869	343	t
6905	11	63		869	428	t
6906	12	660		869	312	t
6907	13	45		869	460	t
6908	14	135		869	343	t
6909	15	607		869	316	f
6910	1	386		870	24	f
6911	2	218		870	129	f
6912	3	520		870	9	f
6913	4	353		870	267	f
6914	5	495		870	270	f
6915	6	358		870	263	f
6916	7	340		870	262	f
6917	8	421		870	50	f
6918	9	545		870	244	f
6919	1	224		871	57	t
6920	2	234		871	424	t
6921	3	368		871	155	f
6922	4	318		871	367	t
6923	5	170	ascending riff	871	423	t
6924	6	507		871	69	t
6925	7	763		871	428	t
6926	8	848		871	93	t
6927	9	486		871	306	t
6928	10	30		871	460	t
6929	11	315		871	353	t
6930	12	454		871	7	t
6931	13	580		871	31	t
6932	14	556		871	316	f
6933	1	309		872	370	f
6934	1	277		873	345	f
6935	2	436		873	270	f
6936	3	190		873	222	t
6937	4	371		873	28	f
6938	5	545		873	114	f
6939	6	316	no 'flight of the seabird'	873	50	f
6940	7	322		873	42	f
6941	8	312		873	261	f
6942	9	463		873	171	f
6943	10	511		873	341	f
6944	1	761		874	286	t
6945	2	667		874	110	t
6946	3	407		874	123	f
6947	4	635		874	330	t
6948	5	815		874	93	t
6949	6	401		874	306	t
6950	7	679		874	248	t
6951	8	707		874	31	t
6952	9	506		874	13	f
6953	1	445		875	392	f
6954	1	450		876	228	t
6955	2	299		876	171	t
6956	3	274		876	178	f
6957	4	189	7 beats	876	22	f
6958	5	274		876	79	f
6959	6	189		876	223	f
6960	7	467		876	329	f
6961	8	305		876	221	f
6962	9	290		876	207	f
6963	10	245		876	99	f
6964	11	417		876	318	f
6965	12	307		876	13	f
6966	1	353		877	316	f
6967	2	528		877	286	f
6968	3	290		877	28	f
6969	4	460		877	359	f
6970	5	158		877	222	f
6971	6	478		877	278	f
6972	7	76		877	391	t
6973	8	249		877	390	t
6974	9	477		877	198	t
6975	10	93		877	428	t
6976	11	36		877	429	t
6977	12	150		877	430	t
6978	13	96		877	431	t
6979	14	305		877	437	t
6980	15	185		877	75	t
6981	16	470		877	428	t
6982	17	288		877	431	t
6983	18	142		877	428	t
6984	19	142		877	460	t
6985	20	343		877	370	f
6986	21	180		877	345	t
6987	22	452		877	121	t
6988	23	47		877	435	t
6989	24	213	Afterwards Phil says, "OK,OK,OK,OK, now if y'all just shut up a second we'll play a quiet thing. Tender. Meaningful. Sympathetic. Heavy duty ballad in the key of b flat."	877	320	f
6990	1	376		878	293	f
6991	1	361		879	24	f
6992	2	280		879	178	f
6993	3	372		879	208	f
6994	4	460		879	206	f
6995	5	265		879	79	f
6996	6	198		879	223	f
6997	7	475		879	329	f
6998	8	256		879	99	f
6999	9	336		879	40	f
7000	10	192	9 beats	879	22	f
7001	11	516		879	278	f
7002	12	87		879	391	t
7003	13	302		879	390	t
7004	14	604		879	198	f
7005	1	169		880	264	t
7006	2	565		880	425	t
7007	3	569		880	372	t
7008	4	744		880	232	t
7009	5	110		880	372	t
7010	6	291		880	425	t
7011	7	151		880	426	f
7012	8	264		880	28	f
7013	9	482		880	312	f
7014	10	308		880	367	t
7015	11	145	ascending riff	880	423	t
7016	12	283		880	428	t
7017	13	523		880	394	t
7018	14	563		880	316	f
7019	1	298		881	257	f
7020	2	410		881	49	f
7021	1	404	"...now we play for Clive."	882	178	f
7022	2	334		882	177	f
7023	3	300	'Flight of Seabirds" not sung	882	50	f
7024	4	711	Awful Bob Weir slide playing	882	278	f
7025	5	154		882	215	t
7026	6	280		882	223	f
7027	7	513	Awful Bob Weir slide playing	882	309	f
7028	8	312		882	261	f
7029	9	424		882	79	f
7030	1	410		883	156	t
7031	2	709		883	289	f
7032	3	222		883	115	f
7033	4	862		883	330	t
7034	5	168		883	264	t
7035	6	620	Garcia scale riff	883	425	t
7036	7	270	Garcia scale riff	883	306	t
7037	8	479		883	93	t
7038	9	480		883	428	t
7039	10	172		883	425	t
7040	11	190		883	426	f
7041	12	348		883	49	f
7042	1	250	Dedicated to Chuck Berry	884	183	f
7043	1	493		885	108	f
7044	2	386		885	262	f
7045	3	483		885	45	f
7046	4	623		885	29	f
7047	5	385		885	138	f
7048	6	332		885	27	f
7049	1	478		886	284	f
7050	2	740		886	330	t
7051	3	333	'ever since she went and had a sex change' Get Back Truckin' On - 11 times	886	367	t
7052	4	113		886	423	t
7053	5	261		886	303	t
7054	6	121		886	428	t
7055	7	369	after 3:57 Jerry continues on with just drums.	886	437	t
7056	8	487		886	93	t
7057	9	523		886	306	t
7058	10	52		886	460	t
7059	11	579		886	312	t
7060	12	303		886	121	t
7061	13	228		886	13	f
7062	14	238		886	183	f
7063	1	261		887	190	f
7064	1	436		888	228	f
7065	2	437		888	241	f
7066	3	356		888	309	f
7067	4	477		888	174	f
7068	5	483		888	114	f
7069	6	361	garcia scale riff	888	50	f
7070	7	261		888	27	f
7071	8	537		888	206	f
7072	9	259		888	224	f
7073	1	211		889	57	t
7074	2	149		889	424	t
7075	3	317		889	155	t
7076	4	445		889	284	f
7077	5	575		889	134	t
7078	6	270		889	308	f
7079	7	295		889	240	f
7080	8	475		889	93	t
7081	9	382		889	306	t
7082	10	262		889	353	t
7083	11	553		889	357	t
7084	12	349		889	248	f
7085	1	449		890	175	f
7086	1	192		891	57	t
7087	2	146		891	424	t
7088	3	315		891	155	f
7089	4	475		891	241	f
7090	5	353		891	94	f
7091	6	188		891	222	t
7092	7	290		891	223	f
7093	8	577		891	29	f
7094	9	377		891	341	f
7095	10	260		891	224	f
7096	1	238		892	93	t
7097	2	704		892	168	f
7098	3	465	garcia scale riff	892	104	t
7099	4	497		892	93	t
7100	5	324		892	306	t
7101	6	72		892	460	t
7102	7	331	Get Back Truckin' On - 7 times	892	367	t
7103	8	85		892	423	t
7104	9	437		892	312	t
7105	10	490		892	248	f
7106	1	141		893	248	t
7107	2	349		893	141	t
7108	3	334		893	121	t
7109	4	33	absolute train wreck.	893	10	f
7110	1	177		894	345	t
7111	2	364		894	24	f
7112	3	334		894	129	f
7113	4	435		894	318	f
7114	5	417		894	33	f
7115	6	482		894	359	f
7116	7	251		894	99	f
7117	8	383		894	270	f
7118	9	338		894	221	f
7119	10	226		894	57	t
7120	11	227		894	424	t
7121	12	110		894	438	t
7122	13	326		894	155	f
7123	14	175		894	222	f
7124	15	442		894	207	f
7125	16	81		894	391	t
7126	17	258		894	390	t
7127	18	529		894	198	f
7128	1	471		895	228	f
7129	2	322		895	28	f
7130	3	298		895	75	t
7131	4	624		895	428	t
7132	5	172	First Verse Only	895	74	t
7133	6	298		895	430	t
7134	7	193		895	428	t
7135	8	246		895	429	t
7136	9	35		895	428	t
7137	10	229		895	437	t
7138	11	35		895	460	t
7139	12	690		895	104	t
7140	13	126		895	436	t
7141	14	340		895	59	f
7142	15	590		895	316	f
7143	1	424		896	372	f
7144	2	234		896	183	f
7145	3	183		896	10	f
7146	1	923		897	124	f
7147	2	680		897	74	t
7148	3	214		897	281	t
7149	4	888		897	336	t
7150	5	527		897	81	f
7151	6	110		897	70	t
7152	7	12		897	93	t
7153	8	300		897	343	t
7154	9	516		897	70	t
7155	10	856		897	243	t
7156	11	980		897	368	f
7157	1	406	At the 6:46 moment, the power was shut off. 	898	232	f
7158	1	267		899	345	f
7160	2	245		899	86	f
7163	3	287	'flight of the seabirds..' not sung	899	50	f
7165	4	405		899	48	f
7167	5	262		899	99	f
7169	6	434		899	355	f
7171	7	310		899	261	f
7178	8	317		899	42	f
7181	9	215		899	196	t
7184	10	328		899	321	f
7189	1	418	anymore - 12 times	903	24	t
7192	2	380		903	123	f
7195	3	451		903	293	f
7198	4	730		903	101	t
7201	5	749		903	104	t
7204	6	977		903	93	t
7207	7	223	with drums	903	430	t
7210	8	658		903	248	t
7214	9	596		903	312	t
7216	10	539		903	13	f
7219	1	434		906	392	f
7221	1	671		908	228	f
7222	2	325	'flight of the sea birds..' not sung.	908	50	f
7223	3	415		908	355	f
7224	4	510		908	206	f
7225	5	381		908	171	f
7226	6	177		908	222	t
7227	7	361		908	28	f
7228	8	321		908	42	f
7229	9	1036		908	198	f
7230	1	601		909	284	f
7231	2	430		909	293	f
7232	3	807		909	101	t
7233	4	743		909	104	t
7234	5	226	more a less an extended Eyes fade out with Phil & bobby eventually falling away leaving Garcia	909	469	t
7235	6	740		909	93	t
7236	7	929		909	248	t
7237	8	404		909	121	t
7238	9	76		909	435	t
7239	10	493		909	13	f
7240	1	310		910	370	f
7241	1	369		911	64	f
7242	2	337		911	28	f
7243	3	332		911	24	f
7244	4	260		911	50	f
7245	5	515		911	329	f
7246	6	337		911	241	f
7247	7	432		911	48	f
7248	8	394		911	174	f
7249	9	502		911	114	f
7250	10	701		911	198	t
7251	11	391		911	121	t
7252	12	131		911	435	f
7253	1	170		912	264	t
7254	2	472		912	425	t
7255	3	343		912	353	t
7256	4	133		912	428	t
7257	5	431		912	284	t
7258	6	316		912	425	t
7259	7	23		912	460	t
7260	8	470		912	66	t
7261	9	311		912	93	t
7262	10	482		912	104	t
7263	11	319		912	428	t
7264	12	538		912	72	t
7265	13	106		912	425	t
7266	14	162		912	426	t
7267	1	267		913	183	f
7268	1	343		914	224	f
7269	2	268		914	99	f
7270	3	423		914	270	f
7271	4	277		914	50	f
7272	5	437		914	355	f
7273	6	214		914	196	t
7274	7	248		914	321	f
7275	8	457		914	171	f
7276	9	482		914	101	f
7277	10	496		914	329	f
7278	11	232		914	319	f
7279	12	388		914	284	f
7280	1	705		915	72	t
7281	2	296		915	42	f
7282	3	182		915	264	t
7283	4	467		915	425	t
7284	5	439		915	93	t
7285	6	448		915	343	t
7286	7	709		915	66	t
7287	8	251		915	425	t
7288	9	191		915	426	f
7289	1	351		916	40	f
7290	1	374		917	138	f
7291	2	632		917	318	f
7292	3	370		917	381	f
7293	4	404		917	48	f
7294	5	248		917	396	f
7295	6	597		917	29	f
7296	1	716		918	289	f
7297	2	418		918	217	f
7298	3	786		918	330	t
7299	4	498		918	93	t
7300	5	480		918	306	t
7301	6	300		918	121	t
7302	7	66		918	435	f
7303	8	291		918	7	t
7304	9	0		918	232	f
7305	10	257		918	123	t
7306	11	93		918	193	t
7307	12	153		918	123	f
7308	1	492		919	191	f
7309	1	365		920	138	f
7310	2	520		920	318	f
7311	3	355	Afterwards Weir says, "Now there's guy down there saying 'Let Mickey Sing' he's obviously never heard that. I mean, you can have it if you want it."	920	381	f
7312	4	478		920	329	f
7313	5	365		920	267	f
7314	6	696		920	29	f
7315	1	379		921	365	f
7316	2	364		921	143	f
7317	3	593		921	206	f
7318	4	699		921	101	t
7319	5	494		921	104	t
7320	6	220		921	159	f
7321	7	610		921	93	t
7322	8	457		921	306	t
7323	9	347		921	121	t
7324	10	69		921	435	t
7325	11	217		921	156	t
7326	12	333		921	80	t
7327	13	155		921	414	f
7328	1	426	opens with Vocals	922	248	f
7329	1	241		923	345	f
7330	2	1009		923	318	f
7331	3	267		923	50	f
7332	4	463		923	208	f
7333	5	306		923	241	f
7334	6	506		923	114	f
7335	7	225		923	319	f
7336	8	215		923	86	f
7337	9	497		923	341	f
7338	1	591		924	286	t
7339	2	559		924	110	f
7340	3	630		924	101	t
7341	4	92		924	430	t
7342	5	350		924	93	t
7343	6	424		924	343	t
7344	7	81		924	428	t
7345	8	353		924	123	f
7346	9	689		924	330	f
7347	10	797		924	31	t
7348	11	535		924	13	f
7349	1	354		925	370	f
7350	1	375		926	365	f
7351	2	450		926	241	f
7352	3	645		926	278	f
7353	4	258		926	223	t
7354	5	308		926	71	f
7355	6	774	Jerry uses Midi Flute 	926	29	f
7356	7	287		926	257	f
7357	1	552		927	111	f
7358	2	164		927	264	t
7359	3	214		927	425	t
7360	4	173		927	429	t
7361	5	514		927	69	t
7362	6	617		927	372	t
7363	7	185		927	426	t
7364	8	476		927	93	t
7365	9	817		927	306	t
7366	10	330		927	80	t
7367	11	151		927	414	f
7368	12	387		927	368	f
7369	1	455		928	191	f
7370	1	373	Lesh before show, "We were kinda hoping more of you would show up. I don't know. I heard there was a basketball game at the high school tonight so I can understand what's going on."	929	178	f
7371	2	253		929	86	f
7372	3	289		929	50	f
7373	4	440		929	355	f
7374	5	165		929	215	t
7375	6	205		929	222	f
7376	7	439		929	208	f
7377	8	460		929	206	f
7378	9	362		929	79	f
7379	10	747		929	198	f
7380	1	466		930	284	f
7381	2	484		930	48	f
7382	3	758		930	101	t
7383	4	903		930	104	t
7384	5	85		930	428	t
7386	7	910		930	248	t
7387	8	299	No encore. Phil tells audience their Soundman was arrested. 	930	257	f
7388	1	320		931	370	f
7389	2	188	22 Beat	931	22	f
7390	3	282		931	42	f
7391	4	205		931	223	f
7392	5	272		931	171	f
7393	6	413		931	33	f
7394	7	339		931	355	f
7395	8	308		931	28	f
7396	9	395		931	207	f
7397	10	273		931	99	f
7398	11	510		931	278	f
7399	12	176		931	264	t
7400	13	377		931	425	t
7401	14	154	Jerry plays the Slipknot! riff	931	428	t
7402	15	364		931	425	t
7403	16	156		931	426	f
7404	1	469		932	329	f
7405	2	178		932	222	f
7406	3	331		932	293	f
7407	4	183		932	346	f
7408	5	228		932	57	t
7409	6	240		932	424	t
7410	7	60		932	438	t
7411	8	324		932	155	f
7412	9	299		932	367	t
7413	10	154	ascending riff	932	423	t
7414	11	315		932	246	f
7415	12	364		932	121	f
7416	1	470		933	228	f
7417	2	217		933	345	f
7418	3	328		933	40	f
7419	4	280		933	178	f
7420	5	647		933	104	t
7421	6	124		933	436	t
7422	7	318		933	59	f
7423	8	572		933	394	t
7424	9	522		933	316	f
7425	1	386		934	372	f
7426	1	472		935	108	f
7427	2	479		935	113	f
7428	3	372	No fade out ending.	935	381	f
7429	4	291		935	397	f
7430	5	274		935	238	f
7431	6	366		935	171	f
7432	7	285		935	106	f
7433	8	714		935	198	f
7434	1	360		936	168	f
7435	2	413		936	280	f
7436	3	502		936	293	f
7437	4	416		936	372	t
7438	5	298		936	425	t
7439	6	636		936	93	t
7440	7	392		936	306	t
7441	8	45		936	460	t
7443	10	58		936	423	t
7444	11	236		936	308	t
7445	12	524		936	31	t
7446	13	232		936	13	t
7447	14	308		936	123	t
7448	15	86		936	193	t
7449	16	101		936	123	f
7450	1	411		937	191	f
7442	9	321	Get Back Truckin' On - 10 Times	936	367	t
7451	1	427		938	228	f
7452	2	458		938	108	f
7453	3	430		938	393	f
7454	4	441		938	241	f
7455	5	531		938	278	f
7456	6	320		938	39	f
7457	7	538		938	84	f
7458	8	207		938	88	f
7459	1	361		939	138	f
7460	2	576		939	286	t
7461	3	583		939	110	f
7462	4	453		939	217	t
7463	5	453		939	93	t
7464	6	475		939	306	t
7465	7	329		939	59	t
7466	8	164		939	264	t
7467	9	63		939	425	t
7468	10	531		939	357	t
7469	11	331		939	368	f
7470	1	322		940	248	f
7471	2	377		940	30	f
7472	1	517		941	108	f
7473	2	396		941	64	f
7474	3	158		941	215	t
7475	4	322		941	28	f
7476	5	424		941	393	f
7477	6	497		941	206	f
7478	7	289		941	42	f
7479	8	675		941	198	f
7480	1	275		942	189	f
7481	2	433		942	209	t
7482	3	382		942	280	t
7483	4	648		942	330	t
7484	5	76		942	469	t
7485	6	496		942	93	t
7486	7	332		942	306	t
7487	8	493		942	394	t
7488	9	536	NFA transiton aborted	942	357	t
7489	10	326		942	368	f
7490	1	295		943	40	f
7491	1	383		944	178	f
7492	2	243		944	86	f
7493	3	222		944	223	t
7494	4	156		944	215	f
7495	5	511		944	329	f
7496	6	490		944	174	f
7497	7	510		944	114	f
7498	8	308		944	261	f
7499	9	320		944	42	f
7500	10	497		944	341	f
7501	1	622		945	286	t
7502	2	570		945	110	f
7503	3	746		945	101	t
7504	4	701		945	134	t
7505	5	1090		945	93	t
7506	6	533		945	168	t
7507	7	475		945	343	t
7508	8	707		945	31	t
7509	9	492		945	13	f
7510	1	334	Lesh prior to encore, "Thank you. Actually we seem to have lost our drummers. Let's have a hand for our drummers, shall we?"	946	370	f
7385	6	274		930	429	t
7511	1	255		947	345	f
7512	2	429	anymore - 9 times	947	24	f
7513	3	177		947	222	f
7514	4	470		947	262	f
7515	5	317		947	178	f
7516	6	658		947	278	f
7517	7	218		947	196	t
7518	8	258		947	321	f
7519	9	391		947	79	f
7520	10	347		947	123	f
7521	11	472		947	293	f
7522	12	410		947	341	f
7523	1	341		948	224	f
7524	2	491		948	101	f
7525	3	792		948	318	f
7526	4	395		948	284	f
7527	5	460		948	114	f
7528	6	655		948	104	t
7530	8	643		948	394	t
7531	9	194		948	93	t
7532	10	729		948	248	t
7533	11	454		948	13	f
7534	1	539		949	372	f
7529	7	223		948	475	t
7535	1	283		950	139	t
7536	2	519		950	300	t
7537	3	950		950	113	f
7538	4	254		950	241	f
7539	5	459		950	329	f
7540	6	307		950	50	f
7541	7	438		950	355	f
7542	8	385		950	28	f
7543	9	436		950	208	f
7544	10	425		950	341	f
7545	1	413		951	284	f
7546	2	837		951	318	t
7547	3	265		951	99	f
7548	4	285		951	42	f
7549	5	518		951	101	f
7550	6	568		951	286	t
7551	7	432		951	121	t
7552	8	192		951	485	t
7553	9	61		951	93	t
7554	10	299		951	353	t
7555	11	613		951	394	t
7556	12	443		951	13	f
7557	1	505		952	372	f
7558	1	274		953	345	f
7559	2	211		953	86	f
7561	4	425		953	208	f
7562	5	269		953	99	f
7563	6	400		953	262	f
7564	7	215		953	97	f
7565	8	382		953	241	f
7566	9	485		953	9	f
7567	10	365		953	209	t
7568	11	350		953	280	t
7569	12	333		953	79	f
7570	1	819		954	289	f
7571	2	284		954	129	f
7572	3	449		954	293	f
7573	4	722	garcia scale riff	954	101	t
7574	5	821		954	104	t
7575	6	552		954	93	t
7576	7	808		954	248	t
7577	8	606		954	31	t
7578	9	476		954	13	f
7579	1	0		955	178	f
7580	2	0		955	329	f
7581	3	0		955	50	f
7582	4	0		955	278	f
7583	5	0		955	99	f
7584	6	0		955	97	f
7585	7	0		955	9	f
7586	8	0		955	108	f
7587	9	0		955	88	f
7588	1	0		956	289	f
7589	2	0		956	24	f
7590	3	0		956	264	f
7591	4	0		956	425	f
7592	5	0		956	330	f
7593	6	0		956	93	f
7594	7	0		956	306	f
7595	8	0		956	280	f
7596	9	0		956	31	f
7597	10	0		956	426	f
7598	11	0		956	123	f
7599	1	0		957	6	f
7600	1	374		958	138	f
7601	2	560		958	318	f
7602	3	302		958	99	f
7603	4	446		958	208	f
7604	5	535		958	203	f
7605	6	316		958	42	f
7606	7	329		958	50	f
7607	8	205		958	88	f
7608	1	468		959	286	t
7609	2	662		959	110	f
7610	3	475		959	206	f
7611	4	716		959	330	t
7612	5	521		959	93	t
7613	6	240		959	156	t
7614	7	458		959	312	t
7615	8	360		959	121	f
7616	9	236		959	183	f
7617	1	472		960	175	f
7618	1	613		961	113	f
7619	2	313		961	241	f
7620	3	594		961	278	f
7621	4	462		961	206	f
7622	5	519		961	114	f
7623	6	268		961	99	f
7624	7	401		961	48	f
7625	8	302		961	261	f
7626	9	411		961	79	f
7627	1	470		962	284	f
7628	2	434		962	293	f
7629	3	860		962	72	t
7630	4	917		962	93	t
7631	5	334	with drums	962	306	t
7632	6	99		962	428	t
7633	7	481		962	248	t
7634	8	564		962	31	t
7635	9	476		962	13	f
7636	1	385		963	392	f
7637	1	314	Weir, "This is gonna be a lot like work chasing this thing around tonight."	964	178	f
7638	2	383	Weir, "Ya'll having a safe and sane fourth out there?	964	94	f
7639	3	403		964	45	f
7640	4	488		964	329	f
7641	5	263		964	238	f
7642	6	335		964	365	f
7643	1	354		965	64	f
7644	2	582		965	110	f
7645	3	343		965	284	f
7646	4	261	Lesh says, "Welcome America! Welcome Austin, Texas! Welcome everyone to Farm Aid TV. Than adds, "Looks like we got a tune up."   Weir, "America is at its backbone is an agrarian nation. Let's keep it turning."	965	353	t
7647	5	216		965	156	t
7648	6	456		965	372	t
7649	7	517		965	93	t
7650	8	236		965	306	t
7651	9	321		965	119	t
7652	10	277		965	121	t
7653	11	37		965	435	t
7654	12	253		965	368	f
7655	1	272	Weir says, "Now we are going to do our little version of America's tune."	966	370	f
7656	1	473		967	108	f
7657	2	401		967	355	f
7658	3	282		967	99	f
7659	4	241		967	177	f
7660	5	175	11 beats.	967	22	f
7661	6	400		967	171	f
7662	7	468		967	45	f
7663	8	508		967	9	f
7664	9	459		967	206	f
7665	10	486		967	79	f
7666	1	277		968	217	f
7667	2	583		968	286	t
7668	3	544		968	110	f
7669	4	617		968	101	t
7670	5	640		968	330	t
7671	6	187		968	428	t
7672	7	374		968	93	f
7673	8	177		968	453	t
7674	9	366		968	248	f
7675	10	534		968	31	f
7676	11	532		968	316	f
7677	1	350		969	2	f
7678	1	357		970	270	f
7679	2	405		970	33	f
7680	3	452		970	228	f
7681	4	191	4 beats	970	22	f
7682	5	458		970	278	f
7683	6	307		970	178	f
7684	7	185		970	199	f
7685	8	355		970	71	f
7686	9	245		970	99	f
7687	10	468		970	359	f
7688	11	92		970	391	t
7689	12	242		970	390	t
7690	13	636		970	198	t
7691	14	320		970	59	f
7692	1	245		971	460	t
7693	2	357		971	293	f
7694	3	277		971	28	f
7695	4	557	Jerry opens with the opening riff from 'Loser'.	971	31	f
7696	5	306		971	13	f
7697	6	384		971	75	t
7698	7	706		971	428	t
7699	8	229		971	470	t
7700	9	471	Phil says, "The United States Blues" after song.	971	370	f
7701	10	471		971	372	f
7702	11	281		971	257	f
7703	1	376		972	49	f
7704	1	453		973	108	f
7705	2	406		973	64	f
7706	3	520		973	203	f
7707	4	504		973	9	f
7708	5	328		973	33	f
7709	6	454		973	329	f
7710	7	464	Descending 4 chord vamp end.	973	341	t
7711	8	0		973	224	f
7712	1	1216		974	104	t
7713	2	636		974	111	f
7714	3	741		974	101	t
7715	4	671		974	134	t
7716	5	69		974	344	t
7717	6	586		974	93	t
7718	7	269		974	306	t
7719	8	135		974	460	t
7720	9	597		974	343	t
7721	10	580		974	394	t
7722	11	510		974	316	f
7723	1	340		975	352	f
7724	1	552		976	228	t
7725	2	846		976	113	f
7726	3	184		976	222	t
7727	4	338		976	28	f
7728	5	408		976	171	f
7729	6	533	Weir says, "It isn't all that bad today because today is one of our equipment crew, Steve Parrish's birthday. So I want everybody on the count of three to say Happy Birthday Stevie."	976	206	f
7730	7	534		976	329	f
7731	8	200		976	196	t
7732	9	394		976	321	f
7733	1	425		977	284	f
7734	2	524		977	114	f
7735	3	875		977	72	t
7736	4	1065		977	93	t
7737	5	125	with Drums; Donna screaming into the mic. 	977	306	t
7738	6	657		977	330	t
7739	7	833	@ 8:15 band plays improved riff fro 41 seconds	977	248	t
7740	8	537		977	13	f
7741	1	426		978	392	f
7742	1	507		979	228	f
7743	2	420		979	240	f
7744	3	461		979	108	f
7745	4	446		979	114	f
7746	5	534		979	315	f
7747	6	475		979	359	f
7748	7	200		979	88	f
7749	1	296		980	39	f
7750	2	319		980	376	t
7751	3	541		980	111	f
7752	4	508		980	206	t
7753	5	689		980	330	t
7754	6	407		980	93	t
7755	7	350		980	306	t
7756	8	305		980	353	t
7757	9	290		980	119	f
7758	10	321		980	7	t
7759	11	632		980	232	f
7760	1	273	 'Happy Birthday' played before encore for Bobby	981	340	f
7761	1	416	anymore - 12 times	982	24	f
7762	2	230		982	129	f
7763	3	205		982	86	f
7764	4	512		982	203	f
7765	5	322		982	42	f
7766	6	302		982	50	f
7767	7	385		982	48	f
7768	8	329		982	99	f
7769	9	463		982	9	f
7770	10	408		982	241	f
7771	1	344		983	6	t
7772	2	250		983	345	f
7773	3	459		983	293	f
7774	4	0		983	209	t
7775	5	404		983	280	t
7776	6	316		983	428	t
7777	7	692		983	93	t
7778	8	328		983	306	t
7779	9	167		983	453	t
7780	10	141		983	460	t
7781	11	483		983	343	t
7782	12	601		983	312	t
7783	13	330		983	217	f
7784	14	227		983	183	f
7785	1	310		984	370	f
7786	1	932		985	318	f
7787	2	146		985	215	t
7788	3	270		985	223	f
7789	4	750		985	278	f
7790	5	471		985	174	f
7791	6	406		985	145	f
7792	7	513		985	341	f
7793	1	403		986	6	t
7794	2	295		986	129	f
7795	3	840		986	330	f
7796	4	162		986	264	t
7797	5	310		986	425	t
7798	6	288		986	428	t
7799	7	274		986	429	t
7800	8	456		986	93	t
7801	9	148		986	306	t
7802	10	572		986	372	f
7803	11	244		986	156	t
7804	12	391		986	24	t
7805	13	420		986	123	f
7806	1	294		987	49	f
7807	2	284		987	257	f
7808	1	615		988	318	f
7809	2	191	12 beats	988	22	f
7810	3	409		988	355	f
7811	4	459		988	206	f
7812	5	208		988	86	f
7813	6	467		988	174	f
7814	7	374		988	48	f
7815	8	207		988	196	t
7816	9	309		988	321	f
7817	1	324		989	79	f
7818	2	414		989	284	f
7819	3	436		989	293	f
7820	4	752		989	101	t
7821	5	591		989	104	t
7822	6	152		989	457	t
7823	7	476		989	93	t
7824	8	448	with Drums	989	306	t
7825	9	583		989	394	t
7826	10	307	Get Back Truckin' On 	989	367	t
7827	11	142		989	423	t
7828	12	443		989	168	t
7829	13	477		989	13	f
7830	1	239		990	345	f
7831	1	303		991	241	f
7832	2	302		991	79	f
7833	3	165		991	215	f
7834	4	407		991	355	f
7835	5	477		991	206	f
7836	6	539		991	262	f
7837	7	208		991	196	t
7838	8	206		991	321	f
7839	9	368		991	293	f
7840	10	466		991	101	f
7841	11	313		991	42	f
7842	12	379		991	341	f
7843	1	513		992	286	t
7844	2	651		992	110	f
7845	3	420	Weir, "We got a broken drum head so we're gonna have to change it."	992	284	f
7846	4	575		992	330	t
7847	5	169		992	264	f
7848	6	217		992	425	t
7849	7	176		992	428	t
7850	8	241		992	93	t
7851	9	636		992	394	t
7852	10	339		992	425	t
7853	11	257		992	426	f
7854	1	0	Lesh says prior to 'U.S. Blues', "Thanks a lot folks, it's nice to be back!"	993	370	f
7855	1	324		994	178	f
7856	2	650		994	318	f
7857	3	369		994	381	f
7858	4	417		994	208	f
7859	5	358		994	267	f
7860	6	881		994	29	f
7861	1	168		995	264	t
7862	2	306		995	425	t
7863	3	461		995	69	t
7864	4	440		995	284	f
7865	5	601		995	134	t
7866	6	218		995	428	t
7867	7	610		995	93	t
7868	8	684		995	306	t
7869	9	400		995	338	t
7870	10	620		995	31	t
7871	11	550		995	316	f
7872	1	385		996	191	f
7873	1	443		997	241	f
7874	2	611		997	318	f
7875	3	454		997	203	f
7876	4	490		997	329	f
7877	5	354		997	50	f
7878	6	418		997	208	f
7879	7	239		997	106	f
7880	8	525		997	206	f
7881	9	197		997	57	t
7882	10	147		997	424	t
7883	11	373		997	155	f
7884	1	160		998	264	t
7885	2	266		998	425	t
7886	3	533		998	69	t
7887	4	86		998	428	t
7888	5	53		998	460	t
7889	6	430		998	209	t
7890	7	420		998	280	t
7891	8	390		998	365	t
7892	9	47		998	460	t
7893	10	492		998	93	t
7894	11	60		998	449	t
7895	12	55		998	452	t
7896	13	225		998	306	t
7897	14	371		998	353	t
7898	15	475		998	357	t
7899	16	273		998	248	t
7900	17	493		998	31	t
7901	18	605		998	316	f
7902	1	376		999	2	f
7903	2	397		999	175	f
7904	1	325		1000	178	f
7905	2	384		1000	48	f
7906	3	180		1000	222	t
7907	4	323		1000	28	f
7908	5	487		1000	114	f
7909	6	288	"Flight of the seabirds..." not sung.	1000	50	f
7910	7	513		1000	329	f
7911	8	305		1000	261	f
7912	9	516		1000	262	f
7913	10	476		1000	341	f
7914	1	389		1001	64	f
7915	2	188	7 Beats. 	1001	22	f
7916	3	618		1001	286	t
7917	4	476		1001	110	f
7918	5	537		1001	72	t
7919	6	612		1001	93	t
7920	7	369	with drums	1001	306	t
7921	8	664		1001	248	t
7922	9	629		1001	31	t
7923	10	485		1001	13	f
7924	1	313		1002	370	f
7925	2	244		1002	183	f
7926	1	237		1003	94	t
7927	2	322		1003	234	t
7928	3	1334		1003	74	t
7929	4	126		1003	70	t
7930	5	496		1003	343	t
7931	6	391		1003	70	t
7932	7	400		1003	81	f
7933	1	409		1004	87	f
7934	2	354		1004	281	t
7936	4	370		1004	368	t
7937	5	82		1004	93	t
7938	6	847		1004	368	f
7935	3	1155		1004	336	t
7939	1	854		1005	318	f
7940	2	187		1005	222	t
7941	3	346		1005	28	f
7942	4	464		1005	262	f
7943	5	492		1005	206	f
7944	6	369		1005	309	f
7945	7	346		1005	241	f
7946	8	406		1005	48	f
7947	9	476		1005	341	f
7948	1	425	Anymore - 12 times	1006	24	t
7949	2	416		1006	123	f
7950	3	226	Donna is way off-key.	1006	115	f
7951	4	396		1006	293	f
7952	5	499		1006	284	f
7953	6	742		1006	330	t
7954	7	171		1006	264	t
7955	8	366		1006	425	t
7956	9	177		1006	469	t
7957	10	639	 with Lee Oskar on harmonica	1006	93	t
7958	11	64	need to retitle	1006	127	t
7959	12	182	includes a Got my mojo working vamp	1006	437	t
7960	13	708		1006	394	t
7961	14	320	Get Back Truckin' On 7 times	1006	367	t
7962	15	357		1006	423	t
7963	1	330		1007	156	f
7964	1	334		1008	178	f
7965	2	230		1008	86	f
7966	3	264		1008	50	f
7967	4	458		1008	262	f
7968	5	204		1008	223	t
7969	6	146		1008	215	f
7970	7	411		1008	355	f
7971	8	315		1008	241	f
7972	9	593		1008	286	t
7973	10	540		1008	110	f
7974	1	425		1009	284	f
7975	2	459		1009	293	f
7976	3	725		1009	101	t
7978	5	869		1009	93	t
7979	6	271		1009	306	t
7980	7	728		1009	168	t
7981	8	589		1009	316	f
7982	1	307		1010	370	f
7983	1	360		1011	138	f
7984	2	508		1011	318	f
7985	3	192		1011	222	t
7986	4	263		1011	223	f
7987	5	291		1011	42	f
7988	6	285		1011	396	f
7989	7	393		1011	270	f
7990	8	696		1011	198	f
7991	1	459		1012	286	t
7992	2	713		1012	110	f
7993	3	397		1012	284	f
7994	4	713		1012	330	t
7995	5	368		1012	93	t
7996	6	504		1012	306	t
7997	7	320	First 30 second Healy puts on effects over opening riff.	1012	121	t
7998	8	62		1012	435	t
7999	9	203		1012	156	t
8000	10	262		1012	80	t
8001	11	94		1012	414	t
8002	12	259	An complete & utter train wreck version.	1012	7	f
8003	1	494		1013	191	f
8004	1	397		1014	365	f
8005	2	487		1014	108	f
8006	3	460		1014	113	f
8007	4	529		1014	241	f
8008	5	549		1014	278	f
8009	6	623		1014	315	f
8010	7	254		1014	27	f
8011	8	336		1014	13	f
8012	1	332		1015	316	f
8013	2	522		1015	286	t
8014	3	629		1015	101	t
8015	4	538		1015	104	t
8016	5	423		1015	93	t
8017	6	325	Garcia scale riff	1015	306	t
8018	7	260		1015	353	t
8019	8	276		1015	119	t
8020	9	278		1015	7	t
8021	10	488		1015	31	t
8022	11	205		1015	320	f
8023	1	305		1016	39	f
8024	1	226		1017	125	f
8025	2	403		1017	108	f
8026	3	285		1017	43	f
8027	4	190		1017	222	f
8028	5	323		1017	71	f
8029	6	477		1017	174	f
8030	7	594		1017	278	f
8031	8	325		1017	396	f
8032	9	268		1017	397	f
8033	10	525		1017	341	f
8034	1	218		1018	57	t
8035	2	185		1018	424	t
8036	3	331		1018	155	f
8037	4	177		1018	264	t
8038	5	290		1018	425	t
8039	6	46		1018	428	t
8040	7	516		1018	372	t
8041	8	548		1018	311	t
8042	9	681		1018	93	t
8043	10	644		1018	306	t
8044	11	274		1018	353	t
8045	12	270		1018	119	t
8046	13	330		1018	121	t
8047	14	46		1018	435	t
8048	15	576		1018	248	f
8049	1	160		1019	10	f
8050	2	234		1019	183	f
8051	1	303		1020	6	f
8052	2	322		1020	381	f
8053	3	410		1020	305	f
8054	4	398		1020	96	f
8055	5	178		1020	88	f
8056	6	358		1020	371	f
8057	1	455		1021	284	f
8058	2	375		1021	388	f
8059	3	559		1021	69	t
8060	4	707		1021	67	t
8061	5	259		1021	219	t
8062	6	875		1021	93	t
8063	7	745		1021	306	t
8064	8	68		1021	460	t
8065	9	224		1021	156	t
8066	10	64		1021	460	t
8067	11	446		1021	312	t
8068	12	42		1021	460	t
8069	13	437		1021	248	f
8070	1	263		1022	40	f
8071	1	389		1023	365	f
8072	2	548		1023	203	f
8073	3	203		1023	86	f
8074	4	315		1023	106	f
8075	5	373		1023	267	f
8076	6	493		1023	329	f
8077	7	751		1023	198	f
8078	1	353		1024	376	f
8079	2	672		1024	111	f
8080	3	167		1024	264	t
8081	4	260		1024	425	t
8082	5	377		1024	59	t
8083	6	217		1024	426	t
8084	7	552		1024	93	t
8085	8	310		1024	306	t
8086	9	257		1024	353	t
8087	10	483		1024	31	t
8088	11	227		1024	13	t
8089	12	414		1024	123	f
8090	1	273		1025	340	f
8091	1	457		1026	108	f
8092	2	379		1026	262	f
8093	3	294		1026	99	f
8094	4	413		1026	270	f
8095	5	428		1026	45	f
8096	6	296		1026	42	f
8097	7	283		1026	261	f
8098	8	492		1026	9	f
8099	9	459		1026	341	t
8100	10	181		1026	88	f
8101	1	702		1027	286	t
8102	2	641		1027	110	f
8103	3	641		1027	101	t
8104	4	610		1027	104	t
8105	5	521		1027	93	t
8106	6	391		1027	306	t
8107	7	690		1027	372	t
8108	8	310	"she had her sex change." Get Back Truckin' on. 	1027	367	t
8109	9	76		1027	423	t
8110	10	119		1027	428	t
8111	11	76		1027	470	t
8112	12	116		1027	428	t
8113	13	312		1027	6	f
8114	14	253		1027	183	f
8115	1	305		1028	370	f
8116	1	647		1029	228	t
8117	2	733		1029	113	f
8118	3	159		1029	215	t
8119	4	269		1029	223	f
8120	5	435		1029	48	f
8121	6	210		1029	196	t
8122	7	407		1029	321	f
8123	8	423		1029	208	f
8124	9	286		1029	241	f
8125	10	175		1029	88	f
8126	11	315		1029	261	f
8127	1	256		1030	156	t
8128	2	377	Anymore 11 times	1030	24	t
8129	3	393		1030	123	f
8130	4	435		1030	293	f
8131	5	735		1030	101	t
8132	6	781	Garcia scale riff	1030	104	t
8133	7	581		1030	93	t
8134	8	228		1030	306	t
8135	9	55		1030	460	t
8136	10	295	Get Back Truckin' On - 7 Times	1030	367	t
8137	11	185		1030	423	t
8138	12	630		1030	312	t
8139	13	418		1030	13	f
8140	1	250		1031	345	f
8141	2	527		1031	329	f
8142	3	249		1031	99	f
8143	4	420		1031	262	f
8144	5	301		1031	178	f
8145	6	461		1031	114	f
8146	7	194		1031	196	t
8147	8	269		1031	321	f
8148	9	377		1031	48	f
8149	10	278		1031	241	f
8150	11	306		1031	42	f
8151	12	394		1031	341	f
8152	1	367		1032	284	f
8153	2	472		1032	293	f
8154	3	553		1032	101	t
8155	4	623		1032	104	t
8156	5	145		1032	93	t
8157	6	325		1032	123	f
8158	7	620		1032	330	f
8159	8	169		1032	264	t
8160	9	187		1032	425	t
8161	10	197		1032	428	t
8162	11	601		1032	113	t
8163	12	98		1032	425	t
8164	13	108		1032	306	t
8165	14	345		1032	59	t
8166	15	666		1032	248	t
8167	16	193		1032	425	t
8168	17	170		1032	426	f
8169	1	312		1033	257	f
8170	1	411		1034	365	f
8171	2	597		1034	108	f
8172	3	507		1034	114	f
8173	4	318		1034	396	f
8174	5	433		1034	9	f
8175	6	361		1034	50	f
8176	1	542		1035	168	t
8177	2	487		1035	67	t
8178	3	85		1035	428	t
8179	4	87		1035	460	t
8180	5	484		1035	343	t
8181	6	51		1035	460	t
8182	7	402		1035	388	t
8183	8	64		1035	344	t
8184	9	539		1035	348	t
8185	10	935		1035	93	t
8186	11	822		1035	306	t
8187	12	59		1035	460	t
8188	13	487		1035	387	t
8189	14	245		1035	343	t
8190	15	446		1035	305	f
8191	16	351		1035	368	f
8192	1	268		1036	340	f
8193	1	380		1037	365	f
8194	2	380		1037	381	f
8195	3	347		1037	184	f
8196	4	412		1037	48	f
8197	5	186		1037	222	t
8198	6	303		1037	28	f
8199	7	461		1037	9	f
8200	8	591		1037	376	f
8201	9	565		1037	359	f
8202	10	459		1037	341	f
8203	1	190		1038	57	t
8204	2	144		1038	424	t
8205	3	285		1038	155	t
8206	4	471		1038	293	f
8207	5	468		1038	217	t
8208	6	442		1038	93	t
8209	7	702		1038	306	t
8210	8	342		1038	80	t
8211	9	157		1038	414	t
8212	10	291	Get Back Truckin' On - 7 Times	1038	367	t
8213	11	130		1038	423	t
8214	12	621		1038	312	t
8215	13	501		1038	316	f
8216	1	447		1039	175	f
8217	1	257		1040	6	t
8218	2	243		1040	129	f
8219	3	434		1040	393	f
8220	4	477		1040	45	f
8221	5	294		1040	42	f
8222	6	180		1040	222	t
8223	7	275		1040	223	f
8224	8	305		1040	364	f
8225	9	381		1040	332	f
8226	10	461		1040	341	f
8227	1	679		1041	289	f
8228	2	560		1041	217	f
8229	3	765		1041	134	t
8230	4	547		1041	93	t
8231	5	311	lovely.	1041	455	t
8232	6	261		1041	353	t
8233	7	525		1041	303	t
8234	8	438		1041	312	t
8235	9	235		1041	13	f
8236	10	236		1041	183	f
8237	1	315	Weir, "I've just been informed that I gotta paint Billy's drum set. What color do you think it should be?"	1042	370	f
8238	1	420		1043	365	f
8239	2	502		1043	203	f
8240	3	407		1043	262	f
8241	4	180		1043	222	t
8242	5	275		1043	223	f
8243	6	281		1043	397	f
8244	7	440		1043	174	f
8245	8	592		1043	278	f
8246	9	660		1043	198	f
8247	1	349		1044	138	f
8248	2	522		1044	286	t
8249	3	660		1044	110	f
8250	4	372		1044	284	f
8251	5	397		1044	30	f
8252	6	548	Jerry leaves stage	1044	134	t
8253	7	146		1044	428	t
8254	8	500		1044	93	t
8255	9	51		1044	449	t
8256	10	292		1044	428	t
8257	11	140		1044	460	t
8258	12	189	Acapella arrangement 	1044	343	t
8259	13	756		1044	31	t
8260	14	258		1044	13	f
8261	15	449		1044	123	f
8262	1	192		1045	88	f
8263	1	856		1046	377	f
8264	2	233		1046	170	f
8265	3	145	11 Beats	1046	22	f
8266	4	388		1046	232	f
8267	5	627		1046	124	f
8268	6	85		1046	70	t
8269	7	230		1046	343	t
8270	8	363		1046	70	f
8271	9	650		1046	243	f
8272	10	202		1046	8	t
8273	11	38		1046	93	t
8274	12	440		1046	8	t
8275	13	1446		1046	51	f
7977	4	705	Lyric flub: "it's soft on the heels of the day."	1009	104	t
7560	3	306	Garcia scale riff	953	50	f
8276	1	176		1047	345	f
8277	2	278		1047	42	f
8278	3	328		1047	221	f
8279	4	320		1047	355	f
8280	5	403		1047	33	f
8281	6	240		1047	88	f
8282	7	198		1047	223	f
8283	8	511		1047	278	f
8284	9	183		1047	346	f
8285	10	203		1047	57	t
8286	11	161		1047	424	t
8287	12	99		1047	438	t
8288	13	307		1047	155	f
8289	14	167		1047	264	t
8290	15	913		1047	425	t
8291	16	152		1047	426	f
8292	1	638		1048	140	f
8293	2	169	Afterwards, Weir says, "Hey! Let's hear it for our new microphone."	1048	222	f
8294	3	455		1048	359	f
8295	4	286		1048	28	f
8296	5	449		1048	228	f
8297	6	306		1048	129	f
8298	7	360		1048	24	f
8299	8	80		1048	391	t
8300	9	270		1048	390	t
8301	10	606		1048	198	f
8302	11	682		1048	104	t
8303	12	320		1048	436	t
8304	13	322		1048	59	f
8305	14	292		1048	13	f
8306	15	397		1048	121	t
8307	16	83		1048	435	f
8308	17	253		1048	183	f
8309	1	0		1049	372	f
8310	1	178		1050	345	f
8311	2	0		1050	79	f
8312	3	0		1050	223	f
8313	4	393		1050	208	f
8314	5	278		1050	178	f
8315	6	206		1050	88	f
8316	7	272		1050	39	f
8317	8	199		1050	57	t
8318	9	229		1050	424	t
8319	10	308		1050	155	f
8320	11	415		1050	206	f
8321	12	405		1050	207	f
8322	13	178	7 Beats	1050	22	f
8323	14	448		1050	278	f
8324	15	246		1050	99	f
8325	16	213		1050	27	f
8326	17	174		1050	264	t
8327	18	720		1050	425	f
8328	19	132		1050	426	f
8329	1	318		1051	355	f
8330	2	253		1051	28	f
8331	3	468	Afterwards, Weir plays the Louie, Louie riff	1051	329	f
8332	4	292	Donna botched the lyrics	1051	129	f
8333	5	547		1051	75	t
8334	6	65		1051	429	t
8335	7	374		1051	428	t
8336	8	163	First Verse Only	1051	74	t
8337	9	283		1051	429	t
8338	10	95		1051	457	t
8339	11	840		1051	104	t
8340	12	308		1051	436	t
8341	13	433		1051	228	f
8342	14	170		1051	222	f
8343	15	394		1051	248	t
8344	16	395		1051	121	t
8345	17	78		1051	435	t
8346	18	169		1051	248	f
8347	1	0		1052	289	f
8348	2	184	13 Beats	1052	22	f
8349	3	229		1052	129	f
8350	4	490	Weir says, "If you see any of us disappear into showery sparks - don't be surprised."	1052	355	f
8351	5	146		1052	215	t
8352	6	281		1052	223	f
8353	7	271		1052	27	f
8354	8	188		1052	196	t
8355	9	365		1052	321	f
8356	10	438		1052	79	f
8357	1	459		1053	217	f
8358	2	453		1053	9	f
8359	3	622		1053	198	t
8360	4	754		1053	134	t
8361	5	125		1053	428	t
8362	6	303	Ever since she went and had a sex change. Get Back Truckin' On -8 times 	1053	367	t
8363	7	84		1053	423	t
8364	8	362		1053	428	t
8365	9	383		1053	93	t
8367	11	140		1053	470	t
8368	12	160		1053	428	t
8369	13	415		1053	248	t
8370	14	572		1053	31	t
8371	15	529		1053	316	f
8372	1	404		1054	175	f
8366	10	182		1053	306	t
8373	1	990		1055	289	f
8374	2	465		1055	241	f
8375	3	389		1055	262	f
8376	4	303		1055	178	t
8377	5	737		1055	29	f
8378	6	363		1055	138	f
8379	7	192		1055	88	f
8380	1	354	no 'Sunshine Daydream'	1056	316	f
8381	2	733		1056	286	t
8382	3	765		1056	110	f
8383	4	434		1056	217	t
8384	5	728		1056	93	t
8385	6	629		1056	306	t
8386	7	204		1056	470	t
8387	8	58		1056	460	t
8388	9	308		1056	353	t
8389	10	484		1056	357	t
8390	11	477		1056	368	f
8391	1	300		1057	119	t
8392	2	456		1057	372	t
8393	3	334		1057	13	t
8394	4	423		1057	175	f
8395	1	292		1058	28	f
8396	2	296		1058	42	f
8397	3	193	7 Beats	1058	22	f
8398	4	400		1058	286	f
8399	5	418		1058	33	f
8400	6	513		1058	278	f
8401	7	192		1058	223	f
8402	8	282		1058	79	f
8403	9	188		1058	346	f
8404	10	459		1058	228	f
8405	11	260		1058	99	f
8406	12	382		1058	293	f
8407	13	78		1058	391	t
8408	14	266		1058	390	t
8409	15	665		1058	198	t
8410	16	353		1058	171	f
8411	1	330		1059	370	f
8412	2	161		1059	222	f
8413	3	149		1059	428	t
8414	4	408		1059	57	t
8415	5	276		1059	424	t
8416	6	102		1059	438	t
8417	7	301		1059	155	f
8418	8	296		1059	367	t
8419	9	279		1059	423	t
8420	10	299		1059	428	t
8421	11	27		1059	429	t
8422	12	53		1059	483	t
8423	13	46		1059	344	t
8424	14	370		1059	470	t
8425	15	53		1059	428	t
8426	16	53		1059	429	t
8427	17	217		1059	428	t
8428	18	164		1059	442	t
8429	19	0	Weir plays Sage & Spirit	1059	460	t
8430	20	590		1059	394	t
8431	21	581		1059	316	f
8432	1	579		1060	104	t
8433	2	107		1060	436	f
\.


--
-- Name: shows_playedsong_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('shows_playedsong_id_seq', 8433, true);


--
-- Data for Name: shows_show; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY shows_show (id, "order", time_started, time_ended, date_id, venue_id) FROM stdin;
9	0	\N	\N	9	3
10	0	\N	\N	10	5
11	0	\N	\N	11	46
12	0	\N	\N	12	1
13	0	\N	\N	13	86
14	0	\N	\N	14	9
15	0	\N	\N	15	207
16	0	\N	\N	16	91
17	0	\N	\N	17	6
18	0	\N	\N	18	149
19	0	\N	\N	19	208
20	0	\N	\N	20	68
21	0	\N	\N	21	64
22	0	\N	\N	22	39
23	0	\N	\N	23	104
24	0	\N	\N	24	81
25	0	\N	\N	25	9
26	0	\N	\N	26	177
27	0	\N	\N	27	68
28	0	\N	\N	28	31
29	0	\N	\N	29	64
31	0	\N	\N	31	209
32	0	\N	\N	32	210
33	0	\N	\N	33	91
34	0	\N	\N	34	85
35	0	\N	\N	35	6
36	0	\N	\N	36	28
37	0	\N	\N	37	150
38	0	\N	\N	38	211
40	0	05:35:15	05:35:17	40	32
39	0	05:35:52	05:35:53	39	113
41	0	\N	\N	41	6
42	0	\N	\N	42	179
43	0	\N	\N	43	144
44	0	\N	\N	44	39
45	0	\N	\N	45	67
46	0	\N	\N	46	105
47	0	\N	\N	47	62
48	0	\N	\N	48	3
49	0	\N	\N	49	214
50	0	\N	\N	50	104
51	0	\N	\N	51	6
52	0	\N	\N	52	6
53	0	\N	\N	53	4
54	0	\N	\N	54	8
55	0	\N	\N	55	6
56	0	\N	\N	56	57
57	0	\N	\N	57	14
58	0	\N	\N	58	21
59	0	\N	\N	59	4
60	0	\N	\N	60	39
61	0	\N	\N	61	93
62	0	\N	\N	62	211
64	0	\N	\N	64	215
65	0	\N	\N	65	216
66	0	\N	\N	66	24
67	0	\N	\N	67	83
68	0	\N	\N	68	46
69	0	\N	\N	69	156
70	0	\N	\N	70	114
71	0	\N	\N	71	24
72	0	\N	\N	72	61
73	0	\N	\N	73	62
74	0	\N	\N	74	56
75	0	07:22:00	07:22:00	75	218
76	0	\N	\N	76	11
77	0	\N	\N	77	217
78	0	\N	\N	78	62
79	0	\N	\N	79	176
80	0	\N	\N	80	62
81	0	\N	\N	81	93
82	0	\N	\N	82	62
83	0	\N	\N	83	24
84	0	\N	\N	84	39
85	0	\N	\N	85	6
86	0	\N	\N	86	14
87	0	\N	\N	87	176
88	0	\N	\N	88	62
89	0	\N	\N	89	62
90	0	\N	\N	90	81
91	0	\N	\N	91	45
92	0	\N	\N	92	39
93	0	\N	\N	93	214
94	0	\N	\N	94	64
95	0	\N	\N	95	79
96	0	\N	\N	96	39
97	0	\N	\N	97	189
98	0	\N	\N	98	220
99	0	\N	\N	99	113
100	0	\N	\N	100	188
101	0	\N	\N	101	221
102	0	\N	\N	102	95
103	0	\N	\N	103	110
104	0	\N	\N	104	75
105	0	\N	\N	105	223
106	0	\N	\N	106	28
107	0	\N	\N	107	62
108	0	\N	\N	108	32
109	0	\N	\N	109	4
110	0	\N	\N	110	20
111	0	\N	\N	111	63
112	0	16:20:04	16:20:05	112	224
113	0	\N	\N	113	204
114	0	\N	\N	114	6
115	0	\N	\N	115	61
116	0	\N	\N	116	225
117	0	\N	\N	117	178
118	0	\N	\N	118	35
119	0	\N	\N	119	4
120	0	\N	\N	120	70
121	0	\N	\N	121	9
123	0	\N	\N	123	41
122	0	23:40:27	23:40:28	122	61
124	0	\N	\N	124	79
125	0	\N	\N	125	39
126	0	\N	\N	126	193
127	0	\N	\N	127	226
128	0	\N	\N	128	4
129	0	\N	\N	129	153
130	0	\N	\N	130	62
131	0	\N	\N	131	79
132	0	\N	\N	132	61
133	0	\N	\N	133	123
134	0	\N	\N	134	64
135	0	\N	\N	135	228
136	0	\N	\N	136	77
137	0	\N	\N	137	125
138	0	\N	\N	138	83
139	0	\N	\N	139	83
140	0	\N	\N	140	125
141	0	\N	\N	141	197
142	0	\N	\N	142	21
143	0	19:24:41	19:24:42	143	46
144	0	\N	\N	144	46
145	0	\N	\N	145	79
146	0	\N	\N	146	79
147	0	\N	\N	147	177
148	0	\N	\N	148	131
149	0	\N	\N	149	24
151	0	04:45:22	04:45:22	151	232
152	0	\N	\N	152	63
153	0	\N	\N	153	33
154	0	\N	\N	154	70
155	0	\N	\N	155	49
156	0	\N	\N	156	20
157	0	\N	\N	157	212
158	0	\N	\N	158	26
159	0	\N	\N	159	122
160	0	\N	\N	160	155
161	0	\N	\N	161	13
162	0	\N	\N	162	77
163	0	\N	\N	163	165
164	0	\N	\N	164	28
165	0	\N	\N	165	233
166	0	\N	\N	166	105
167	0	\N	\N	167	234
168	0	\N	\N	168	4
169	0	\N	\N	169	104
170	0	\N	\N	170	61
171	0	\N	\N	171	235
172	0	\N	\N	172	152
173	0	\N	\N	173	93
174	0	\N	\N	174	6
175	0	\N	\N	175	113
176	0	\N	\N	176	11
177	0	\N	\N	177	63
178	0	\N	\N	178	47
179	0	\N	\N	179	6
180	0	\N	\N	180	123
181	0	\N	\N	181	70
182	0	\N	\N	182	229
183	0	\N	\N	183	124
184	0	\N	\N	184	73
185	0	\N	\N	185	64
186	0	\N	\N	186	236
187	0	\N	\N	187	164
188	0	\N	\N	188	63
189	0	\N	\N	189	9
190	0	\N	\N	190	89
191	0	\N	\N	191	80
192	0	\N	\N	192	90
193	0	\N	\N	193	9
194	0	\N	\N	194	237
195	0	\N	\N	195	6
196	0	\N	\N	196	79
197	0	\N	\N	197	115
198	0	\N	\N	198	4
199	0	\N	\N	199	4
200	0	\N	\N	200	35
201	0	19:10:29	19:10:30	201	239
202	0	\N	\N	202	240
203	0	\N	\N	203	105
204	0	\N	\N	204	39
205	0	\N	\N	205	144
206	0	\N	\N	206	108
207	0	\N	\N	207	42
208	0	\N	\N	208	12
209	0	\N	\N	209	61
210	0	\N	\N	210	240
211	0	\N	\N	211	241
212	0	\N	\N	212	242
213	0	\N	\N	213	24
215	0	\N	\N	215	214
216	0	\N	\N	216	243
217	0	\N	\N	217	244
218	0	\N	\N	218	239
219	0	\N	\N	219	47
220	0	\N	\N	220	64
221	0	\N	\N	221	4
222	0	\N	\N	222	196
223	0	\N	\N	223	81
224	0	\N	\N	224	32
225	0	\N	\N	225	6
226	0	\N	\N	226	46
227	0	\N	\N	227	46
228	0	\N	\N	228	61
229	0	\N	\N	229	245
230	0	\N	\N	230	92
231	0	\N	\N	231	46
232	0	\N	\N	232	246
233	0	\N	\N	233	172
234	0	\N	\N	234	26
235	0	\N	\N	235	24
236	0	\N	\N	236	247
237	0	\N	\N	237	109
238	0	\N	\N	238	63
239	0	\N	\N	239	49
240	0	\N	\N	240	248
241	0	\N	\N	241	83
242	0	\N	\N	242	63
243	0	\N	\N	243	249
244	0	\N	\N	244	39
245	0	\N	\N	245	131
246	0	\N	\N	246	211
247	0	\N	\N	247	234
248	0	\N	\N	248	21
249	0	\N	\N	249	240
250	0	\N	\N	250	250
251	0	\N	\N	251	39
252	0	\N	\N	252	14
253	0	\N	\N	253	251
254	0	\N	\N	254	55
255	0	\N	\N	255	34
256	0	\N	\N	256	62
257	0	\N	\N	257	79
258	0	\N	\N	258	240
259	0	\N	\N	259	92
260	0	\N	\N	260	13
261	0	\N	\N	261	20
262	0	\N	\N	262	121
263	0	\N	\N	263	61
264	0	\N	\N	264	234
265	0	\N	\N	265	66
266	0	\N	\N	266	44
267	0	\N	\N	267	62
268	0	\N	\N	268	48
269	0	\N	\N	269	254
270	0	\N	\N	270	167
271	0	\N	\N	271	27
272	0	\N	\N	272	48
273	0	\N	\N	273	168
274	0	\N	\N	274	35
275	0	\N	\N	275	84
276	0	\N	\N	276	234
277	0	\N	\N	277	81
278	0	\N	\N	278	107
279	0	\N	\N	279	66
280	0	\N	\N	280	110
281	0	\N	\N	281	64
282	0	\N	\N	282	165
283	0	\N	\N	283	35
284	0	\N	\N	284	9
285	0	\N	\N	285	143
286	0	\N	\N	286	256
287	0	\N	\N	287	68
288	0	\N	\N	288	84
289	0	\N	\N	289	60
290	0	\N	\N	290	257
291	0	\N	\N	291	94
292	0	\N	\N	292	109
293	0	\N	\N	293	183
294	0	\N	\N	294	85
295	0	\N	\N	295	76
296	0	\N	\N	296	148
297	0	\N	\N	297	224
298	0	\N	\N	298	62
299	0	\N	\N	299	61
300	0	\N	\N	300	69
301	0	\N	\N	301	39
302	0	22:24:22	22:24:22	302	259
303	0	\N	\N	303	81
304	0	\N	\N	304	6
305	0	\N	\N	305	28
306	0	\N	\N	306	63
307	0	\N	\N	307	240
308	0	\N	\N	308	62
309	0	\N	\N	309	6
310	0	\N	\N	310	234
311	0	\N	\N	311	260
314	0	\N	\N	314	32
315	0	\N	\N	315	119
316	0	\N	\N	316	149
317	0	\N	\N	317	4
318	0	08:30:00	08:34:00	318	261
319	0	\N	\N	319	191
320	0	\N	\N	320	67
321	0	\N	\N	321	45
322	0	\N	\N	322	6
323	0	\N	\N	323	32
324	0	\N	\N	324	262
325	0	\N	\N	325	62
326	0	\N	\N	326	263
327	0	\N	\N	327	149
328	0	\N	\N	328	149
329	0	\N	\N	329	194
330	0	\N	\N	330	150
331	0	\N	\N	331	224
332	0	\N	\N	332	119
333	0	\N	\N	333	57
334	0	\N	\N	334	49
335	0	\N	\N	335	95
336	0	\N	\N	336	46
337	0	\N	\N	337	24
338	0	\N	\N	338	264
339	0	\N	\N	339	214
340	0	\N	\N	340	265
341	0	\N	\N	341	34
342	0	\N	\N	342	113
343	0	\N	\N	343	39
344	0	\N	\N	344	83
345	0	\N	\N	345	35
346	0	\N	\N	346	145
347	0	\N	\N	347	6
348	0	\N	\N	348	233
349	0	\N	\N	349	104
350	0	\N	\N	350	144
351	0	\N	\N	351	68
352	0	\N	\N	352	61
353	0	\N	\N	353	4
354	0	\N	\N	354	194
355	0	\N	\N	355	64
356	0	\N	\N	356	67
357	0	\N	\N	357	39
358	0	\N	\N	358	14
359	0	\N	\N	359	63
360	0	\N	\N	360	62
361	0	\N	\N	361	234
362	0	\N	\N	362	6
363	0	\N	\N	363	267
364	0	\N	\N	364	35
365	0	\N	\N	365	224
366	0	\N	\N	366	32
\.


--
-- Name: shows_show_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('shows_show_id_seq', 366, true);


--
-- Data for Name: shows_showdate; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY shows_showdate (id, year, month, day, exact_date) FROM stdin;
1	1972	10	26	1972-10-26
2	1984	3	3	1984-03-03
3	1982	10	10	1982-10-10
4	1982	10	10	1982-10-10
5	1982	10	10	1982-10-10
6	1992	10	25	1992-10-25
7	1993	3	15	1993-03-15
8	1972	9	17	1972-09-17
9	1972	9	17	1972-09-17
10	1973	11	21	1973-11-21
11	1990	3	15	1990-03-15
12	1972	5	10	1972-05-10
13	1989	7	9	1989-07-09
14	1981	5	6	1981-05-06
15	1972	4	24	1972-04-24
16	1984	3	31	1984-03-31
17	1977	6	7	1977-06-07
18	1977	4	30	1977-04-30
19	1973	10	19	1973-10-19
20	1985	6	22	1985-06-22
21	1989	10	8	1989-10-08
23	1987	4	6	1987-04-06
24	1991	9	25	1991-09-25
25	1990	3	28	1990-03-28
26	1990	3	21	1990-03-21
27	1988	6	22	1988-06-22
28	1977	5	5	1977-05-05
29	1981	5	1	1981-05-01
30	1981	5	1	1981-05-01
31	1971	2	19	1971-02-19
32	1972	4	26	1972-04-26
33	1984	4	1	1984-04-01
34	1984	7	13	1984-07-13
35	1977	3	18	1977-03-18
36	1977	4	23	1977-04-23
37	1977	5	8	1977-05-08
38	1976	10	10	1976-10-10
39	1977	4	27	1977-04-27
40	1981	5	13	1981-05-13
41	1977	12	30	1977-12-30
42	1977	9	3	1977-09-03
43	1987	4	2	1987-04-02
44	1990	2	26	1990-02-26
45	1989	12	8	1989-12-08
46	1982	2	17	1982-02-17
47	1989	2	6	1989-02-06
22	1979	12	26	1979-12-26
48	1977	5	26	1977-05-26
49	1971	8	7	1971-08-07
50	1988	3	30	1988-03-30
51	1977	3	20	1977-03-20
52	1977	6	9	1977-06-09
53	1979	9	4	1979-09-04
54	1976	8	4	1976-08-04
55	1977	6	8	1977-06-08
56	1989	7	4	1989-07-04
57	1990	4	2	1990-04-02
58	1990	3	26	1990-03-26
59	1988	9	14	1988-09-14
60	1989	12	28	1989-12-28
61	1984	4	16	1984-04-16
62	1974	6	8	1974-06-08
63	1974	6	8	1974-06-08
64	1973	7	1	1973-07-01
65	1973	2	28	1973-02-28
66	1980	8	20	1980-08-20
67	1989	5	7	1989-05-07
68	1988	9	2	1988-09-02
69	1995	6	28	1995-06-28
70	1976	6	21	1976-06-21
71	1981	2	26	1981-02-26
72	1988	9	11	1988-09-11
73	1986	2	9	1986-02-09
74	1990	7	14	1990-07-14
75	1978	5	10	1978-05-10
76	1977	2	26	1977-02-26
77	1983	4	13	1983-04-13
78	1989	2	5	1989-02-05
79	1977	5	9	1977-05-09
80	1989	2	7	1989-02-07
81	1977	11	5	1977-11-05
82	1988	2	13	1988-02-13
83	1979	12	5	1979-12-05
84	1992	12	16	1992-12-16
85	1977	12	29	1977-12-29
86	1989	3	27	1989-03-27
87	1973	3	31	1973-03-31
88	1987	3	2	1987-03-02
89	1985	2	19	1985-02-19
90	1973	4	2	1973-04-02
91	1978	1	14	1978-01-14
92	1990	2	25	1990-02-25
93	1978	1	7	1978-01-07
94	1988	3	27	1988-03-27
95	1983	10	14	1983-10-14
96	1991	10	30	1991-10-30
97	1977	11	2	1977-11-02
98	1984	4	20	1984-04-20
99	1980	3	30	1980-03-30
100	1977	11	4	1977-11-04
101	1979	12	10	1979-12-10
102	1978	12	12	1978-12-12
103	1978	11	14	1978-11-14
104	1985	6	28	1985-06-28
105	1979	9	1	1979-09-01
106	1985	3	25	1985-03-25
107	1985	11	20	1985-11-20
108	1986	4	1	1986-04-01
109	1979	1	8	1979-01-08
110	1995	7	9	1995-07-09
111	1984	10	31	1984-10-31
112	1984	12	28	1984-12-28
113	1991	6	20	1991-06-20
114	1977	12	31	1977-12-31
115	1982	4	6	1982-04-06
116	1982	8	10	1982-08-10
117	1977	5	15	1977-05-15
118	1978	8	30	1978-08-30
119	1988	9	18	1988-09-18
120	1981	4	30	1981-04-30
121	1979	10	31	1979-10-31
122	1979	11	5	1979-11-05
123	1977	5	19	1977-05-19
124	1977	5	28	1977-05-28
125	1985	12	30	1985-12-30
126	1979	5	8	1979-05-08
127	1971	10	26	1971-10-26
128	1993	9	16	1993-09-16
129	1977	5	25	1977-05-25
130	1985	11	22	1985-11-22
131	1981	3	14	1981-03-14
132	1973	3	24	1973-03-24
133	1983	4	12	1983-04-12
134	1984	4	13	1984-04-13
135	1971	12	9	1971-12-09
136	1982	7	18	1982-07-18
137	1977	5	11	1977-05-11
139	1986	5	10	1986-05-10
140	1978	7	3	1978-07-03
141	1983	3	25	1983-03-25
142	1990	3	25	1990-03-25
143	1990	3	14	1990-03-14
144	1990	3	16	1990-03-16
145	1990	3	18	1990-03-18
146	1990	3	19	1990-03-19
147	1990	3	22	1990-03-22
148	1984	5	8	1984-05-08
149	1981	2	28	1981-02-28
150	1985	11	2	1985-11-02
151	1977	11	1	1977-11-01
152	1984	11	2	1984-11-02
153	1978	7	1	1978-07-01
154	1980	5	1	1980-05-01
155	1979	8	13	1979-08-13
156	1995	7	8	1995-07-08
157	1970	4	18	1970-04-18
158	1979	1	14	1979-01-14
159	1979	2	3	1979-02-03
160	1995	7	6	1995-07-06
161	1976	12	31	1976-12-31
162	1987	6	12	1987-06-12
163	1995	2	21	1995-02-21
164	1979	10	24	1979-10-24
165	1978	4	16	1978-04-16
166	1983	3	29	1983-03-29
167	1978	1	10	1978-01-10
168	1990	9	14	1990-09-14
169	1984	10	17	1984-10-17
170	1987	3	31	1987-03-31
171	1979	6	28	1979-06-28
172	1980	11	28	1980-11-28
173	1984	4	16	1984-04-16
174	1974	10	17	1974-10-17
175	1980	3	31	1980-03-31
176	1978	1	6	1978-01-06
177	1984	10	30	1984-10-30
178	1986	5	3	1986-05-03
179	1977	12	27	1977-12-27
180	1977	11	6	1977-11-06
181	1989	3	31	1989-03-31
182	1987	7	26	1987-07-26
183	1983	4	19	1983-04-19
184	1989	4	2	1989-04-02
185	1983	4	9	1983-04-09
186	1990	10	27	1990-10-27
187	1989	10	22	1989-10-22
188	1983	5	13	1983-05-13
189	1979	11	2	1979-11-02
190	1974	5	19	1974-05-19
191	1974	5	12	1974-05-12
192	1973	5	20	1973-05-20
193	1990	3	30	1990-03-30
194	1982	2	21	1982-02-21
195	1977	3	19	1977-03-19
196	1986	4	4	1986-04-04
197	1977	5	13	1977-05-13
198	1988	9	16	1988-09-16
199	1994	10	13	1994-10-13
200	1982	7	29	1982-07-29
201	1983	9	11	1983-09-11
202	1981	8	28	1981-08-28
203	1982	2	16	1982-02-16
204	1988	12	28	1988-12-28
205	1983	10	20	1983-10-20
206	1976	7	17	1976-07-17
207	1978	4	8	1978-04-08
208	1980	10	30	1980-10-30
209	1993	9	13	1993-09-13
210	1985	11	16	1985-11-16
211	1979	5	12	1979-05-12
212	1971	11	15	1971-11-15
213	1981	2	27	1981-02-27
215	1979	11	23	1979-11-23
216	1969	2	11	1969-02-11
217	1973	11	25	1973-11-25
218	1982	10	17	1982-10-17
219	1991	5	5	1991-05-05
220	1992	3	5	1992-03-05
221	1988	9	20	1988-09-20
222	1981	5	30	1981-05-30
223	1994	10	1	1994-10-01
224	1987	9	9	1987-09-09
225	1974	10	20	1974-10-20
226	1988	9	3	1988-09-03
227	1988	9	6	1988-09-06
228	1988	9	8	1988-09-08
229	1987	8	22	1987-08-22
230	1983	3	26	1983-03-26
231	1976	9	25	1976-09-25
232	1971	12	7	1971-12-07
233	1973	11	14	1973-11-14
234	1981	3	13	1981-03-13
235	1978	1	30	1978-01-30
236	1969	5	24	1969-05-24
237	1977	10	1	1977-10-01
238	1985	3	13	1985-03-13
239	1977	10	9	1977-10-09
240	1971	4	4	1971-04-04
241	1983	8	20	1983-08-20
242	1981	9	11	1981-09-11
243	1982	4	3	1982-04-03
244	1992	2	22	1992-02-22
245	1984	5	6	1984-05-06
246	1976	10	9	1976-10-09
247	1976	10	14	1976-10-14
248	1993	3	27	1993-03-27
249	1988	12	11	1988-12-11
250	1988	10	21	1988-10-21
251	1991	2	20	1991-02-20
252	1994	3	30	1994-03-30
253	1985	9	3	1985-09-03
254	1989	7	13	1989-07-13
255	1973	10	21	1973-10-21
256	1988	2	17	1988-02-17
257	1988	4	4	1988-04-04
258	1988	12	9	1988-12-09
259	1984	4	6	1984-04-06
260	1974	3	23	1974-03-23
261	1991	6	22	1991-06-22
262	1976	10	3	1976-10-03
263	1981	5	2	1981-05-02
264	1978	1	11	1978-01-11
265	1987	4	19	1987-04-19
266	1978	1	13	1978-01-13
267	1988	3	18	1988-03-18
268	1991	8	18	1991-08-18
269	1978	2	5	1978-02-05
270	1988	6	25	1988-06-25
271	1973	12	19	1973-12-19
272	1988	10	1	1988-10-01
273	1988	10	14	1988-10-14
274	1984	6	12	1984-06-12
275	1979	12	9	1979-12-09
276	1976	10	15	1976-10-15
277	1976	6	9	1976-06-09
278	1975	9	28	1975-09-28
279	1983	3	27	1983-03-27
280	1976	6	10	1976-06-10
281	1987	3	23	1987-03-23
282	1995	2	19	1995-02-19
283	1985	9	5	1985-09-05
284	1984	4	29	1984-04-29
285	1983	10	17	1983-10-17
286	1981	11	30	1981-11-30
287	1984	7	7	1984-07-07
288	1973	10	30	1973-10-30
289	1991	9	4	1991-09-04
290	1981	3	2	1981-03-02
291	1974	6	16	1974-06-16
292	1977	10	2	1977-10-02
293	1977	10	7	1977-10-07
294	1987	6	20	1987-06-20
295	1984	6	26	1984-06-26
296	1977	2	27	1977-02-27
297	1987	1	28	1987-01-28
298	1985	2	18	1985-02-18
299	1977	4	22	1977-04-22
300	1976	10	2	1976-10-02
301	1991	2	19	1991-02-19
302	1978	4	24	1978-04-24
303	1974	6	28	1974-06-28
304	1973	11	10	1973-11-10
305	1979	1	15	1979-01-15
306	1985	3	10	1985-03-10
307	1985	11	17	1985-11-17
308	1986	2	11	1986-02-11
309	1973	11	11	1973-11-11
310	1968	8	24	1968-08-24
312	1978	5	5	1978-05-05
311	1978	5	5	1978-05-05
313	1978	5	5	1978-05-05
314	1978	5	14	1978-05-14
315	1976	9	28	1976-09-28
316	1977	5	1	1977-05-01
317	1987	9	18	1987-09-18
318	1988	7	3	1988-07-03
319	1977	10	16	1977-10-16
320	1989	12	9	1989-12-09
321	1978	1	14	1978-01-14
322	1974	2	22	1974-02-22
323	1987	9	7	1987-09-07
138	1987	5	3	1987-05-03
324	1987	5	10	1987-05-10
325	1986	2	14	1986-02-14
326	1978	5	7	1978-05-07
327	1977	5	3	1977-05-03
328	1977	4	29	1977-04-29
329	1979	8	31	1979-08-31
330	1980	5	7	1980-05-07
331	1987	1	29	1987-01-29
332	1978	5	9	1978-05-09
333	1986	7	4	1986-07-04
334	1981	7	13	1981-07-13
335	1974	6	23	1974-06-23
336	1991	3	20	1991-03-20
337	1978	5	17	1978-05-17
338	1988	10	16	1988-10-16
339	1982	2	19	1982-02-19
340	1979	12	28	1979-12-28
341	1978	7	5	1978-07-05
342	1977	4	25	1977-04-25
343	1993	1	24	1993-01-24
344	1982	10	10	1982-10-10
345	1978	7	7	1978-07-07
346	1969	2	22	1969-02-22
347	1978	10	18	1978-10-18
348	1978	4	16	1978-04-16
349	1988	3	31	1988-03-31
350	1988	4	7	1988-04-07
351	1989	7	17	1989-07-17
352	1995	3	19	1995-03-19
353	1988	9	19	1988-09-19
354	1981	5	5	1981-05-05
355	1979	5	4	1979-05-04
356	1977	6	4	1977-06-04
357	1992	2	24	1992-02-24
358	1990	4	1	1990-04-01
359	1986	4	18	1986-04-18
360	1987	3	1	1987-03-01
361	1967	11	10	1967-11-10
362	1973	11	9	1973-11-09
363	1973	2	26	1973-02-26
364	1982	7	28	1982-07-28
365	1984	12	31	1984-12-31
366	1974	6	26	1974-06-26
\.


--
-- Name: shows_showdate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('shows_showdate_id_seq', 366, true);


--
-- Data for Name: songs_alternatename; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY songs_alternatename (id, name, song_id) FROM stdin;
\.


--
-- Name: songs_alternatename_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('songs_alternatename_id_seq', 1, false);


--
-- Data for Name: songs_song; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY songs_song (id, name, shortname, fragment) FROM stdin;
1	(Baby) Hully Gully		f
2	(I Can't Get No) Satisfaction		f
3	(I'm A) Road Runner		f
6	Alabama Getaway		f
7	All Along The Watchtower		f
8	Alligator		f
9	Althea		f
10	And We Bid You Good Night		f
12	Are You Lonely For Me Baby?		f
14	Attics Of My Life		f
16	Baby What You Want Me To Do		f
17	Bad Moon Rising		f
18	Ballad Of A Thin Man		f
20	Banks Of The Ohio		f
21	Barbara Allen		f
22	Beat It On Down The Line		f
23	Believe It Or Not		f
24	Bertha		f
25	Big Boss Man		f
26	Big Boy Pete		f
27	Big Railroad Blues		f
28	Big River		f
29	Bird Song		f
30	Black Muddy River		f
31	Black Peter		f
32	Black Queen		f
34	Blackbird		f
35	Blow Away		f
36	Blues For Allah		f
38	Born On The Bayou		f
39	Box Of Rain		f
40	Brokedown Palace		f
41	Broken Arrow		f
43	Built To Last		f
44	Bye Bye Love		f
45	C.C. Rider		f
46	California Earthquake (Whole Lotta Shakin' Goin' On)		f
47	Can't Come Down		f
48	Candyman		f
49	Casey Jones		f
50	Cassidy		f
51	Caution (Do Not Stop On Tracks)		f
52	Caution (Do Not Stop On Tracks) Jam		f
53	Checkin' Up		f
54	Childhood's End		f
55	Children Of The Eighties		f
56	Chimes Of Freedom		f
57	China Cat Sunflower		f
58	China Cat Sunflower Jam		f
59	China Doll		f
60	Chinatown Shuffle		f
61	Chinese Bones		f
63	Cold Jordan		f
65	Come Back Baby		f
66	Comes A Time		f
67	Corrina		f
68	Cosmic Charlie		f
69	Crazy Fingers		f
71	Cumberland Blues		f
72	Dancing In The Street		f
73	Dark Hollow		f
74	Dark Star		f
75	Dark Star Jam		f
76	Day Tripper		f
77	Days Between		f
78	Dead Man, Dead Man		f
79	Deal		f
80	Dear Mr. Fantasy		f
81	Death Don't Have No Mercy		f
82	Death Letter Blues		f
83	Deep Elem Blues		f
84	Desolation Row		f
85	Devil With The Blue Dress On		f
86	Dire Wolf		f
87	Doin' That Rag		f
88	Don't Ease Me In		f
89	Don't Need Love		f
90	Don't Think Twice, It's Alright		f
91	Down In The Bottom		f
93	Drums		f
94	Dupree's Diamond Blues		f
95	Early Morning Rain		f
96	Easy Answers		f
97	Easy To Love You		f
98	Easy Wind		f
99	El Paso		f
100	Empty Pages		f
101	Estimated Prophet		f
102	Eternity		f
103	Every Time You Go Away		f
104	Eyes Of The World		f
105	Fair Chance To Know		f
106	Far From Me		f
107	Feedback		f
108	Feel Like A Stranger		f
109	Fever		f
110	Fire On The Mountain		f
111	Foolish Heart		f
112	Forever Young		f
113	Franklin's Tower		f
114	Friend Of The Devil		f
115	From The Heart Of Me		f
117	Gentlemen Start Your Engines		f
118	Get Back		f
119	Gimme Some Lovin'		f
120	Gloria		f
121	Goin' Down The Road Feeling Bad		f
122	Good Golly Miss Molly		f
123	Good Lovin'		f
125	Good Times		f
126	Goodnight Irene		f
127	Got My Mojo Workin		f
128	Gotta Serve Somebody		f
129	Greatest Story Ever Told		f
131	Green River		f
132	Hard To Handle		f
133	He Was A Friend Of Mine		f
134	He's Gone		f
135	Heads Up		f
136	Heart Of Mine		f
137	Heaven Help The Fool		f
138	Hell In A Bucket		f
139	Help On The Way		f
140	Here Comes Sunshine		f
141	Hey Bo Diddley		f
142	Hey Jude		f
143	Hey Pocky Way		f
144	Hide Away		f
145	High Time		f
146	Highway 61 Revisited		f
149	I Ain't Superstitous		f
15	Baba O'Riley	Baba O'Riley	f
37	Born Cross-Eyed	Born Cross-Eyed	f
42	Brown-Eyed Women	Brown-Eyed Women	f
148	How Sweet It Is	How Sweet It Is	f
13	Around & Around	Around & Around	f
70	Cryptical	Cryptical	f
64	Cold Rain & Snow	Cold Rain & Snow	f
33	Black-Throated Wind	Black-Throated Wind	f
19	Banana Boat Song (Day-O)	Banana Boat Song (Day-O)	f
116	Funiculì, Funiculà	Funiculì, Funiculà	f
147	How Long, How Long Blues	How Long, How Long Blues	f
124	Good Morning, School Girl	Good Morning, School Girl	f
151	I Fought The Law		f
152	I Got A Mind To Give Up Livin'		f
153	I Hear A Voice Callin'		f
154	I Just Want To Make Love To You		f
155	I Know You Rider		f
156	I Need A Miracle		f
157	I Want To Tell You		f
158	I Want You		f
159	I Will Take You Home		f
160	I'll Be Your Baby Tonight		f
161	I'll Go Crazy		f
162	I'm A Hog For You Baby		f
163	I'm A King Bee		f
164	I'm A Man		f
165	I've Been All Around This World		f
166	If I Had The World To Give		f
167	If The Shoe Fits		f
168	Iko Iko		f
169	In The Midnight Hour		f
170	It Hurts Me Too		f
171	It Must Have Been The Roses		f
173	It's A Sin		f
174	It's All Over Now		f
175	It's All Over Now, Baby Blue		f
176	It's All Too Much		f
178	Jack Straw		f
180	Joey		f
181	John Brown		f
182	John's Other		f
183	Johnny B. Goode		f
184	Just A Little Light		f
185	Just Like Tom Thumb's Blues		f
187	Kansas City		f
188	Katie Mae		f
189	Keep On Growing		f
190	Keep Your Day Job		f
191	Knockin' On Heaven's Door		f
193	La Bamba		f
196	Lazy Lightnin'		f
197	Lazy River Road		f
198	Let It Grow		f
199	Let It Rock		f
200	Let Me Sing Your Blues Away		f
202	Liberty		f
203	Little Red Rooster		f
204	Little Sadie		f
205	Long Black Limousine		f
206	Looks Like Rain		f
207	Loose Lucy		f
208	Loser		f
209	Lost Sailor		f
210	Louie Louie		f
211	Love The One You're With		f
212	Lucifer's Eyes		f
213	Lucy In The Sky With Diamonds		f
214	Maggie's Farm		f
215	Mama Tried		f
216	Man Of Peace		f
218	Mason's Children		f
219	Matilda, Matilda		f
220	Maybe You Know		f
223	Mexicali Blues		f
224	Might As Well		f
226	Mindbender		f
227	Mission In The Rain		f
229	Mona		f
230	Money Money		f
232	Morning Dew		f
233	Mountain Jam		f
234	Mountains Of The Moon		f
235	Mr. Charlie		f
236	Mr. Tambourine Man		f
237	My Baby Left Me		f
238	My Brother Esau		f
239	Neighbourhood Girls		f
240	Never Trust A Woman		f
242	New Orleans		f
243	New Potato Caboose		f
244	New Speedway Boogie		f
245	Next Time You See Me		f
246	Nobody's Fault But Mine		f
247	Nobody's Fault But Mine Jam		f
248	Not Fade Away		f
249	Ode For Billie Dean		f
253	Old, Old House		f
254	Ollin Arrageed		f
255	On The Road Again		f
256	One Kind Favor		f
257	One More Saturday Night		f
258	Only A Fool		f
259	Operator		f
261	Passenger		f
263	Picasso Moon		f
264	Playing In The Band		f
265	Prisoner Blues		f
266	Proud Mary		f
267	Queen Jane Approximately		f
268	Rain		f
269	Rainy Day Women #12 & #35		f
270	Ramble On Rose		f
272	Revolution		f
273	Revolutionary Hamstrung Blues		f
274	Ripple		f
275	Rockin' Pneumonia & The Boogie Woogie Flu		f
277	Rosalie Mcfall		f
278	Row Jimmy		f
280	Saint Of Circumstance		f
282	Salt Lake City		f
283	Samba In The Rain		f
285	Sawmill		f
286	Scarlet Begonias		f
287	Seasons Of My Heart		f
288	Seastones		f
289	Shakedown Street		f
290	She Belongs To Me		f
291	She's Mine		f
292	Shelter From The Storm		f
293	Ship Of Fools		f
295	Sidewalks Of New York		f
297	Simple Twist Of Fate		f
298	Sing Me Back Home		f
225	Your Mind Left Your Body Jam	Your Mind Left Your Body Jam	f
279	Sage & Spirit	Sage & Spirit	f
296	Silver Threads & Golden Needles	Silver Threads & Golden Needles	f
284	Samson & Delilah	Samson & Delilah	f
294	Sick & Tired	Sick & Tired	f
276	Rollin' & Tumblin'	Rollin' & Tumblin'	f
262	Peggy-O	Peggy-O	f
250	Oh Babe, It Ain't No Lie	Oh Babe, It Ain't No Lie	f
251	Oh, Boy!	Oh, Boy!	f
222	Me & My Uncle	Me & My Uncle	f
221	Me & Bobby McGee	Me & Bobby McGee	f
231	Monkey & The Engineer	Monkey & The Engineer	f
194	Lady Di & I	Lady Di & I	f
177	Jack-A-Roe	Jack-A-Roe	f
172	It Takes A Lot To Laugh, It Takes A Train To Cry	Train To Cry	f
186	K.C. Moan	K.C. Moan	f
217	Man Smart, Woman Smarter	Man Smart, Woman Smarter	f
201	Good Times	Good Times	f
299	Sittin' On Top Of The World		f
300	Slipknot!		f
302	Slow Train		f
303	Smokestack Lightnin'		f
304	Smokestack Lightnin' Jam		f
305	So Many Roads		f
306	Space		f
307	Spanish Jam		f
308	Spoonful		f
309	Stagger Lee		f
310	Stander On The Mountain		f
311	Standing On The Moon		f
312	Stella Blue		f
313	Stir It Up		f
314	Stronger Than Dirt Or Milkin' The Turkey		f
315	Stuck Inside Of Mobile With The Memphis Blues Again		f
316	Sugar Magnolia		f
318	Sugaree		f
319	Sunrise		f
320	Sunshine Daydream		f
321	Supplication		f
322	Supplication Jam		f
323	Swing Low, Sweet Chariot		f
325	Take It All Off		f
326	Take Me To The River		f
327	Tangled Up In Blue		f
328	Tell Mama		f
329	Tennessee Jed		f
330	Terrapin Station		f
331	That Would Be Something		f
332	That's All Right, Mama		f
333	The Ballad Of Casey Jones		f
335	The Boxer		f
336	The Eleven		f
337	The Frozen Logger		f
338	The Last Time		f
339	The Main Ten Jam		f
340	The Mighty Quinn (Quinn The Eskimo)		f
341	The Music Never Stopped		f
342	The Only Time Is Now		f
346	The Race Is On		f
347	The Rub		f
348	The Same Thing		f
349	The Seven		f
351	The Times They Are A Changin'		f
352	The Weight		f
353	The Wheel		f
354	The Wicked Messenger		f
355	They Love Each Other		f
357	Throwing Stones		f
358	Till The Morning Comes		f
359	To Lay Me Down		f
360	Tom Dooley		f
361	Tomorrow Is A Long Time		f
362	Tomorrow Is Forever		f
363	Tomorrow Never Knows		f
364	Tons Of Steel		f
365	Touch Of Grey		f
367	Truckin'		f
370	U.S. Blues		f
371	Unbroken Chain		f
372	Uncle John's Band		f
373	Uncle John's Band Jam		f
374	Uncle Sam Blues		f
375	Valley Road		f
376	Victim Or The Crime		f
377	Viola Lee Blues		f
378	Visions Of Johanna		f
380	Wake Up Little Susie		f
381	Walkin' Blues		f
382	Walking The Dog		f
383	Wang Dang Doodle		f
384	Warriors Of The Sun		f
385	Watching The River Flow		f
386	Wave That Flag		f
387	Wave To The Wind		f
388	Way To Go Home		f
389	We Can Run		f
390	Weather Report Suite Part 1		f
392	Werewolves Of London		f
393	West L.A. Fadeaway		f
394	Wharf Rat		f
395	What's Going On?		f
396	When I Paint My Masterpiece		f
397	When Push Comes To Shove		f
399	Who Do You Love?		f
400	Why Don't We Do It In The Road		f
402	Winin' Boy Blues		f
405	You Ain't Woman Enough		f
406	You See A Broken Heart		f
407	You Win Again		f
345	Promised Land	Promised Land	f
368	Turn On Your Love Light	Turn On Your Love Light	f
228	Mississippi Half-Step	Mississippi Half-Step	f
410	You Don't Have To Ask	You Don't Have To Ask	f
411	You Know I Love You So	You Know I Love You So	f
412	Will The Circle Be Unbroken	Will The Circle Be Unbroken	f
391	Weather Report Suite Prelude	Weather Report Suite Prelude	f
369	The Stranger (Two Souls In Communion)	The Stranger	f
344	Other One Jam	Other One Jam	t
343	Other One	Other One	f
334	The Ballad Of Frankie Lee & Judas Priest	Judas Priest	f
281	St. Stephen	St. Stephen	f
271	Reuben & Cherise	Reuben & Cherise	f
413	It's A Man's, Man's, Man's World	It's A Man's, Man's, Man's World	f
414	Hey Jude Finale	Hey Jude Finale	f
415	Ain't It Crazy	Ain't It Crazy	f
416	Bring Me My Shotgun	Bring Me My Shotgun	f
417	Black Snake	Black Snake	f
418	The Mighty Flood	The Mighty Flood	f
419	Roberta	Roberta	f
420	Green, Green Grass Of Home	Green, Green Grass Of Home	f
421	Ole Slew Foot	Ole Slew Foot	f
422	It's A Sin Jam	It's A Sin Jam	f
423	Truckin' Jam	Truckin' Jam	t
424	Weir's Segue	Weir's Segue	t
425	PITB Jam	PITB Jam	t
426	Playing Reprise	Playing Reprise	f
427	Truckin' Reprise	Truckin' Reprise	f
428	Improv	Improv	t
429	Free Form Jam	Free Form Jam	t
430	Jerry, Bob & Phil Interplay	JBP Interplay	t
431	Explorations	Explorations	t
434	Wharf Rat Jam	Wharf Rat Jam	t
436	Untitled Post-Eyes Jam	Untitled Post-Eyes Jam	t
437	Descending Four Chord Sequence	Descending Four Chord Sequence	t
438	Feelin' Groovy Jam	Feelin' Groovy Jam	t
439	UJB Reprise	UJB Reprise	f
241	Minglewood Blues	Minglewood Blues	f
432	Keith, Phil & Drums Jam	Keith, Phil & Drums Jam	t
440	Dear Prudence Jam	Dear Prudence Jam	t
443	NFA & GDTRFB Jam	NFA & GDTRFB Jam	t
444	Terrapin Transit	Terrapin Transit	f
445	At A Siding Jam	At A Siding Jam	f
446	NFA Reprise	NFA Reprise	f
447	Bob, Phil & Drums Jam	Bob, Phil & Drums Jam	t
448	NFA Jam	NFA Jam	t
449	Drums w/ Jerry	Drums w/ Jerry	t
451	Brent, Phil & Drums Jam	Brent, Phil & Drums Jam	t
452	Jerry, Bob & Drums Jam	Jerry, Bob & Drums Jam	t
455	Jerry & Bob Interplay	Jerry & Bob Interplay	t
435	And We Bid You Good Night Coda	And We Bid You Good Night Coda	f
456	Jerry, Bob & Keith Interplay	Jerry, Bob & Keith Interplay	t
458	Jerry & Phil Interplay	Jerry & Phil Interplay	t
459	Spoonful Jam	Spoonful Jam	t
460	Prelude	Prelude	t
461	Jerry, Bob & Brent Interplay	Jerry, Bob & Brent Interplay	f
463	Keith, Phil & Drums Jam	Keith, Phil & Drums Jam	t
465	Drums w/ Jerry & Bob	Drums w/ Jerry & Bob	t
466	Bob, Brent & Drums Jam	Bob, Brent & Drums Jam	t
467	Spanish Theme	Spanish Theme	t
468	Jerry, Keith & Drums	Jerry, Keith & Drums	t
469	Jerry & Drums Jam	Jerry & Drums Jam	t
457	Phil & Drums Jam	Phil & Drums Jam	t
441	Keith & Drums Jam	Keith & Drums Jam	t
470	Malaguena Jam	Malaguena Jam	t
472	Bob, Keith, Phil & Drums Jam	Bob, Keith, Phil & Drums Jam	t
473	Brent & Phil Interplay	Brent & Phil Interplay	t
453	Jerry, Bob, Brent & Phil Interplay	Jerry, Bob, Brent & Phil Interpl	t
442	Jerry, Bob, Keith & Phil Interplay	Jerry, Bob, Keith & Phil Interpl	t
474	Jerry, Phil & Drums Jam	Jerry, Phil & Drums Jam	t
475	Jerry Interplay	Jerry Interplay	t
476	Run Rudolph Run	Run Rudolph Run	f
477	Jerry, Keith & Phil Interplay	Jerry, Keith & Phil Interplay	t
478	Jerry, Brent & Drummers Jam	Jerry, Brent & Drummers Jam	t
479	Brent & Drummers Jam	Brent & Drummers Jam	t
480	Bob & Drummers Jam	Bob & Drummers Jam	t
481	Close Encounters 	Close Encounters 	t
482	Bralove Sounds	Bralove Sounds	f
483	Phil Interplay	Phil Interplay	t
484	King Solomon's Marbles	King Solomon's Marbles	f
485	Not Fade Away Jam	Not Fade Away Jam	f
\.


--
-- Name: songs_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('songs_song_id_seq', 485, true);


--
-- Data for Name: tours_tour; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY tours_tour (id, name) FROM stdin;
\.


--
-- Name: tours_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('tours_tour_id_seq', 1, false);


--
-- Data for Name: venues_venue; Type: TABLE DATA; Schema: public; Owner: pigpen
--

COPY venues_venue (id, name, city, state, country, longitude, latitude) FROM stdin;
1	Concertgebouw	Amsterdam	-1	7	52.3565560	4.8791560
2	Autzen Stadium, University of Oregon	Eugene	37	0	123.0686000	44.0583000
3	Baltimore Civic Center	Baltimore	20	0	76.6167000	39.2833000
4	Madison Square Garden	New York	32	0	40.7506000	73.9934380
5	Denver Coliseum	Denver	5	0	104.9903000	39.7392000
6	Winterland Arena	San Francisco	4	0	122.4349000	37.7850000
7	Academy of Music	New York	32	0	73.9885000	40.7346000
8	Roosevelt Stadium	Jersey City	30	0	74.1050000	40.7064000
9	Nassau Veterans Memorial Coliseum	Uniondale	32	0	73.5906000	40.7228000
10	Mississippi River Festival	Edwardsville	13	0	89.9978000	38.7934000
11	Swing Auditorium	San Bernardino	4	0	-0.0000001	0.0000000
12	Radio City Music Hall	New York	32	0	-73.9787789	40.7595910
13	Cow Palace	Daly City	4	0	-122.4187381	37.7067650
14	The Omni	Atlanta	10	0	-84.3965674	33.7568960
15	Palais des Sports	Paris	-1	3	2.2881055	48.8318020
16	Freedom Hall	Louisville	17	0	-85.7418145	38.1989300
17	Hec Edmundson Pavilion	Seattle	47	0	-122.3126629	47.6562950
18	Great American Music Hall	San Francisco	4	0	-122.4188220	37.7848010
19	Selland Arena	Fresno	4	0	-119.7827541	36.7329560
20	Soldier Field	Chicago	13	0	87.6167000	41.8625000
21	Knickerbocker Arena	Albany	32	0	73.7547000	42.6486000
22	Stockton Civic Auditorium	Stockton	4	0	-119.7827541	36.7329560
23	Dane County Coliseum	Madison	49	0	89.3807000	43.0440000
24	Uptown Theatre	Chicago	13	0	-87.6602060	41.9695210
25	Milwaukee Auditorium	Milwaukee	49	0	-87.9184392	43.0422650
26	Utica Memorial Auditorium	Utica	32	0	75.2335000	43.1050000
27	Curtis Hixon Hall	Tampa	9	0	-82.4616809	27.9488510
28	Springfield Civic Center Arena	Springfield	21	0	72.5869000	42.1022000
29	Nashville Municipal Auditorium	Nashville	42	0	-86.7817328	36.1674070
30	Rupp Arena	Lexington	17	0	-84.5021999	38.0494190
31	New Haven Coliseum	New Haven	6	0	-72.9264275	41.3034140
32	Providence Civic Center	Providence	39	0	-71.3714570	41.8868650
33	Arrowhead Stadium	 Kansas City	25	0	-94.4853187	39.0479400
34	Omaha Civic Auditorium	Omaha	27	0	-95.9399605	41.2616030
35	Red Rocks Amphitheatre	Morrison	5	0	-105.1972835	39.6799840
36	Shea's Buffalo Theatre	Buffalo	32	0	78.8736000	42.8914000
37	Detroit Masonic Temple	Detriot	22	0	83.0602000	42.3414000
38	Memorial Hall	Kansas City	16	0	94.6276000	39.1124000
39	Oakland-Alameda County Coliseum Arena	Oakland	4	0	122.2031000	37.7503000
40	County Coliseum	El Paso	43	0	-106.4428085	31.7668230
41	Fox Theatre	Atlanta	10	0	-84.3853118	33.7727610
42	Veterans Memorial Coliseum	Jacksonville	9	0	-81.6450580	30.3258110
43	Sportatorium	Pembroke Pines	9	0	-80.3753632	26.0091100
44	Arlington Theatre	Santa Barbara	4	0	-119.7065206	34.4246270
45	Bakersfield Convention Center	Bakersfield	4	0	-119.0129830	35.3721820
46	Capital Centre	Landover	20	0	76.8469000	38.9025000
47	Cal Expo Amphitheatre	Sacramento	4	0	121.4689000	38.5556000
48	Shoreline Amphitheatre	Mountain View	4	0	122.0807000	37.4268000
49	McNichols Arena	Denver	5	0	105.0225000	39.7428000
50	Compton Terrace Amphitheatre	Chandler	2	0	111.8333000	33.3000000
51	California State University, Dominguez Hills	Carson	4	0	118.2561000	33.8647000
52	Cardinal Stadium	Louisville	17	0	85.7589000	38.2058000
53	Three Rivers Stadium	Pittsburgh	38	0	80.0128000	40.4467000
54	Carter-Finley Stadium	Raleigh	33	0	78.7194000	35.8008000
55	Robert F. Kennedy Stadium	Washington	8	0	76.9717000	38.8897000
56	Foxborough Stadium	Foxborough	21	0	71.2643000	42.0909000
57	Rich Stadium	Orchard Park	32	0	78.7870000	42.7740000
58	Deer Creek Music Center	Noblesville	14	0	85.9311000	40.0052000
59	World Music Theatre	Tinley Park	13	0	87.7760000	41.5440000
60	The Coliseum In Richfield	Richfield Township	35	0	81.5939000	41.2453000
61	The Spectrum	Philadelphia	38	0	75.1711000	39.9042000
62	Henry J. Kaiser Convention Center	Oakland	4	0	122.2617000	37.7975000
63	Berkeley Community Theatre	Berkeley	4	0	122.2715000	37.8684000
64	Hampton Coliseum	Hampton	46	0	76.3813000	37.0347000
65	Cumberland County Civic Center	Portland	19	0	70.2592000	43.6556000
66	Irvine Meadows Amphitheatre	Laguna Hills	4	0	117.7497000	33.6375000
67	Great Western Forum	Inglewood	4	0	-118.3418389	33.9582220
68	Alpine Valley Music Theatre	East Troy	49	0	88.4336000	42.7378000
69	Riverbend Music Center	Cincinnati	35	0	39.0521000	84.4187000
70	Greensboro Coliseum	Greensboro	33	0	-79.8261302	36.0586300
71	Blossom Music Center	Cuyahoga Falls	35	0	81.5607000	41.1913000
72	Saratoga Performing Arts Center	Saratoga	32	0	43.0553000	73.8058000
73	Civic Arena	Pittsburgh	38	0	-79.9897650	40.4417210
74	Riverfront Coliseum	Cincinnati	35	0	-84.5044358	39.0979230
75	Hersheypark Stadium	Hershey	38	0	76.6590000	40.2901000
76	Merriweather Post Pavilion	Columbia	20	0	76.8627000	39.2092000
77	Ventura County Fairgrounds	Ventura	4	0	119.3036000	34.2753000
78	The Metrodome	Minneapolis	23	0	93.2581000	44.9739000
79	Hartford Civic Center	Hartford	6	0	72.6769000	41.7683000
80	University of Nevada	Reno	28	0	-119.8160539	39.5445680
81	Boston Garden	Boston	21	0	71.0622000	42.3663000
82	Rubber Bowl, University of Akron	Akron	35	0	81.4561000	41.0394000
83	Frost Amphitheatre, Stanford University	Palo Alto	4	0	122.1658000	37.4306000
84	Kiel Auditorium	St. Louis	25	0	90.2018000	38.6280000
85	Greek Theatre, University of California, Berkeley	Berkeley	4	0	122.2542000	37.8737000
86	Giants Stadium	East Rutherford	30	0	74.0769000	40.8122000
87	Harry Adams Field House, University of Montana	Missoula	26	0	-113.9821280	46.8605760
88	Pacific National Exhibition Coliseum	Vancouver, British Columbia	-1	1	-123.0429532	49.2858030
89	Portland Memorial Coliseum	Portland	37	0	-122.6695141	45.5319580
90	Campus Stadium,  University of California, Santa Barbara	Santa Barbara	4	0	-119.8535096	34.4194920
91	Marin Veterans Memorial Auditorium	San Rafael	4	0	122.5300000	37.9997000
92	Aladdin Theatre for the Performing Arts	Las Vegas	28	0	115.1701000	36.1099000
93	Rochester Community War Memorial	Rochester	32	0	77.6108000	43.1539000
94	Iowa State Fairgrounds	Des Moines	15	0	-93.5545484	41.5955920
95	Miami Jai-Alai Fronton	Miami	9	0	-80.2568107	25.8073350
96	Hollywood Bowl	Los Angeles	4	0	-118.3388562	34.1127390
97	International Amphitheatre	Chicago	13	0	-87.6457560	41.8171440
98	Roanoke Civic Center	Roanoke	46	0	-79.9362444	37.2799150
99	Dillon Stadium	Hartford	6	0	-72.6850932	41.7637110
101	Alexandra Palace	London	-1	2	-0.1331833	51.5907850
102	Olympiahalle Munich	Munich	-1	4	11.5454895	48.1738810
103	Parc Des Expositions	Dijon	-1	3	5.0414800	47.3220470
104	Brendan Bryne Arena	East Rutherford	30	0	74.0675000	40.8117000
105	Warfield Theatre	San Francisco	4	0	122.4103000	37.7827000
106	Kezar Stadium	San Francisco	4	0	-122.4540167	37.7675270
107	Lindley Meadow at Golden Gate Park	San Francisco	4	0	-122.4898366	37.7708860
108	Orpheum Theatre	San Francisco	4	0	-122.4145712	37.7792460
109	Paramount Theatre	Portland	37	0	-122.6812198	45.5170520
110	Boston Music Hall	Boston	4	0	-71.0625946	42.3088790
111	Colt Park	Hartford	6	0	-72.6742893	41.7526680
112	Beacon Theatre	New York	32	0	-73.9810431	40.7804560
113	Capitol Theatre	Passaic	30	0	-74.1301440	40.8673150
114	Tower Theatre	Upper Darby	38	0	-75.2589325	39.9611530
115	Auditorium Theatre	Chicago	13	0	-87.6254698	41.8757670
116	William & Mary Hall, College Of William & Mary	Williamsburg	46	0	-76.7142145	37.2716880
117	Cameron Indoor Stadium, Duke University	Durham	33	0	-78.9436556	35.9968390
118	Palais des Sports	Paris	-1	3	2.2861218	48.8328430
119	Onondaga County War Memorial	Syracuse	32	0	-76.1482090	43.0435270
120	Mershon Auditorium, Ohio State University	Columbus	35	0	-83.0089674	40.0004550
121	Cobo Arena	Detroit	22	0	-83.0492546	42.3250330
122	Market Square Arena	Indianapolis	14	0	-86.1525950	39.7684010
123	Broome County Veterans Memorial Arena	Binghamton	32	0	75.9131000	42.0956000
125	St. Paul Civic Center Arena	St. Paul	23	0	93.1011000	44.9447000
126	Coliseum, West Virginia University	Morgantown	48	0	79.9545000	39.6358000
127	City Island	Harrisburg	38	0	76.8880000	40.2551000
128	Poplar Creek Music Theatre	Hoffmann Estates	13	0	88.1972000	42.0687000
129	Seattle Center Coliseum	Seattle	47	0	122.3541000	47.6221000
130	Avalon Ballroom	San Francisco	4	0	-122.4211391	37.7877480
131	Silva Concert Hall at the Hult Center for the Performing Arts	Eugene	37	0	123.0932000	44.0525000
132	Labor Temple	Minneapolis	23	0	-93.2538282	44.9876810
133	Boise Pavilion, Boise State University	Boise	12	0	116.1989000	43.6036000
134	Music Box	Omaha	27	0	-96.0350813	41.2628030
135	Red Rocks Amphitheatre	Morrison	5	0	105.2058000	39.6653000
136	Manor Downs	Manor Downs	43	0	97.5567000	30.3431000
137	Memorial Hall	Kansas City	16	0	-94.6272774	39.1122170
138	Nevada County Fairgrounds	Grass Valley 	4	0	121.0583000	39.2192000
139	Richmond Coliseum	Richmond	46	0	77.4345000	37.5447000
140	Stanley Theatre	Pittsburgh	38	0	-80.0000614	40.4429850
141	Greensboro Coliseum	Greensboro	33	0	79.8256000	36.0597000
143	Olympic Arena	Lake Placid	32	0	73.9856000	44.2833000
144	The Centrum	Worcester	21	0	71.7983000	42.2650000
145	Dream Bowl	Vallejo	4	0	-122.2566367	38.1040860
146	Student Center, Modesto Junior College	Modesto	4	0	-121.0097255	37.6520670
147	Las Vegas Ice Palace	Las Vegas	28	0	-115.1439330	36.1408590
148	Robertson Gymnasium, University of California, Santa Barbara	Santa Barbara	4	0	-119.8535096	34.4194920
149	The Palladium	New York	32	0	-73.9882300	40.7333450
150	Barton Hall, Cornell University	Ithaca	32	0	-76.4815864	42.4458010
151	Memorial Coliseum, University of Alabama	Tuscaloosa	0	0	-87.5397911	33.2029880
152	Lakeland Civic Center	Lakeland	9	0	-81.9630732	28.0408110
153	The Mosque	Richmond	46	0	-77.4521392	37.5461980
154	Chick Evans Field House	DeKalb	13	0	-88.7798537	41.9339750
155	Riverport Amphitheatre	Maryland Heights	25	0	90.4695000	38.7443000
156	The Palace	Auburn Hills	22	0	83.2456000	42.6969000
157	Franklin County Airport	Highgate	45	0	73.0975000	44.9403000
158	Portland Meadows	Portland	37	0	122.6728000	45.5914000
159	Memorial Stadium	Seattle	47	0	122.3500000	47.6230000
160	Silver Bowl, University of Nevada, Las Vegas	Las Vegas	28	0	115.0167000	36.0864000
161	Tampa Stadium	Tampa	9	0	82.5036000	27.9789000
162	Birmingham-Jefferson Civic Center Coliseum	Birmingham	0	0	86.8120000	33.5240000
163	The Pyramid Arena	Memphis	42	0	90.0519000	35.1556000
164	Charlotte Coliseum	Charlotte	33	0	80.9128000	35.1864000
165	Delta Center	Salt Lake City	44	0	111.9011000	40.7683000
166	Los Angeles Sports Arena	Los Angeles	4	0	118.2850000	34.0130000
167	Buckeye Lake Music Center	Hebron	35	0	82.4067000	39.9378000
168	Miami Arena	Miami	9	0	80.1956000	25.7808000
169	Orlando Arena	Orlando	9	0	81.3867000	28.5489000
170	Rosemont Horizon Arena	Rosemont	13	0	87.8878000	42.0053000
171	Blockbuster Desert Sky Pavillion	Phoenix	2	0	112.2329000	33.4718000
172	San Diego Sports Arena	San Diego	4	0	117.2122000	32.7553000
124	Alfond Arena	Orono	19	0	68.6736000	44.9045000
173	Dean E. Smith Center, University of North Carolina, Chapel Hill	Chapel Hill	33	0	79.0439000	35.8997000
174	Star Lake Amphitheatre	Burgettstown	38	0	80.4340000	40.4201000
175	USAir Arena	Landover	20	0	76.8469000	38.9025000
177	Copps Coliseum	Hamilton, Ontario	-1	1	-79.8725693	43.2595260
178	St. Louis Arena	St. Louis	25	0	-90.2820205	38.6301650
179	Raceway Park	Englishtown	30	0	-74.3515585	40.3344630
180	Paramount Theatre	Seattle	47	0	-122.3317273	47.6134790
181	Los Angeles Memorial Coliseum	Los Angeles	4	0	118.2878000	34.0142000
182	Activity Center, Arizona State University	Tempe	2	0	-111.9310057	33.4245040
183	University Arena, University of New Mexico	 Albuquerque	31	0	-106.6307743	35.0683790
184	 Lloyd Noble Center, University of Oklahoma	Norman	36	0	-97.4438342	35.1874010
185	Hofheinz Pavilion, University of Houston	Houston	43	0	-95.3470978	29.7244150
186	Moody Coliseum, Southern Methodist University	Dallas	43	0	-96.7816540	32.8404650
187	Broome County Veterans Memorial Arena	Binghamton	32	0	-75.9131965	42.0956550
188	Cotterell Court, Colgate University	Hamilton	32	0	-75.5364956	42.8183250
189	Seneca Field House, Seneca College	Toronto, Ontario	-1	1	-79.3496186	43.7951470
190	Assembly Hall, Indiana University	Bloomington	14	0	-86.5221551	39.1807360
191	Assembly Center, Louisiana State University	Baton Rouge	18	0	-91.1846995	30.4130640
192	Boutwell Memorial Auditorium	Birmingham	0	0	-86.8113629	33.5218850
193	Recreation Hall, Penn State University	University Park	38	0	-77.8595396	40.8063320
194	Glens Falls Civic Center	Glens Falls	32	0	-73.6418563	43.3082130
195	Des Moines Civic Center	Des Moines	15	0	-93.6203653	41.5872430
196	Metropolitan Sports Center	Bloomington	23	0	-93.2488459	44.8598140
197	Compton Terrace Amphitheatre	Tempe	2	0	-111.9400054	33.4255100
198	Folsom Field, University of Colorado	Boulder	5	0	-105.2641377	40.0082120
199	Seattle Center Coliseum	Seattle	47	0	-122.3516429	47.6219140
200	Spokane Coliseum	Spokane	47	0	-117.4210952	47.6681050
201	Saenger Theatre	New Orleans	18	0	-90.0727589	29.9561300
202	Florida Gymnasium, University of Florida	Gainesville	9	0	-82.3985345	28.0653430
203	Mill Valley Recreation	Mill Valley	4	0	-122.5282905	37.8992130
204	Pine Knob Music Theatre	Clarkston	22	0	42.7456672	-83.3690980
205	Public Auditorium	Cleveland	35	0	-81.6943888	41.5040530
206	Grand Center	Grand Rapids	22	0	-85.6721449	0.0000000
207	Rheinhalle	Dusseldorf	-1	4	90.5263500	50.2536000
208	Oklahoma City Fairgrounds Arena	Oklahoma City	36	0	98.0000000	35.0000000
209	Capitol Theater	Port Chester	32	0	41.0065000	73.6689000
210	Jahrhunderthalle	Frankfurt	-1	4	42.9876000	65.8765000
211	Oakland-Alameda County Coliseum Stadium	Oakland	4	0	50.0000000	60.0000000
212	Family Dog At The Great Highway	San Francisco	4	0	-0.0000001	0.0000002
213	City Hall	Newcastle upon Tyne	-1	2	68.0000000	68.0000000
214	Golden Hall, Community Concourse	San Diego	4	0	50.0000000	67.0000000
215	Universal Ampitheatre	Universal City	4	0	67.0000000	87.0000000
216	Salt Palace	Salt Lake City	44	0	56.0000000	65.0000000
217	Patrick Gymnasium, University of Vermont	Burlington	45	0	\N	\N
218	Veterans Memorial Coliseum	New Haven	6	0	56.0000000	76.0000000
219	Portland International Speedway	Portland	37	0	478.7880000	717.8780000
176	War Memorial Auditorium	Buffalo	32	0	-78.8570483	42.9056770
220	Philadelphia Civic Center	Philadelphia	38	0	122.2220000	222.0000000
221	Soldier's And Sailors Memorial Hall 	Kansas City	16	0	111.1110000	222.2220000
222	Holleder Stadium	Rochester	32	0	111.1110000	222.2220000
223	Holleder Memorial Stadium	Rochester	32	0	111.1110000	222.2220000
224	San Francisco Civic Center	San Francisco	4	0	111.1110000	222.2220000
225	Fieldhouse, University of Iowa	Iowa City	15	0	111.1111000	222.2222000
226	The Palestra - University of Rochester	Rochester	32	0	50.0000000	50.0000000
227	Maine State Fairgrounds	Lewistown	19	0	50.0000000	50.0000000
228	Fox Theatre	St. Louis	25	0	111.1111000	222.2222000
142	Electric Factory	Philadelphia	38	0	-75.1500189	39.9589270
100	Philadelphia Convention Hall and Civic Center	Philadelphia	38	0	-75.1949377	39.9472880
229	Anaheim Stadium	Anaheim	4	0	111.1110000	222.2220000
232	Cobo Arena	Detroit	22	0	111.1110000	222.2220000
233	Huntington Civic Center	Huntington	48	0	111.1110000	222.2220000
234	Shrine Auditorium	Los Angeles	4	0	111.1110000	222.1110000
235	Sacramento Memorial Auditorium	Sacramento	4	0	50.0000000	50.0000000
236	Zenith	Paris	-1	3	50.0000000	50.0000000
237	Pauley Pavilion, University of California, Los Angeles	Los Angeles	4	0	-111.1110000	-222.2220000
239	The Downs at Santa Fe	Santa Fe	31	0	-111.1110000	-222.2220000
240	Long Beach Arena	Long Beach	4	0	49.9999999	50.0000000
241	Alumni Stadium, University of Massachusetts	Amherst	21	0	-0.0000001	-0.0000001
242	Austin Municipal Auditorium	Austin	43	0	50.0000000	48.0000000
243	Fillmore East	New York	32	0	50.0250000	50.2500000
244	Feyline Field	Tempe	2	0	55.2530000	55.2510000
245	Calavaras County Fairgrounds	Angel's Camp	4	0	50.2500000	50.2500000
246	Felt Forum	New York City	32	0	49.9999999	50.0000000
247	Seminole Indian Village	West Hollywood	9	0	0.0000001	-0.0000001
248	Manhattan Center	New York	32	0	-0.0000001	-0.0000001
249	Scope	Norfolk	46	0	-0.0000002	0.0000001
250	Reunion Arena	Dallas	43	0	-0.0000001	0.0000001
251	Starlight Theatre	Kansas City	25	0	49.9999999	50.0000000
254	UniDome - University of Northern Iowa	Cedar Falls	15	0	50.0000000	50.0000000
255	Maples Pavilion, Stanford University	Palo Alto	4	0	111.1111000	222.2222000
256	Hara Arena	Dayton	35	0	111.1111000	222.2222000
257	Cleveland Music Hall	Cleveland	35	0	50.0000000	50.0000000
259	Horton Field House, Illinois State University	Normal	13	0	111.1111000	222.2222000
260	Rupert Thompson Arena, Dartmouth College	Hanover	29	0	0.9999997	-0.0000001
261	Oxford Plains Speedway	Oxford	19	0	50.2500000	50.2500000
262	Laguna Seca Raceway	Monterey	4	0	50.2500000	50.2500000
263	RPI Field House	Troy	32	0	-0.0000001	-0.0000001
264	Bayfront Center	St. Petersburg	9	0	-0.0000001	0.0000002
265	Oakland Auditorium	Oakland	4	0	50.2500000	50.2500000
266	Dream Bowl	Vallejo	4	0	50.0000000	50.3000000
267	Pershing Municipal Auditorium	Lincoln	27	0	50.2500000	50.2500000
\.


--
-- Name: venues_venue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pigpen
--

SELECT pg_catalog.setval('venues_venue_id_seq', 267, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shows_playedset_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY shows_playedset
    ADD CONSTRAINT shows_playedset_pkey PRIMARY KEY (id);


--
-- Name: shows_playedsong_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY shows_playedsong
    ADD CONSTRAINT shows_playedsong_pkey PRIMARY KEY (id);


--
-- Name: shows_show_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY shows_show
    ADD CONSTRAINT shows_show_pkey PRIMARY KEY (id);


--
-- Name: shows_showdate_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY shows_showdate
    ADD CONSTRAINT shows_showdate_pkey PRIMARY KEY (id);


--
-- Name: songs_alternatename_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY songs_alternatename
    ADD CONSTRAINT songs_alternatename_pkey PRIMARY KEY (id);


--
-- Name: songs_song_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY songs_song
    ADD CONSTRAINT songs_song_pkey PRIMARY KEY (id);


--
-- Name: tours_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY tours_tour
    ADD CONSTRAINT tours_tour_pkey PRIMARY KEY (id);


--
-- Name: venues_venue_pkey; Type: CONSTRAINT; Schema: public; Owner: pigpen; Tablespace: 
--

ALTER TABLE ONLY venues_venue
    ADD CONSTRAINT venues_venue_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shows_playedset_f93f0926; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX shows_playedset_f93f0926 ON shows_playedset USING btree (show_id);


--
-- Name: shows_playedsong_e5c27d73; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX shows_playedsong_e5c27d73 ON shows_playedsong USING btree (song_id);


--
-- Name: shows_playedsong_ec9b1e6e; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX shows_playedsong_ec9b1e6e ON shows_playedsong USING btree (played_set_id);


--
-- Name: shows_show_f3a4803c; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX shows_show_f3a4803c ON shows_show USING btree (venue_id);


--
-- Name: shows_show_f60fa4d8; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX shows_show_f60fa4d8 ON shows_show USING btree (date_id);


--
-- Name: songs_alternatename_e5c27d73; Type: INDEX; Schema: public; Owner: pigpen; Tablespace: 
--

CREATE INDEX songs_alternatename_e5c27d73 ON songs_alternatename USING btree (song_id);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shows_playe_played_set_id_9c0c68ae9bc0563_fk_shows_playedset_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_playedsong
    ADD CONSTRAINT shows_playe_played_set_id_9c0c68ae9bc0563_fk_shows_playedset_id FOREIGN KEY (played_set_id) REFERENCES shows_playedset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shows_playedset_show_id_4c347cbded27bbca_fk_shows_show_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_playedset
    ADD CONSTRAINT shows_playedset_show_id_4c347cbded27bbca_fk_shows_show_id FOREIGN KEY (show_id) REFERENCES shows_show(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shows_playedsong_song_id_677dc2377981cb02_fk_songs_song_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_playedsong
    ADD CONSTRAINT shows_playedsong_song_id_677dc2377981cb02_fk_songs_song_id FOREIGN KEY (song_id) REFERENCES songs_song(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shows_show_date_id_b36bd7ee1b3e98a_fk_shows_showdate_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_show
    ADD CONSTRAINT shows_show_date_id_b36bd7ee1b3e98a_fk_shows_showdate_id FOREIGN KEY (date_id) REFERENCES shows_showdate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shows_show_venue_id_48b275b01e0e5552_fk_venues_venue_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY shows_show
    ADD CONSTRAINT shows_show_venue_id_48b275b01e0e5552_fk_venues_venue_id FOREIGN KEY (venue_id) REFERENCES venues_venue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: songs_alternatename_song_id_735fac071932ef36_fk_songs_song_id; Type: FK CONSTRAINT; Schema: public; Owner: pigpen
--

ALTER TABLE ONLY songs_alternatename
    ADD CONSTRAINT songs_alternatename_song_id_735fac071932ef36_fk_songs_song_id FOREIGN KEY (song_id) REFERENCES songs_song(id) DEFERRABLE INITIALLY DEFERRED;


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

