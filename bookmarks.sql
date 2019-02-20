--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_contact; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.account_contact (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    user_from_id integer NOT NULL,
    user_to_id integer NOT NULL
);


ALTER TABLE public.account_contact OWNER TO django;

--
-- Name: account_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.account_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_contact_id_seq OWNER TO django;

--
-- Name: account_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.account_contact_id_seq OWNED BY public.account_contact.id;


--
-- Name: account_profile; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.account_profile (
    id integer NOT NULL,
    dob date,
    photo character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_profile OWNER TO django;

--
-- Name: account_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.account_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_profile_id_seq OWNER TO django;

--
-- Name: account_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.account_profile_id_seq OWNED BY public.account_profile.id;


--
-- Name: actions_action; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.actions_action (
    id integer NOT NULL,
    verb character varying(255) NOT NULL,
    target_id integer,
    created timestamp with time zone NOT NULL,
    target_ct_id integer,
    user_id integer NOT NULL,
    CONSTRAINT actions_action_target_id_check CHECK ((target_id >= 0))
);


ALTER TABLE public.actions_action OWNER TO django;

--
-- Name: actions_action_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.actions_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_action_id_seq OWNER TO django;

--
-- Name: actions_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.actions_action_id_seq OWNED BY public.actions_action.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO django;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO django;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO django;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO django;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO django;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django;

--
-- Name: images_image; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.images_image (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    url character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    created date NOT NULL,
    user_id integer NOT NULL,
    total_likes integer NOT NULL,
    CONSTRAINT images_image_total_likes_check CHECK ((total_likes >= 0))
);


ALTER TABLE public.images_image OWNER TO django;

--
-- Name: images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.images_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_image_id_seq OWNER TO django;

--
-- Name: images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.images_image_id_seq OWNED BY public.images_image.id;


--
-- Name: images_image_users_like; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.images_image_users_like (
    id integer NOT NULL,
    image_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.images_image_users_like OWNER TO django;

--
-- Name: images_image_users_like_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.images_image_users_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_image_users_like_id_seq OWNER TO django;

--
-- Name: images_image_users_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.images_image_users_like_id_seq OWNED BY public.images_image_users_like.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO django;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO django;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO django;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO django;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO django;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO django;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO django;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO django;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO django;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO django;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO django;

--
-- Name: account_contact id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.account_contact ALTER COLUMN id SET DEFAULT nextval('public.account_contact_id_seq'::regclass);


--
-- Name: account_profile id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.account_profile ALTER COLUMN id SET DEFAULT nextval('public.account_profile_id_seq'::regclass);


--
-- Name: actions_action id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.actions_action ALTER COLUMN id SET DEFAULT nextval('public.actions_action_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: images_image id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.images_image ALTER COLUMN id SET DEFAULT nextval('public.images_image_id_seq'::regclass);


--
-- Name: images_image_users_like id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.images_image_users_like ALTER COLUMN id SET DEFAULT nextval('public.images_image_users_like_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: account_contact; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.account_contact (id, created, user_from_id, user_to_id) FROM stdin;
1	2019-01-02 23:04:54.275632-08	1	2
2	2019-01-02 23:06:07.798746-08	2	1
\.


--
-- Data for Name: account_profile; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.account_profile (id, dob, photo, user_id) FROM stdin;
1	2018-08-07	users/2018/12/29/384085_10150461569032261_1851179208_n.jpg	1
2	2018-07-11	users/2019/01/02/IMG_20180501_230710.jpg	2
3	\N	users/2019/01/03/2011-06-12_23.04.39.jpg	3
\.


--
-- Data for Name: actions_action; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.actions_action (id, verb, target_id, created, target_ct_id, user_id) FROM stdin;
1	has created an account	\N	2019-01-03 07:59:50.00728-08	\N	3
2	likes	2	2019-01-03 08:06:50.481914-08	13	3
3	likes	9	2019-01-03 08:07:18.353316-08	13	1
4	bookmarked image	10	2019-01-03 10:18:30.708729-08	13	2
5	likes	10	2019-01-03 10:18:37.431612-08	13	2
6	bookmarked image	11	2019-01-03 10:33:38.786054-08	13	2
7	likes	11	2019-01-03 10:33:43.788542-08	13	2
8	bookmarked image	12	2019-01-03 10:34:17.199463-08	13	2
9	bookmarked image	13	2019-01-03 10:37:11.172956-08	13	3
10	likes	13	2019-01-03 10:37:35.800847-08	13	1
11	likes	13	2019-01-03 10:38:02.394088-08	13	3
12	likes	10	2019-01-03 11:23:16.062593-08	13	1
13	likes	13	2019-01-03 11:26:02.066742-08	13	2
14	likes	12	2019-01-03 12:16:39.385526-08	13	1
15	bookmarked image	14	2019-01-04 10:55:35.248448-08	13	1
16	likes	14	2019-01-04 10:55:44.469944-08	13	1
17	likes	14	2019-01-04 10:56:30.51582-08	13	2
18	likes	1	2019-01-04 10:57:20.801162-08	13	2
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add profile	1	add_profile
2	Can change profile	1	change_profile
3	Can delete profile	1	delete_profile
4	Can view profile	1	view_profile
5	Can add log entry	2	add_logentry
6	Can change log entry	2	change_logentry
7	Can delete log entry	2	delete_logentry
8	Can view log entry	2	view_logentry
9	Can add permission	3	add_permission
10	Can change permission	3	change_permission
11	Can delete permission	3	delete_permission
12	Can view permission	3	view_permission
13	Can add group	4	add_group
14	Can change group	4	change_group
15	Can delete group	4	delete_group
16	Can view group	4	view_group
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add association	8	add_association
30	Can change association	8	change_association
31	Can delete association	8	delete_association
32	Can view association	8	view_association
33	Can add code	9	add_code
34	Can change code	9	change_code
35	Can delete code	9	delete_code
36	Can view code	9	view_code
37	Can add nonce	10	add_nonce
38	Can change nonce	10	change_nonce
39	Can delete nonce	10	delete_nonce
40	Can view nonce	10	view_nonce
41	Can add user social auth	11	add_usersocialauth
42	Can change user social auth	11	change_usersocialauth
43	Can delete user social auth	11	delete_usersocialauth
44	Can view user social auth	11	view_usersocialauth
45	Can add partial	12	add_partial
46	Can change partial	12	change_partial
47	Can delete partial	12	delete_partial
48	Can view partial	12	view_partial
49	Can add image	13	add_image
50	Can change image	13	change_image
51	Can delete image	13	delete_image
52	Can view image	13	view_image
53	Can add kv store	14	add_kvstore
54	Can change kv store	14	change_kvstore
55	Can delete kv store	14	delete_kvstore
56	Can view kv store	14	view_kvstore
57	Can add contact	15	add_contact
58	Can change contact	15	change_contact
59	Can delete contact	15	delete_contact
60	Can view contact	15	view_contact
61	Can add action	16	add_action
62	Can change action	16	change_action
63	Can delete action	16	delete_action
64	Can view action	16	view_action
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$120000$fJh1mCk8NsEM$ebi1v3IB1YEE3Xs5uGoP6o2YBcbZkl9hqp4WVdlkeug=	2019-01-03 10:37:55.54176-08	f	shalabh	Shalabh	Kumar	shalabh@gmail.com	f	t	2019-01-03 07:59:49.8085-08
1	pbkdf2_sha256$120000$WSMbMkxiuUHv$csr6sPtL67Su4RD7D1mSEpejq73eGTmWyte+Bl2fE6E=	2019-01-04 10:54:10.24803-08	t	aman	Aman	Srivastava	amanprodigy@gmail.com	t	t	2018-12-27 03:06:31.017628-08
2	pbkdf2_sha256$120000$rEMKjr9opKwZ$7FHRTOgEgB2ScVZ/tgS1ND6Ubop/xW222sHtNQvfMV4=	2019-01-04 10:56:08.058531-08	f	richa	Richa	Raj	richa.raj7838@gmail.com	f	t	2019-01-02 02:09:23-08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-12-27 03:06:47.300336-08	1	Profile for user aman	1	[{"added": {}}]	1	1
2	2019-01-02 00:47:46.652663-08	6	Wikipedia, the free encyclopedia	3		13	1
3	2019-01-02 00:47:46.659342-08	5	Wikipedia, the free encyclopedia	3		13	1
4	2019-01-02 00:47:46.661217-08	4	Wikipedia, the free encyclopedia	3		13	1
5	2019-01-02 00:47:46.662636-08	3	Wikipedia, the free encyclopedia	3		13	1
6	2019-01-02 02:09:23.202491-08	2	richa	1	[{"added": {}}]	5	1
7	2019-01-02 02:11:17.861931-08	2	richa	2	[{"changed": {"fields": ["first_name", "last_name", "email"]}}]	5	1
8	2019-01-02 02:12:14.402689-08	2	Profile for user richa	1	[{"added": {}}]	1	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	account	profile
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	social_django	association
9	social_django	code
10	social_django	nonce
11	social_django	usersocialauth
12	social_django	partial
13	images	image
14	thumbnail	kvstore
15	account	contact
16	actions	action
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-12-27 03:05:56.202581-08
2	auth	0001_initial	2018-12-27 03:05:56.307583-08
3	account	0001_initial	2018-12-27 03:05:56.36528-08
4	admin	0001_initial	2018-12-27 03:05:56.389034-08
5	admin	0002_logentry_remove_auto_add	2018-12-27 03:05:56.39845-08
6	admin	0003_logentry_add_action_flag_choices	2018-12-27 03:05:56.408712-08
7	contenttypes	0002_remove_content_type_name	2018-12-27 03:05:56.435438-08
8	auth	0002_alter_permission_name_max_length	2018-12-27 03:05:56.441623-08
9	auth	0003_alter_user_email_max_length	2018-12-27 03:05:56.451869-08
10	auth	0004_alter_user_username_opts	2018-12-27 03:05:56.46251-08
11	auth	0005_alter_user_last_login_null	2018-12-27 03:05:56.480024-08
12	auth	0006_require_contenttypes_0002	2018-12-27 03:05:56.485072-08
13	auth	0007_alter_validators_add_error_messages	2018-12-27 03:05:56.495524-08
14	auth	0008_alter_user_username_max_length	2018-12-27 03:05:56.512018-08
15	auth	0009_alter_user_last_name_max_length	2018-12-27 03:05:56.527305-08
16	sessions	0001_initial	2018-12-27 03:05:56.538509-08
17	default	0001_initial	2018-12-28 21:26:47.856108-08
18	social_auth	0001_initial	2018-12-28 21:26:47.858791-08
19	default	0002_add_related_name	2018-12-28 21:26:47.896539-08
20	social_auth	0002_add_related_name	2018-12-28 21:26:47.898468-08
21	default	0003_alter_email_max_length	2018-12-28 21:26:47.90512-08
22	social_auth	0003_alter_email_max_length	2018-12-28 21:26:47.907056-08
23	default	0004_auto_20160423_0400	2018-12-28 21:26:47.920838-08
24	social_auth	0004_auto_20160423_0400	2018-12-28 21:26:47.923877-08
25	social_auth	0005_auto_20160727_2333	2018-12-28 21:26:47.930098-08
26	social_django	0006_partial	2018-12-28 21:26:47.94593-08
27	social_django	0007_code_timestamp	2018-12-28 21:26:47.963337-08
28	social_django	0008_partial_timestamp	2018-12-28 21:26:47.978556-08
29	social_django	0003_alter_email_max_length	2018-12-28 21:26:47.982663-08
30	social_django	0001_initial	2018-12-28 21:26:48.00875-08
31	social_django	0005_auto_20160727_2333	2018-12-28 21:26:48.010475-08
32	social_django	0002_add_related_name	2018-12-28 21:26:48.012249-08
33	social_django	0004_auto_20160423_0400	2018-12-28 21:26:48.01388-08
34	images	0001_initial	2019-01-01 08:58:50.362861-08
35	thumbnail	0001_initial	2019-01-02 00:56:18.381843-08
36	account	0002_contact	2019-01-02 05:44:00.354433-08
37	auth	0010_user_following	2019-01-02 05:44:00.368833-08
38	actions	0001_initial	2019-01-03 03:18:24.801031-08
39	images	0002_image_total_likes	2019-01-03 11:11:16.07127-08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
vbq1ovlb6pzctpqf6nsw6uz578laetmu	ZWIwZDRhMjVmMTFjOWUyNGNhYzYyZDBlNDNjZGJlZDAwMjk0NGVlYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOWI5MTJiNTAyZjkzMGIwMDhjZDQ1ZjBiNjc3NmFlMTM5ODNlMTY3In0=	2019-01-17 20:48:20.460566-08
6pmd41ofw1iq8qikdy5mdta7vfk4k71t	MzgxNmNkZjFlMTkzZDBhNWRiOGY5YjVmMTQ1YjRhYzhkY2Y3OTk5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTFiNjU2NzFlNTFlNmQzZGE4NzdjNTkwZjk2ZGY2ZjI3OTBjZTY3In0=	2019-01-18 10:56:08.070629-08
aky9dvgrwub938hyu20ux13pjsooeqwi	NmJhNWQzNTRlYzQ5ODA5ZDMxYmIzZTkzNzg4NzRmN2E0ZjVkZjMzYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWNjb3VudC5hdXRoZW50aWNhdGlvbi5FbWFpbEF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTliOTEyYjUwMmY5MzBiMDA4Y2Q0NWYwYjY3NzZhZTEzOTgzZTE2NyJ9	2019-01-11 21:21:34.004753-08
cuqv8v5x37sz3wk9sy3kn2pvjletcl2n	OTMwZDZmYzEyZDdjYjc5MDhmYzZmNTY2YTZhZTBmMGZkYmEwODY4Njp7ImZhY2Vib29rX3N0YXRlIjoiR0NQeVFYb3RTa002WTlCekR3RkZLTTNhNG01ZU5BODgifQ==	2019-01-11 22:34:37.724969-08
y2b5jlhkak3bhqrtwwtlz6d2xs9pa1bx	ZWIwZDRhMjVmMTFjOWUyNGNhYzYyZDBlNDNjZGJlZDAwMjk0NGVlYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOWI5MTJiNTAyZjkzMGIwMDhjZDQ1ZjBiNjc3NmFlMTM5ODNlMTY3In0=	2019-01-15 23:55:12.136361-08
9nbpm1omdsnlau1xdvn36vnsypclt6uj	ZWIwZDRhMjVmMTFjOWUyNGNhYzYyZDBlNDNjZGJlZDAwMjk0NGVlYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhOWI5MTJiNTAyZjkzMGIwMDhjZDQ1ZjBiNjc3NmFlMTM5ODNlMTY3In0=	2019-01-17 11:24:49.129465-08
r1fjtpjhrzuc80i3suol3dalicf3m3mb	MzgxNmNkZjFlMTkzZDBhNWRiOGY5YjVmMTQ1YjRhYzhkY2Y3OTk5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTFiNjU2NzFlNTFlNmQzZGE4NzdjNTkwZjk2ZGY2ZjI3OTBjZTY3In0=	2019-01-17 11:25:55.580037-08
\.


--
-- Data for Name: images_image; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.images_image (id, title, slug, url, image, description, created, user_id, total_likes) FROM stdin;
10	Infographic - Quick Guide to learn Python for Data Science	infographic-quick-guide-to-learn-python-for-data-science	https://s3-ap-south-1.amazonaws.com/av-blog-media/wp-content/uploads/2018/01/170523_AlphaGO_NS_00101-262x141.jpg	images/2019/01/03/infographic-quick-guide-to-learn-python-for-data-science.jpg	Data science rubics cube	2019-01-03	2	2
2	Wikipedia, the free encyclopedia	wikipedia-the-free-encyclopedia	http://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Passerina_leclancherii_%28mirrored%29.jpg/160px-Passerina_leclancherii_%28mirrored%29.jpg	images/2019/01/02/wikipedia-the-free-encyclopedia.jpg	Colorful bird	2019-01-02	1	2
7	Australian raven - Wikipedia	australian-raven-wikipedia	http://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Australian_Raven_charleville.ogv/220px-seek%3D5-Australian_Raven_charleville.ogv.jpg	images/2019/01/02/australian-raven-wikipedia.jpg	Australian Raven	2019-01-02	1	1
8	File:Portrait of ASTP crews - restoration.jpg - Wikimedia Commons	fileportrait-of-astp-crews-restorationjpg-wikimedia-commons	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Portrait_of_ASTP_crews_-_restoration.jpg/749px-Portrait_of_ASTP_crews_-_restoration.jpg	images/2019/01/02/fileportrait-of-astp-crews-restorationjpg-wikimedia-commons.jpg	NASA ASTP Crews	2019-01-02	1	2
9	Images Bazaar: Largest Collection of Indian Images and Videos	images-bazaar-largest-collection-of-indian-images-and-videos	https://ibcdn.imagesbazaar.com/Html2019/homecat/images/Friends.jpg	images/2019/01/02/images-bazaar-largest-collection-of-indian-images-and-videos.jpg	images bazaar employees	2019-01-02	2	2
11	Infographic - Quick Guide to learn Python for Data Science	infographic-quick-guide-to-learn-python-for-data-science	https://www.analyticsvidhya.com/wp-content/uploads/2015/06/222-262x141.jpg	images/2019/01/03/infographic-quick-guide-to-learn-python-for-data-science_bUy2dit.jpg	Must read books on data science	2019-01-03	2	1
13	Ronaldo (Brazilian footballer) - Wikipedia	ronaldo-brazilian-footballer-wikipedia	http://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Ronaldo_Cannes.jpg/170px-Ronaldo_Cannes.jpg	images/2019/01/03/ronaldo-brazilian-footballer-wikipedia.jpg	Ronaldo phenomenon	2019-01-03	3	2
12	Infographic - Quick Guide to learn Python for Data Science	infographic-quick-guide-to-learn-python-for-data-science	https://www.analyticsvidhya.com/wp-content/uploads/2015/05/final-1.jpg	images/2019/01/03/infographic-quick-guide-to-learn-python-for-data-science_1cxBxpk.jpg	Infographic of learning data science in python	2019-01-03	2	1
14	Cake - Wikipedia	cake-wikipedia	http://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Blood_Orange_Chiffon_Cake_with_Mango_Curd_%28Unsplash%29.jpg/220px-Blood_Orange_Chiffon_Cake_with_Mango_Curd_%28Unsplash%29.jpg	images/2019/01/04/cake-wikipedia.jpg	Two tier White Brown cake	2019-01-04	1	2
1	Messi-Argentina	messi-argentina	https://upload.wikimedia.org/wikipedia/commons/1/15/Messi_vs_Nigeria1.jpg	images/2019/01/01/messi-argentina.jpg	Messi scoring a goal for argentina	2019-01-01	1	1
\.


--
-- Data for Name: images_image_users_like; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.images_image_users_like (id, image_id, user_id) FROM stdin;
5	9	2
6	8	2
7	8	1
8	7	1
9	2	1
10	2	3
11	9	1
12	10	2
13	11	2
14	13	1
15	13	3
16	10	1
18	12	1
19	14	1
20	14	2
21	1	2
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||944ff36671804a4efbf8c6122819b474	{"name": "images/2019/01/02/australian-raven-wikipedia.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [220, 165]}
sorl-thumbnail||image||6a47337cdaf40fb4e445930c3cd50566	{"name": "cache/68/ea/68ea95240bb37d83499f711bc2525611.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 225]}
sorl-thumbnail||image||73bacc58449b331578197dc6752caa2b	{"name": "images/2019/01/02/wikipedia-the-free-encyclopedia.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [160, 120]}
sorl-thumbnail||image||ac2153165d441873d80fa6bb0970832d	{"name": "cache/07/2e/072efbadbde2397f76a03f0bea61f4c6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 225]}
sorl-thumbnail||image||5bd22b42df8bfb141ecb0c92436e580e	{"name": "images/2019/01/02/fileportrait-of-astp-crews-restorationjpg-wikimedia-commons.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [748, 599]}
sorl-thumbnail||image||6ed1c346aedf3c07778655e878c9ef36	{"name": "cache/ce/39/ce394787c8693eae62dee04215a8423a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 240]}
sorl-thumbnail||image||58ed7f0cdf7a95527d9246c8fe3f485a	{"name": "images/2019/01/02/images-bazaar-largest-collection-of-indian-images-and-videos.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [210, 212]}
sorl-thumbnail||image||97f219afe4bdb287348906eaf1b33a0e	{"name": "cache/bd/c2/bdc2e9b8d4132cf852f703c03fc12adf.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 303]}
sorl-thumbnail||image||735286a0a383d3034a0d57390cbd20d4	{"name": "images/2019/01/01/messi-argentina.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1500, 1000]}
sorl-thumbnail||image||bb54ead1fc9f896abc9ac3532ff0cdba	{"name": "cache/f2/e7/f2e75c50e5c8be3cd1369f9188583c13.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||image||9a0c82fab28a2a74aca9cc21e359202f	{"name": "cache/64/35/6435fc5cbe8c4e9f7a06f844e39f2b45.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||thumbnails||73bacc58449b331578197dc6752caa2b	["ac2153165d441873d80fa6bb0970832d", "9a0c82fab28a2a74aca9cc21e359202f"]
sorl-thumbnail||image||ee20a6a1a58c572c1123bf61a6276a7f	{"name": "cache/fc/bc/fcbca99ae9c58b1d110ac58d12800846.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||thumbnails||944ff36671804a4efbf8c6122819b474	["ee20a6a1a58c572c1123bf61a6276a7f", "6a47337cdaf40fb4e445930c3cd50566"]
sorl-thumbnail||image||ede4a0df30128cd806eafd520ef39e89	{"name": "cache/0e/be/0ebeea10d2ea8784e7b9636501c6fbca.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||thumbnails||5bd22b42df8bfb141ecb0c92436e580e	["ede4a0df30128cd806eafd520ef39e89", "6ed1c346aedf3c07778655e878c9ef36"]
sorl-thumbnail||image||53edf0a4c056c28a6e216c4e41cee0ea	{"name": "cache/14/b2/14b2e95a09479328feeba11a26444548.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||thumbnails||b9a30e4fe3e1b7708ac41c93ca0efc03	["820485ba1e9221d09634d8a23b99420d", "70b08f972671d465fa24371e08b5c681"]
sorl-thumbnail||image||ea1bc2f031cace616ec552711925c078	{"name": "cache/37/50/3750d52a9d66392b74b382a4a64c31a4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 200]}
sorl-thumbnail||thumbnails||735286a0a383d3034a0d57390cbd20d4	["bb54ead1fc9f896abc9ac3532ff0cdba", "ea1bc2f031cace616ec552711925c078"]
sorl-thumbnail||image||860bdfc15a0c55d4edc6265fa4578a77	{"name": "users/2018/12/29/384085_10150461569032261_1851179208_n.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [229, 263]}
sorl-thumbnail||image||f38a1bb325bf944c709fa9596d17a992	{"name": "cache/1c/65/1c65a638eba1045d1d66cc053db8e63d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 180]}
sorl-thumbnail||image||b9a30e4fe3e1b7708ac41c93ca0efc03	{"name": "users/2019/01/02/IMG_20180501_230710.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [2610, 4640]}
sorl-thumbnail||image||70b08f972671d465fa24371e08b5c681	{"name": "cache/6b/1e/6b1efde20e78e6b7388db36816538021.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 180]}
sorl-thumbnail||image||f1f0632f08420fb29ef44d18b7ed8209	{"name": "cache/b8/df/b8df4af790e62f9aca4729f4f23a17a0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||thumbnails||860bdfc15a0c55d4edc6265fa4578a77	["f38a1bb325bf944c709fa9596d17a992", "f1f0632f08420fb29ef44d18b7ed8209"]
sorl-thumbnail||image||beedac5bf1f86b92aa0626d5398d4886	{"name": "cache/cc/cd/cccd684edc65277241f1ce0fb9ba300b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||thumbnails||58ed7f0cdf7a95527d9246c8fe3f485a	["beedac5bf1f86b92aa0626d5398d4886", "97f219afe4bdb287348906eaf1b33a0e", "53edf0a4c056c28a6e216c4e41cee0ea"]
sorl-thumbnail||image||abdf83912504ce02a51ddeb13e52a78e	{"name": "images/2019/01/03/infographic-quick-guide-to-learn-python-for-data-science.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [262, 141]}
sorl-thumbnail||image||0a289f391a595c21d3b089c87c7f7f12	{"name": "cache/eb/81/eb81dff8168de4a62940225fd6666d43.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [299, 161]}
sorl-thumbnail||image||736dfa801c26e340c2b246de01b9d51d	{"name": "images/2019/01/03/infographic-quick-guide-to-learn-python-for-data-science_bUy2dit.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [262, 141]}
sorl-thumbnail||image||3957465c0d8d42d0c0d60d564ca57a91	{"name": "cache/40/d0/40d02e6a28a939e7dc61ec99e8767426.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [299, 161]}
sorl-thumbnail||thumbnails||abdf83912504ce02a51ddeb13e52a78e	["0a289f391a595c21d3b089c87c7f7f12", "25515094e5787fee4c3ca57fb29226f5", "b4c00357014f6172852b80f3ecc80664"]
sorl-thumbnail||image||2b795e18b5417f20344383e78d7e6f07	{"name": "images/2019/01/03/infographic-quick-guide-to-learn-python-for-data-science_1cxBxpk.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [1000, 3476]}
sorl-thumbnail||image||3181c8787b6f926de8f1e4ed945699f6	{"name": "cache/0c/ac/0cac87d7bb9519f88a845cdf2847606c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 1043]}
sorl-thumbnail||image||820485ba1e9221d09634d8a23b99420d	{"name": "cache/3c/3f/3c3fe318238e66b269190bf53d427bcb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||image||8203338b4061133efe731a37f5822adb	{"name": "cache/29/1b/291b84b1193c722d4d6879ee0699970c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||image||1d644bdf6a8fe7834cdbf0fbc8af7e67	{"name": "cache/9e/04/9e04aa437e8bb7730747dff34e915337.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||image||25515094e5787fee4c3ca57fb29226f5	{"name": "cache/77/16/7716a33ed2f6d57ebef0dc02f11ae3cf.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||image||eed4837768fd0d13725fa88d19b0efe8	{"name": "images/2019/01/03/ronaldo-brazilian-footballer-wikipedia.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [170, 247]}
sorl-thumbnail||image||38bbcf75c4bd4660d664b753335dc1a3	{"name": "cache/62/f5/62f57e4af0993b9c22cf9248745821a5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 436]}
sorl-thumbnail||image||b4c00357014f6172852b80f3ecc80664	{"name": "cache/1f/6e/1f6ec0f06bde16438034d20adadd3be5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||image||208c3460be98d4e6a01e120944f3a11f	{"name": "cache/c1/a9/c1a910cae84dc0140b21924aa30f805c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||thumbnails||736dfa801c26e340c2b246de01b9d51d	["208c3460be98d4e6a01e120944f3a11f", "1d644bdf6a8fe7834cdbf0fbc8af7e67", "3957465c0d8d42d0c0d60d564ca57a91"]
sorl-thumbnail||image||867d21dbe10b6802fa82b391ff9fa201	{"name": "cache/81/f4/81f462a97548cc1688c1eb8945d60ace.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||thumbnails||2b795e18b5417f20344383e78d7e6f07	["3181c8787b6f926de8f1e4ed945699f6", "8203338b4061133efe731a37f5822adb", "867d21dbe10b6802fa82b391ff9fa201"]
sorl-thumbnail||image||15c8049d80dfabaf4161af2bda95b91d	{"name": "cache/47/b0/47b0c1ff726eb0c9e37f4aebd7fc7d09.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||image||2d012f69532379babc05f753a2b81624	{"name": "cache/4b/ca/4bcaf56dfbf7c5ad7d996b1cef7a14e5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||thumbnails||eed4837768fd0d13725fa88d19b0efe8	["38bbcf75c4bd4660d664b753335dc1a3", "15c8049d80dfabaf4161af2bda95b91d", "2d012f69532379babc05f753a2b81624"]
sorl-thumbnail||image||6bdc489f797a3db625ed0f9258c301f6	{"name": "users/2019/01/03/2011-06-12_23.04.39.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [2560, 1920]}
sorl-thumbnail||image||d6f7467ef89acd69e16c89b28f2e26d1	{"name": "cache/48/46/48468caad6cbfd9af9535659b82fa3e6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [180, 180]}
sorl-thumbnail||thumbnails||6bdc489f797a3db625ed0f9258c301f6	["d6f7467ef89acd69e16c89b28f2e26d1"]
sorl-thumbnail||image||123583ea5ac35305ff46db04a931d5ea	{"name": "images/2019/01/04/cake-wikipedia.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [220, 330]}
sorl-thumbnail||image||7c807cb9ae42838b63b8db2b8736bf80	{"name": "cache/cd/2c/cd2cba34bbb05b005e879d2f439b70c1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 450]}
sorl-thumbnail||image||a6ba771bb49ec52a12efac3a17c6c7b5	{"name": "cache/8f/a0/8fa033368604f80a3b67fe70be45666f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [80, 80]}
sorl-thumbnail||image||3ad524e0cc3b0429ebd9ad91b8e489b5	{"name": "cache/00/1c/001c57360dfaf40d565702a89de25cda.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [300, 300]}
sorl-thumbnail||thumbnails||123583ea5ac35305ff46db04a931d5ea	["3ad524e0cc3b0429ebd9ad91b8e489b5", "a6ba771bb49ec52a12efac3a17c6c7b5", "7c807cb9ae42838b63b8db2b8736bf80"]
\.


--
-- Name: account_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.account_contact_id_seq', 2, true);


--
-- Name: account_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.account_profile_id_seq', 3, true);


--
-- Name: actions_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.actions_action_id_seq', 18, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 8, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.images_image_id_seq', 14, true);


--
-- Name: images_image_users_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.images_image_users_like_id_seq', 21, true);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: account_contact account_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.account_contact
    ADD CONSTRAINT account_contact_pkey PRIMARY KEY (id);


--
-- Name: account_profile account_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_pkey PRIMARY KEY (id);


--
-- Name: account_profile account_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_user_id_key UNIQUE (user_id);


--
-- Name: actions_action actions_action_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.actions_action
    ADD CONSTRAINT actions_action_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: images_image images_image_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.images_image
    ADD CONSTRAINT images_image_pkey PRIMARY KEY (id);


--
-- Name: images_image_users_like images_image_users_like_image_id_user_id_ec4f7c0f_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.images_image_users_like
    ADD CONSTRAINT images_image_users_like_image_id_user_id_ec4f7c0f_uniq UNIQUE (image_id, user_id);


--
-- Name: images_image_users_like images_image_users_like_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.images_image_users_like
    ADD CONSTRAINT images_image_users_like_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: account_contact_created_fd56076e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX account_contact_created_fd56076e ON public.account_contact USING btree (created);


--
-- Name: account_contact_user_from_id_5ac376e2; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX account_contact_user_from_id_5ac376e2 ON public.account_contact USING btree (user_from_id);


--
-- Name: account_contact_user_to_id_51f55e86; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX account_contact_user_to_id_51f55e86 ON public.account_contact USING btree (user_to_id);


--
-- Name: actions_action_created_969d29e5; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX actions_action_created_969d29e5 ON public.actions_action USING btree (created);


--
-- Name: actions_action_target_ct_id_63e2300e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX actions_action_target_ct_id_63e2300e ON public.actions_action USING btree (target_ct_id);


--
-- Name: actions_action_target_id_128ce21d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX actions_action_target_id_128ce21d ON public.actions_action USING btree (target_id);


--
-- Name: actions_action_user_id_f34f0949; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX actions_action_user_id_f34f0949 ON public.actions_action USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: images_image_created_7fb4bf39; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX images_image_created_7fb4bf39 ON public.images_image USING btree (created);


--
-- Name: images_image_slug_86cc6ded; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX images_image_slug_86cc6ded ON public.images_image USING btree (slug);


--
-- Name: images_image_slug_86cc6ded_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX images_image_slug_86cc6ded_like ON public.images_image USING btree (slug varchar_pattern_ops);


--
-- Name: images_image_total_likes_ea91e91a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX images_image_total_likes_ea91e91a ON public.images_image USING btree (total_likes);


--
-- Name: images_image_user_id_55499d60; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX images_image_user_id_55499d60 ON public.images_image USING btree (user_id);


--
-- Name: images_image_users_like_image_id_8b6abde8; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX images_image_users_like_image_id_8b6abde8 ON public.images_image_users_like USING btree (image_id);


--
-- Name: images_image_users_like_user_id_72060bdd; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX images_image_users_like_user_id_72060bdd ON public.images_image_users_like USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: account_contact account_contact_user_from_id_5ac376e2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.account_contact
    ADD CONSTRAINT account_contact_user_from_id_5ac376e2_fk_auth_user_id FOREIGN KEY (user_from_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_contact account_contact_user_to_id_51f55e86_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.account_contact
    ADD CONSTRAINT account_contact_user_to_id_51f55e86_fk_auth_user_id FOREIGN KEY (user_to_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_profile account_profile_user_id_bdd52018_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_user_id_bdd52018_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: actions_action actions_action_target_ct_id_63e2300e_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.actions_action
    ADD CONSTRAINT actions_action_target_ct_id_63e2300e_fk_django_content_type_id FOREIGN KEY (target_ct_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: actions_action actions_action_user_id_f34f0949_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.actions_action
    ADD CONSTRAINT actions_action_user_id_f34f0949_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: images_image images_image_user_id_55499d60_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.images_image
    ADD CONSTRAINT images_image_user_id_55499d60_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: images_image_users_like images_image_users_like_image_id_8b6abde8_fk_images_image_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.images_image_users_like
    ADD CONSTRAINT images_image_users_like_image_id_8b6abde8_fk_images_image_id FOREIGN KEY (image_id) REFERENCES public.images_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: images_image_users_like images_image_users_like_user_id_72060bdd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.images_image_users_like
    ADD CONSTRAINT images_image_users_like_user_id_72060bdd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

