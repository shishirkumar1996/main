--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: delete_from_answer_downvotes(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION delete_from_answer_downvotes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
          DELETE FROM answer_downvotes AS ans_down WHERE
          ans_down.user_id = NEW.user_id AND ans_down.answer_id = NEW.answer_id;
          RETURN NEW;
        END;
      $$;


--
-- Name: delete_from_answer_upvotes(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION delete_from_answer_upvotes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
          DELETE FROM answer_upvotes AS ans_up WHERE
          ans_up.user_id = NEW.user_id AND ans_up.answer_id = NEW.answer_id;
          RETURN NEW;
        END;
      $$;


--
-- Name: delete_from_article_downvotes(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION delete_from_article_downvotes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
          DELETE FROM article_downvotes AS art_down WHERE
          art_down.user_id = NEW.user_id AND art_down.article_id = NEW.article_id;
          RETURN NEW;
        END;
      $$;


--
-- Name: delete_from_article_upvotes(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION delete_from_article_upvotes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
          DELETE FROM article_upvotes AS art_up WHERE
          art_up.user_id = NEW.user_id AND art_up.article_id = NEW.article_id;
          RETURN NEW;
        END;
      $$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: academics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE academics (
    id integer NOT NULL,
    institute_id integer,
    student_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: academics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE academics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: academics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE academics_id_seq OWNED BY academics.id;


--
-- Name: answer_bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE answer_bookmarks (
    id integer NOT NULL,
    user_id integer NOT NULL,
    answer_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: answer_bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE answer_bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answer_bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE answer_bookmarks_id_seq OWNED BY answer_bookmarks.id;


--
-- Name: answer_downvotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE answer_downvotes (
    id integer NOT NULL,
    user_id integer,
    answer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: answer_downvotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE answer_downvotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answer_downvotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE answer_downvotes_id_seq OWNED BY answer_downvotes.id;


--
-- Name: answer_replies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE answer_replies (
    id integer NOT NULL,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    answer_id integer,
    user_id integer
);


--
-- Name: answer_replies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE answer_replies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answer_replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE answer_replies_id_seq OWNED BY answer_replies.id;


--
-- Name: answer_upvotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE answer_upvotes (
    id integer NOT NULL,
    user_id integer,
    answer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: answer_upvotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE answer_upvotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answer_upvotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE answer_upvotes_id_seq OWNED BY answer_upvotes.id;


--
-- Name: answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE answers (
    id integer NOT NULL,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    question_id integer,
    anonymous boolean DEFAULT false
);


--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE article_bookmarks (
    id integer NOT NULL,
    user_id integer NOT NULL,
    article_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_bookmarks_id_seq OWNED BY article_bookmarks.id;


--
-- Name: article_downvotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE article_downvotes (
    id integer NOT NULL,
    user_id integer,
    article_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_downvotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_downvotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_downvotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_downvotes_id_seq OWNED BY article_downvotes.id;


--
-- Name: article_replies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE article_replies (
    id integer NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    article_id integer,
    parent_reply_id integer,
    CONSTRAINT article_or_parent_reply_xor CHECK ((((article_id IS NOT NULL) OR (parent_reply_id IS NOT NULL)) AND (NOT ((article_id IS NOT NULL) AND (parent_reply_id IS NOT NULL)))))
);


--
-- Name: article_replies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_replies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_replies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_replies_id_seq OWNED BY article_replies.id;


--
-- Name: article_upvotes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE article_upvotes (
    id integer NOT NULL,
    user_id integer,
    article_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_upvotes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_upvotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_upvotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_upvotes_id_seq OWNED BY article_upvotes.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    article_replies_count integer DEFAULT 0 NOT NULL
);


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: associated_sets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE associated_sets (
    id integer NOT NULL,
    superset_id integer,
    subset_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: associated_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE associated_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: associated_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE associated_sets_id_seq OWNED BY associated_sets.id;


--
-- Name: badgroupanswerrelations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE badgroupanswerrelations (
    id integer NOT NULL,
    user_id integer,
    group_answer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: badgroupanswerrelations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badgroupanswerrelations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badgroupanswerrelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badgroupanswerrelations_id_seq OWNED BY badgroupanswerrelations.id;


--
-- Name: badgrouparticlerelations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE badgrouparticlerelations (
    id integer NOT NULL,
    user_id integer,
    group_article_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: badgrouparticlerelations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badgrouparticlerelations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badgrouparticlerelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badgrouparticlerelations_id_seq OWNED BY badgrouparticlerelations.id;


--
-- Name: ckeditor_assets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ckeditor_assets (
    id integer NOT NULL,
    data_file_name character varying NOT NULL,
    data_content_type character varying,
    data_file_size integer,
    type character varying(30),
    width integer,
    height integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ckeditor_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ckeditor_assets_id_seq OWNED BY ckeditor_assets.id;


--
-- Name: domains; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE domains (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    available boolean DEFAULT true,
    locked boolean DEFAULT false,
    image character varying
);


--
-- Name: domains_articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE domains_articles (
    id integer NOT NULL,
    domain_id integer,
    article_id integer
);


--
-- Name: domains_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domains_articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domains_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domains_articles_id_seq OWNED BY domains_articles.id;


--
-- Name: domains_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domains_id_seq OWNED BY domains.id;


--
-- Name: domains_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE domains_questions (
    id integer NOT NULL,
    domain_id integer,
    question_id integer
);


--
-- Name: domains_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domains_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domains_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domains_questions_id_seq OWNED BY domains_questions.id;


--
-- Name: group_articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE group_articles (
    id integer NOT NULL,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    group_id integer
);


--
-- Name: group_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE group_articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE group_articles_id_seq OWNED BY group_articles.id;


--
-- Name: group_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE group_questions (
    id integer NOT NULL,
    title character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    group_id integer
);


--
-- Name: group_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE group_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE group_questions_id_seq OWNED BY group_questions.id;


--
-- Name: groupanswerrelations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE groupanswerrelations (
    id integer NOT NULL,
    user_id integer,
    group_answer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: groupanswerrelations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groupanswerrelations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groupanswerrelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groupanswerrelations_id_seq OWNED BY groupanswerrelations.id;


--
-- Name: groupanswers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE groupanswers (
    id integer NOT NULL,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    group_question_id integer
);


--
-- Name: groupanswers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groupanswers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groupanswers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groupanswers_id_seq OWNED BY groupanswers.id;


--
-- Name: grouparticlerelations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE grouparticlerelations (
    id integer NOT NULL,
    user_id integer,
    group_article_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: grouparticlerelations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grouparticlerelations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grouparticlerelations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grouparticlerelations_id_seq OWNED BY grouparticlerelations.id;


--
-- Name: grouparticlereplies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE grouparticlereplies (
    id integer NOT NULL,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    group_article_id integer
);


--
-- Name: grouparticlereplies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grouparticlereplies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grouparticlereplies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grouparticlereplies_id_seq OWNED BY grouparticlereplies.id;


--
-- Name: groupquestionreplies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE groupquestionreplies (
    id integer NOT NULL,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    groupanswer_id integer
);


--
-- Name: groupquestionreplies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groupquestionreplies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groupquestionreplies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groupquestionreplies_id_seq OWNED BY groupquestionreplies.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE groups_users (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: groups_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groups_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groups_users_id_seq OWNED BY groups_users.id;


--
-- Name: institutes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE institutes (
    id integer NOT NULL,
    name character varying,
    domain_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: institutes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE institutes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: institutes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE institutes_id_seq OWNED BY institutes.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notifications (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    recipient_id integer NOT NULL,
    read_at timestamp without time zone,
    article_reply_id integer,
    answer_reply_id integer,
    answer_id integer,
    user_following_id integer
);


--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: question_bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE question_bookmarks (
    id integer NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: question_bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE question_bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question_bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE question_bookmarks_id_seq OWNED BY question_bookmarks.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE questions (
    id integer NOT NULL,
    title character varying,
    description text,
    anonymous boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    answers_count integer DEFAULT 0 NOT NULL
);


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE relationships (
    id integer NOT NULL,
    follower_id integer,
    followed_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE relationships_id_seq OWNED BY relationships.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: search_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE search_products (
    id integer NOT NULL,
    term character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: search_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE search_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: search_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE search_products_id_seq OWNED BY search_products.id;


--
-- Name: user_interests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_interests (
    id integer NOT NULL,
    user_id integer NOT NULL,
    domain_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_interests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_interests_id_seq OWNED BY user_interests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    oauth_token character varying,
    oauth_expires_at timestamp without time zone,
    uid character varying,
    remember_digest character varying,
    admin boolean DEFAULT false,
    image character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: academics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY academics ALTER COLUMN id SET DEFAULT nextval('academics_id_seq'::regclass);


--
-- Name: answer_bookmarks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_bookmarks ALTER COLUMN id SET DEFAULT nextval('answer_bookmarks_id_seq'::regclass);


--
-- Name: answer_downvotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_downvotes ALTER COLUMN id SET DEFAULT nextval('answer_downvotes_id_seq'::regclass);


--
-- Name: answer_replies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_replies ALTER COLUMN id SET DEFAULT nextval('answer_replies_id_seq'::regclass);


--
-- Name: answer_upvotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_upvotes ALTER COLUMN id SET DEFAULT nextval('answer_upvotes_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: article_bookmarks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_bookmarks ALTER COLUMN id SET DEFAULT nextval('article_bookmarks_id_seq'::regclass);


--
-- Name: article_downvotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_downvotes ALTER COLUMN id SET DEFAULT nextval('article_downvotes_id_seq'::regclass);


--
-- Name: article_replies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_replies ALTER COLUMN id SET DEFAULT nextval('article_replies_id_seq'::regclass);


--
-- Name: article_upvotes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_upvotes ALTER COLUMN id SET DEFAULT nextval('article_upvotes_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: associated_sets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY associated_sets ALTER COLUMN id SET DEFAULT nextval('associated_sets_id_seq'::regclass);


--
-- Name: badgroupanswerrelations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badgroupanswerrelations ALTER COLUMN id SET DEFAULT nextval('badgroupanswerrelations_id_seq'::regclass);


--
-- Name: badgrouparticlerelations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badgrouparticlerelations ALTER COLUMN id SET DEFAULT nextval('badgrouparticlerelations_id_seq'::regclass);


--
-- Name: ckeditor_assets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ckeditor_assets ALTER COLUMN id SET DEFAULT nextval('ckeditor_assets_id_seq'::regclass);


--
-- Name: domains id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains ALTER COLUMN id SET DEFAULT nextval('domains_id_seq'::regclass);


--
-- Name: domains_articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains_articles ALTER COLUMN id SET DEFAULT nextval('domains_articles_id_seq'::regclass);


--
-- Name: domains_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains_questions ALTER COLUMN id SET DEFAULT nextval('domains_questions_id_seq'::regclass);


--
-- Name: group_articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_articles ALTER COLUMN id SET DEFAULT nextval('group_articles_id_seq'::regclass);


--
-- Name: group_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_questions ALTER COLUMN id SET DEFAULT nextval('group_questions_id_seq'::regclass);


--
-- Name: groupanswerrelations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupanswerrelations ALTER COLUMN id SET DEFAULT nextval('groupanswerrelations_id_seq'::regclass);


--
-- Name: groupanswers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupanswers ALTER COLUMN id SET DEFAULT nextval('groupanswers_id_seq'::regclass);


--
-- Name: grouparticlerelations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY grouparticlerelations ALTER COLUMN id SET DEFAULT nextval('grouparticlerelations_id_seq'::regclass);


--
-- Name: grouparticlereplies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY grouparticlereplies ALTER COLUMN id SET DEFAULT nextval('grouparticlereplies_id_seq'::regclass);


--
-- Name: groupquestionreplies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupquestionreplies ALTER COLUMN id SET DEFAULT nextval('groupquestionreplies_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: groups_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups_users ALTER COLUMN id SET DEFAULT nextval('groups_users_id_seq'::regclass);


--
-- Name: institutes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY institutes ALTER COLUMN id SET DEFAULT nextval('institutes_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: question_bookmarks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY question_bookmarks ALTER COLUMN id SET DEFAULT nextval('question_bookmarks_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: relationships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY relationships ALTER COLUMN id SET DEFAULT nextval('relationships_id_seq'::regclass);


--
-- Name: search_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY search_products ALTER COLUMN id SET DEFAULT nextval('search_products_id_seq'::regclass);


--
-- Name: user_interests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_interests ALTER COLUMN id SET DEFAULT nextval('user_interests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: academics academics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY academics
    ADD CONSTRAINT academics_pkey PRIMARY KEY (id);


--
-- Name: answer_bookmarks answer_bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_bookmarks
    ADD CONSTRAINT answer_bookmarks_pkey PRIMARY KEY (id);


--
-- Name: answer_downvotes answer_downvotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_downvotes
    ADD CONSTRAINT answer_downvotes_pkey PRIMARY KEY (id);


--
-- Name: answer_replies answer_replies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_replies
    ADD CONSTRAINT answer_replies_pkey PRIMARY KEY (id);


--
-- Name: answer_upvotes answer_upvotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_upvotes
    ADD CONSTRAINT answer_upvotes_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: article_bookmarks article_bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_bookmarks
    ADD CONSTRAINT article_bookmarks_pkey PRIMARY KEY (id);


--
-- Name: article_downvotes article_downvotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_downvotes
    ADD CONSTRAINT article_downvotes_pkey PRIMARY KEY (id);


--
-- Name: article_replies article_replies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_replies
    ADD CONSTRAINT article_replies_pkey PRIMARY KEY (id);


--
-- Name: article_upvotes article_upvotes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_upvotes
    ADD CONSTRAINT article_upvotes_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: associated_sets associated_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY associated_sets
    ADD CONSTRAINT associated_sets_pkey PRIMARY KEY (id);


--
-- Name: badgroupanswerrelations badgroupanswerrelations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY badgroupanswerrelations
    ADD CONSTRAINT badgroupanswerrelations_pkey PRIMARY KEY (id);


--
-- Name: badgrouparticlerelations badgrouparticlerelations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY badgrouparticlerelations
    ADD CONSTRAINT badgrouparticlerelations_pkey PRIMARY KEY (id);


--
-- Name: ckeditor_assets ckeditor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ckeditor_assets
    ADD CONSTRAINT ckeditor_assets_pkey PRIMARY KEY (id);


--
-- Name: domains_articles domains_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains_articles
    ADD CONSTRAINT domains_articles_pkey PRIMARY KEY (id);


--
-- Name: domains domains_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains
    ADD CONSTRAINT domains_pkey PRIMARY KEY (id);


--
-- Name: domains_questions domains_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domains_questions
    ADD CONSTRAINT domains_questions_pkey PRIMARY KEY (id);


--
-- Name: group_articles group_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_articles
    ADD CONSTRAINT group_articles_pkey PRIMARY KEY (id);


--
-- Name: group_questions group_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_questions
    ADD CONSTRAINT group_questions_pkey PRIMARY KEY (id);


--
-- Name: groupanswerrelations groupanswerrelations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupanswerrelations
    ADD CONSTRAINT groupanswerrelations_pkey PRIMARY KEY (id);


--
-- Name: groupanswers groupanswers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupanswers
    ADD CONSTRAINT groupanswers_pkey PRIMARY KEY (id);


--
-- Name: grouparticlerelations grouparticlerelations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grouparticlerelations
    ADD CONSTRAINT grouparticlerelations_pkey PRIMARY KEY (id);


--
-- Name: grouparticlereplies grouparticlereplies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grouparticlereplies
    ADD CONSTRAINT grouparticlereplies_pkey PRIMARY KEY (id);


--
-- Name: groupquestionreplies groupquestionreplies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupquestionreplies
    ADD CONSTRAINT groupquestionreplies_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: groups_users groups_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups_users
    ADD CONSTRAINT groups_users_pkey PRIMARY KEY (id);


--
-- Name: institutes institutes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY institutes
    ADD CONSTRAINT institutes_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: question_bookmarks question_bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY question_bookmarks
    ADD CONSTRAINT question_bookmarks_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: relationships relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: search_products search_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY search_products
    ADD CONSTRAINT search_products_pkey PRIMARY KEY (id);


--
-- Name: user_interests user_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_interests
    ADD CONSTRAINT user_interests_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_academics_on_institute_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_academics_on_institute_id ON academics USING btree (institute_id);


--
-- Name: index_academics_on_institute_id_and_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_academics_on_institute_id_and_student_id ON academics USING btree (institute_id, student_id);


--
-- Name: index_academics_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_academics_on_student_id ON academics USING btree (student_id);


--
-- Name: index_answer_bookmarks_on_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answer_bookmarks_on_answer_id ON answer_bookmarks USING btree (answer_id);


--
-- Name: index_answer_bookmarks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answer_bookmarks_on_user_id ON answer_bookmarks USING btree (user_id);


--
-- Name: index_answer_bookmarks_on_user_id_and_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_answer_bookmarks_on_user_id_and_answer_id ON answer_bookmarks USING btree (user_id, answer_id);


--
-- Name: index_answer_downvotes_on_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answer_downvotes_on_answer_id ON answer_downvotes USING btree (answer_id);


--
-- Name: index_answer_downvotes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answer_downvotes_on_user_id ON answer_downvotes USING btree (user_id);


--
-- Name: index_answer_downvotes_on_user_id_and_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_answer_downvotes_on_user_id_and_answer_id ON answer_downvotes USING btree (user_id, answer_id);


--
-- Name: index_answer_replies_on_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answer_replies_on_answer_id ON answer_replies USING btree (answer_id);


--
-- Name: index_answer_replies_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answer_replies_on_user_id ON answer_replies USING btree (user_id);


--
-- Name: index_answer_upvotes_on_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answer_upvotes_on_answer_id ON answer_upvotes USING btree (answer_id);


--
-- Name: index_answer_upvotes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answer_upvotes_on_user_id ON answer_upvotes USING btree (user_id);


--
-- Name: index_answer_upvotes_on_user_id_and_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_answer_upvotes_on_user_id_and_answer_id ON answer_upvotes USING btree (user_id, answer_id);


--
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_question_id ON answers USING btree (question_id);


--
-- Name: index_answers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_user_id ON answers USING btree (user_id);


--
-- Name: index_article_bookmarks_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_bookmarks_on_article_id ON article_bookmarks USING btree (article_id);


--
-- Name: index_article_bookmarks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_bookmarks_on_user_id ON article_bookmarks USING btree (user_id);


--
-- Name: index_article_bookmarks_on_user_id_and_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_article_bookmarks_on_user_id_and_article_id ON article_bookmarks USING btree (user_id, article_id);


--
-- Name: index_article_downvotes_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_downvotes_on_article_id ON article_downvotes USING btree (article_id);


--
-- Name: index_article_downvotes_on_article_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_article_downvotes_on_article_id_and_user_id ON article_downvotes USING btree (article_id, user_id);


--
-- Name: index_article_downvotes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_downvotes_on_user_id ON article_downvotes USING btree (user_id);


--
-- Name: index_article_replies_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_replies_on_article_id ON article_replies USING btree (article_id);


--
-- Name: index_article_replies_on_parent_reply_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_replies_on_parent_reply_id ON article_replies USING btree (parent_reply_id);


--
-- Name: index_article_replies_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_replies_on_user_id ON article_replies USING btree (user_id);


--
-- Name: index_article_upvotes_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_upvotes_on_article_id ON article_upvotes USING btree (article_id);


--
-- Name: index_article_upvotes_on_article_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_article_upvotes_on_article_id_and_user_id ON article_upvotes USING btree (article_id, user_id);


--
-- Name: index_article_upvotes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_upvotes_on_user_id ON article_upvotes USING btree (user_id);


--
-- Name: index_articles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_articles_on_user_id ON articles USING btree (user_id);


--
-- Name: index_associated_sets_on_subset_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_associated_sets_on_subset_id ON associated_sets USING btree (subset_id);


--
-- Name: index_associated_sets_on_superset_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_associated_sets_on_superset_id ON associated_sets USING btree (superset_id);


--
-- Name: index_associated_sets_on_superset_id_and_subset_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_associated_sets_on_superset_id_and_subset_id ON associated_sets USING btree (superset_id, subset_id);


--
-- Name: index_badgroupanswerrelations_on_group_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badgroupanswerrelations_on_group_answer_id ON badgroupanswerrelations USING btree (group_answer_id);


--
-- Name: index_badgroupanswerrelations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badgroupanswerrelations_on_user_id ON badgroupanswerrelations USING btree (user_id);


--
-- Name: index_badgroupanswerrelations_on_user_id_and_group_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_badgroupanswerrelations_on_user_id_and_group_answer_id ON badgroupanswerrelations USING btree (user_id, group_answer_id);


--
-- Name: index_badgrouparticlerelations_on_group_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badgrouparticlerelations_on_group_article_id ON badgrouparticlerelations USING btree (group_article_id);


--
-- Name: index_badgrouparticlerelations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badgrouparticlerelations_on_user_id ON badgrouparticlerelations USING btree (user_id);


--
-- Name: index_badgrouparticlerelations_on_user_id_and_group_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_badgrouparticlerelations_on_user_id_and_group_article_id ON badgrouparticlerelations USING btree (user_id, group_article_id);


--
-- Name: index_ckeditor_assets_on_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ckeditor_assets_on_type ON ckeditor_assets USING btree (type);


--
-- Name: index_domains_articles_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_domains_articles_on_article_id ON domains_articles USING btree (article_id);


--
-- Name: index_domains_articles_on_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_domains_articles_on_domain_id ON domains_articles USING btree (domain_id);


--
-- Name: index_domains_articles_on_domain_id_and_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_domains_articles_on_domain_id_and_article_id ON domains_articles USING btree (domain_id, article_id);


--
-- Name: index_domains_questions_on_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_domains_questions_on_domain_id ON domains_questions USING btree (domain_id);


--
-- Name: index_domains_questions_on_domain_id_and_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_domains_questions_on_domain_id_and_question_id ON domains_questions USING btree (domain_id, question_id);


--
-- Name: index_domains_questions_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_domains_questions_on_question_id ON domains_questions USING btree (question_id);


--
-- Name: index_group_articles_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_articles_on_group_id ON group_articles USING btree (group_id);


--
-- Name: index_group_articles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_articles_on_user_id ON group_articles USING btree (user_id);


--
-- Name: index_group_questions_on_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_questions_on_group_id ON group_questions USING btree (group_id);


--
-- Name: index_group_questions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_questions_on_user_id ON group_questions USING btree (user_id);


--
-- Name: index_groupanswerrelations_on_group_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groupanswerrelations_on_group_answer_id ON groupanswerrelations USING btree (group_answer_id);


--
-- Name: index_groupanswerrelations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groupanswerrelations_on_user_id ON groupanswerrelations USING btree (user_id);


--
-- Name: index_groupanswerrelations_on_user_id_and_group_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_groupanswerrelations_on_user_id_and_group_answer_id ON groupanswerrelations USING btree (user_id, group_answer_id);


--
-- Name: index_groupanswers_on_group_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groupanswers_on_group_question_id ON groupanswers USING btree (group_question_id);


--
-- Name: index_groupanswers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groupanswers_on_user_id ON groupanswers USING btree (user_id);


--
-- Name: index_grouparticlerelations_on_group_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_grouparticlerelations_on_group_article_id ON grouparticlerelations USING btree (group_article_id);


--
-- Name: index_grouparticlerelations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_grouparticlerelations_on_user_id ON grouparticlerelations USING btree (user_id);


--
-- Name: index_grouparticlerelations_on_user_id_and_group_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_grouparticlerelations_on_user_id_and_group_article_id ON grouparticlerelations USING btree (user_id, group_article_id);


--
-- Name: index_grouparticlereplies_on_group_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_grouparticlereplies_on_group_article_id ON grouparticlereplies USING btree (group_article_id);


--
-- Name: index_grouparticlereplies_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_grouparticlereplies_on_user_id ON grouparticlereplies USING btree (user_id);


--
-- Name: index_groupquestionreplies_on_groupanswer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groupquestionreplies_on_groupanswer_id ON groupquestionreplies USING btree (groupanswer_id);


--
-- Name: index_groupquestionreplies_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_groupquestionreplies_on_user_id ON groupquestionreplies USING btree (user_id);


--
-- Name: index_institutes_on_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_institutes_on_domain_id ON institutes USING btree (domain_id);


--
-- Name: index_institutes_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_institutes_on_name ON institutes USING btree (name);


--
-- Name: index_notifications_on_recipient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_recipient_id ON notifications USING btree (recipient_id);


--
-- Name: index_question_bookmarks_on_user_id_and_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_question_bookmarks_on_user_id_and_question_id ON question_bookmarks USING btree (user_id, question_id);


--
-- Name: index_questions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_questions_on_user_id ON questions USING btree (user_id);


--
-- Name: index_relationships_on_followed_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relationships_on_followed_id ON relationships USING btree (followed_id);


--
-- Name: index_relationships_on_follower_id_and_followed_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_relationships_on_follower_id_and_followed_id ON relationships USING btree (follower_id, followed_id);


--
-- Name: index_user_interests_on_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_interests_on_domain_id ON user_interests USING btree (domain_id);


--
-- Name: index_user_interests_on_user_id_and_domain_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_user_interests_on_user_id_and_domain_id ON user_interests USING btree (user_id, domain_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: answer_downvotes answer_downvotes_changes; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER answer_downvotes_changes BEFORE INSERT OR UPDATE ON answer_downvotes FOR EACH ROW EXECUTE PROCEDURE delete_from_answer_upvotes();


--
-- Name: answer_upvotes answer_upvotes_changes; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER answer_upvotes_changes BEFORE INSERT OR UPDATE ON answer_upvotes FOR EACH ROW EXECUTE PROCEDURE delete_from_answer_downvotes();


--
-- Name: article_downvotes article_downvotes_changes; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER article_downvotes_changes BEFORE INSERT OR UPDATE ON article_downvotes FOR EACH ROW EXECUTE PROCEDURE delete_from_article_upvotes();


--
-- Name: article_upvotes article_upvotes_changes; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER article_upvotes_changes BEFORE INSERT OR UPDATE ON article_upvotes FOR EACH ROW EXECUTE PROCEDURE delete_from_article_downvotes();


--
-- Name: institutes fk_rails_00803b49d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY institutes
    ADD CONSTRAINT fk_rails_00803b49d2 FOREIGN KEY (domain_id) REFERENCES domains(id);


--
-- Name: questions fk_rails_047ab75908; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT fk_rails_047ab75908 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: group_articles fk_rails_054145e7d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_articles
    ADD CONSTRAINT fk_rails_054145e7d4 FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: groupanswers fk_rails_1b66fad5c2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupanswers
    ADD CONSTRAINT fk_rails_1b66fad5c2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: answer_replies fk_rails_256e4b72c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_replies
    ADD CONSTRAINT fk_rails_256e4b72c5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: notifications fk_rails_35aeb594ce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_35aeb594ce FOREIGN KEY (answer_reply_id) REFERENCES answer_replies(id);


--
-- Name: articles fk_rails_3d31dad1cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT fk_rails_3d31dad1cc FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: answers fk_rails_3d5ed4418f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT fk_rails_3d5ed4418f FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: article_replies fk_rails_3f533e9a07; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_replies
    ADD CONSTRAINT fk_rails_3f533e9a07 FOREIGN KEY (parent_reply_id) REFERENCES article_replies(id);


--
-- Name: group_articles fk_rails_4f015f8bba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_articles
    ADD CONSTRAINT fk_rails_4f015f8bba FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: groupquestionreplies fk_rails_53fcbb2f03; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupquestionreplies
    ADD CONSTRAINT fk_rails_53fcbb2f03 FOREIGN KEY (groupanswer_id) REFERENCES groupanswers(id);


--
-- Name: answers fk_rails_584be190c2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT fk_rails_584be190c2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: article_replies fk_rails_688c18ad44; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_replies
    ADD CONSTRAINT fk_rails_688c18ad44 FOREIGN KEY (article_id) REFERENCES articles(id);


--
-- Name: notifications fk_rails_720e1ce325; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_720e1ce325 FOREIGN KEY (article_reply_id) REFERENCES article_replies(id);


--
-- Name: notifications fk_rails_75955a8862; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_75955a8862 FOREIGN KEY (answer_id) REFERENCES answers(id);


--
-- Name: groupanswers fk_rails_8365e12e4d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupanswers
    ADD CONSTRAINT fk_rails_8365e12e4d FOREIGN KEY (group_question_id) REFERENCES group_questions(id);


--
-- Name: group_questions fk_rails_9d1799df54; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_questions
    ADD CONSTRAINT fk_rails_9d1799df54 FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: group_questions fk_rails_a717161900; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_questions
    ADD CONSTRAINT fk_rails_a717161900 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: notifications fk_rails_b080fb4855; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_b080fb4855 FOREIGN KEY (recipient_id) REFERENCES users(id);


--
-- Name: groupquestionreplies fk_rails_b264d9b689; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groupquestionreplies
    ADD CONSTRAINT fk_rails_b264d9b689 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: answer_replies fk_rails_bfa270602f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_replies
    ADD CONSTRAINT fk_rails_bfa270602f FOREIGN KEY (answer_id) REFERENCES answers(id);


--
-- Name: grouparticlereplies fk_rails_c5a1dc6fbf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grouparticlereplies
    ADD CONSTRAINT fk_rails_c5a1dc6fbf FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: notifications fk_rails_e0f35052fd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_e0f35052fd FOREIGN KEY (user_following_id) REFERENCES relationships(id);


--
-- Name: article_replies fk_rails_e524c3aaec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY article_replies
    ADD CONSTRAINT fk_rails_e524c3aaec FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: grouparticlereplies fk_rails_feda9aba19; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grouparticlereplies
    ADD CONSTRAINT fk_rails_feda9aba19 FOREIGN KEY (group_article_id) REFERENCES group_articles(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES
('20170115082027'),
('20170118122039'),
('20170123121600'),
('20170123152859'),
('20170125153050'),
('20170127140800'),
('20170128082259'),
('20170211041229'),
('20170211045740'),
('20170212031246'),
('20170212035858'),
('20170212111630'),
('20170212111631'),
('20170212111632'),
('20170218084146'),
('20170218161113'),
('20170227125424'),
('20170227154524'),
('20170302114343'),
('20170302114418'),
('20170302114505'),
('20170306060325'),
('20170306064327'),
('20170308111410'),
('20170309063835'),
('20170309063837'),
('20170321104756'),
('20170323025856'),
('20170323030827'),
('20170323132307'),
('20170502154119'),
('20170503153023'),
('20170504075416'),
('20170504075420'),
('20170504075422'),
('20170504085800'),
('20170504094557'),
('20170504094923'),
('20170504100839'),
('20170504101043'),
('20170504140547'),
('20170505083611'),
('20170505083614'),
('20170505083616'),
('20170505083618'),
('20170505083707'),
('20170505083742'),
('20170505083819'),
('20170505083831'),
('20170506105334'),
('20170506105433'),
('20170509112844'),
('20170513094454'),
('20170513094456'),
('20170513142854'),
('20170513143118'),
('20170513150512'),
('20170515114100'),
('20170528170524'),
('20170531091421'),
('20170701075208'),
('20170713050619'),
('20170806121459'),
('20170815112451'),
('20170815124530'),
('20170816160054'),
('20170831161744'),
('20171201045445'),
('20171205133440'),
('20171205133707'),
('20171205150649'),
('20171206044217'),
('20171206051625'),
('20171206051905'),
('20171208052053'),
('20171208053738'),
('20171208070227'),
('20180104154508'),
('20180104162521'),
('20180104165419'),
('20180107085106');


