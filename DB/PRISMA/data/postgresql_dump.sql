--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Homebrew)
-- Dumped by pg_dump version 15.4 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: comazon_dev; Type: DATABASE; Schema: -; Owner: jho
--

CREATE DATABASE comazon_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE comazon_dev OWNER TO jho;

\connect comazon_dev

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: Category; Type: TYPE; Schema: public; Owner: jho
--

CREATE TYPE public."Category" AS ENUM (
    'FASHION',
    'BEAUTY',
    'SPORTS',
    'ELECTRONICS',
    'HOME_INTERIOR',
    'HOUSEHOLD_SUPPLIES',
    'KITCHENWARE'
);


ALTER TYPE public."Category" OWNER TO jho;

--
-- Name: OrderStatus; Type: TYPE; Schema: public; Owner: jho
--

CREATE TYPE public."OrderStatus" AS ENUM (
    'PENDING',
    'COMPLETE'
);


ALTER TYPE public."OrderStatus" OWNER TO jho;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Order; Type: TABLE; Schema: public; Owner: jho
--

CREATE TABLE public."Order" (
    id text NOT NULL,
    status public."OrderStatus" DEFAULT 'PENDING'::public."OrderStatus" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "userId" text
);


ALTER TABLE public."Order" OWNER TO jho;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: jho
--

CREATE TABLE public."OrderItem" (
    id text NOT NULL,
    "unitPrice" double precision NOT NULL,
    quantity integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "orderId" text NOT NULL,
    "productId" text
);


ALTER TABLE public."OrderItem" OWNER TO jho;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: jho
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    category public."Category" NOT NULL,
    price double precision NOT NULL,
    stock integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Product" OWNER TO jho;

--
-- Name: User; Type: TABLE; Schema: public; Owner: jho
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    address text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO jho;

--
-- Name: UserPreference; Type: TABLE; Schema: public; Owner: jho
--

CREATE TABLE public."UserPreference" (
    id text NOT NULL,
    "receiveEmail" boolean NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "userId" text NOT NULL
);


ALTER TABLE public."UserPreference" OWNER TO jho;

--
-- Name: _ProductToUser; Type: TABLE; Schema: public; Owner: jho
--

CREATE TABLE public."_ProductToUser" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_ProductToUser" OWNER TO jho;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: jho
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO jho;

--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: jho
--

COPY public."Order" (id, status, "createdAt", "updatedAt", "userId") FROM stdin;
9fde1702-08d7-407c-8e6e-65e24f6a8237	PENDING	2023-07-16 09:00:00	2023-07-16 09:00:00	b8f11e76-0a9e-4b3f-bccf-8d9b4fbf331e
52933c6e-b118-445f-99f1-d2e07fd1c3d0	COMPLETE	2023-07-16 09:30:00	2023-07-16 09:30:00	6c3a18b0-11c5-4d97-9019-9ebe3c4d1317
dedd2a7f-56c4-45b7-a37d-efdc1d2f518d	PENDING	2023-07-16 10:00:00	2023-07-16 10:00:00	fd3ae0a5-8dd5-40b6-b8fd-48870f731db1
7c5dd97a-b86b-4b7f-9da7-d6d9258f8d66	COMPLETE	2023-07-16 10:30:00	2023-07-16 10:30:00	70e1e61d-f2ae-4d7d-bf8f-d65eafdb6a45
a03b7801-d6d9-456d-ba3e-0e73750bc6b2	PENDING	2023-07-16 11:00:00	2023-07-16 11:00:00	73cb9639-d8b7-4f11-9a62-53f4187f3f11
ae7597de-6601-4a9e-8047-9dd9f6e57e94	COMPLETE	2023-07-16 11:30:00	2023-07-16 11:30:00	b8f11e76-0a9e-4b3f-bccf-8d9b4fbf331e
e03c2d89-3623-4e4c-98f6-facbd1266023	PENDING	2023-07-16 12:00:00	2023-07-16 12:00:00	6c3a18b0-11c5-4d97-9019-9ebe3c4d1317
b5f8e405-8b95-4cb2-8b3b-ee1573da4fc2	COMPLETE	2023-07-16 12:30:00	2023-07-16 12:30:00	fd3ae0a5-8dd5-40b6-b8fd-48870f731db1
f5c8e4be-c69f-4e74-b48a-1671cbeff9a2	PENDING	2023-07-16 13:00:00	2023-07-16 13:00:00	70e1e61d-f2ae-4d7d-bf8f-d65eafdb6a45
329fcafe-4e1a-475a-9526-50c2678126db	COMPLETE	2023-07-16 13:30:00	2023-07-16 13:30:00	73cb9639-d8b7-4f11-9a62-53f4187f3f11
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: jho
--

COPY public."OrderItem" (id, "unitPrice", quantity, "createdAt", "updatedAt", "orderId", "productId") FROM stdin;
ba758e4c-4ff1-4e61-ae94-6d727f7381d6	38000	2	2023-07-16 09:00:00	2023-07-16 09:00:00	9fde1702-08d7-407c-8e6e-65e24f6a8237	f8013040-b076-4dc4-8677-11be9a17162f
a06a7eb9-75e3-4b13-81d5-9f1dd7a05175	70000	1	2023-07-16 09:30:00	2023-07-16 09:30:00	52933c6e-b118-445f-99f1-d2e07fd1c3d0	d2ff3048-83bc-425a-8ad3-d6d9af1c7c6d
f753a259-1e26-4ed9-9e60-099a4a06af4f	320000	1	2023-07-16 10:00:00	2023-07-16 10:00:00	dedd2a7f-56c4-45b7-a37d-efdc1d2f518d	7f70481b-784d-4b0e-bc3e-f05eefc17951
1fc98d4c-7571-4d1a-8808-4d76473f95e0	50000	5	2023-07-16 10:30:00	2023-07-16 10:30:00	7c5dd97a-b86b-4b7f-9da7-d6d9258f8d66	4e0d9424-3a16-4a5e-9725-0e9d2f9722b3
ab8e97f4-10ae-4ce6-a06d-d638d8b7efc6	650000	1	2023-07-16 11:00:00	2023-07-16 11:00:00	a03b7801-d6d9-456d-ba3e-0e73750bc6b2	39c3fd4a-dbd5-4ab1-8e0b-58ea31b8a2d3
f161aa17-860e-4be5-87f5-b6097b5d493e	1249000	2	2023-07-16 11:30:00	2023-07-16 11:30:00	a03b7801-d6d9-456d-ba3e-0e73750bc6b2	c2d4a2e3-7c2a-4f80-bff7-8ebcbacccf2c
e5f7d938-b39f-4d48-9eb9-af438b564c7e	1399000	3	2023-07-16 12:00:00	2023-07-16 12:00:00	ae7597de-6601-4a9e-8047-9dd9f6e57e94	43c62d5b-6e66-4d1c-9f47-14d1a1970fd1
b689cc3e-7174-4db6-9267-ba9f1a271fc7	169000	2	2023-07-16 12:30:00	2023-07-16 12:30:00	ae7597de-6601-4a9e-8047-9dd9f6e57e94	6e9d4e63-7246-4fc5-bf33-3e7f32fe9c02
f5c377d3-9fe5-437b-999b-402d6e77a719	1800000	1	2023-07-16 13:00:00	2023-07-16 13:00:00	e03c2d89-3623-4e4c-98f6-facbd1266023	80e7b377-df80-4410-9a14-622ea3cc58e0
ff9db6b9-50c0-4a25-8b46-bdb82b2fcf02	35000	4	2023-07-16 13:30:00	2023-07-16 13:30:00	e03c2d89-3623-4e4c-98f6-facbd1266023	a4ff201c-48f7-4963-b317-2e9e4e3e43b7
8c714670-2772-4aae-bc75-ee11f272e8db	750000	2	2023-07-16 14:00:00	2023-07-16 14:00:00	b5f8e405-8b95-4cb2-8b3b-ee1573da4fc2	c6a5975a-42e7-4f7f-8b7c-72714d59f44a
e5dcdb0c-7837-4a3d-97a3-8fc3ae4f19d4	1799000	1	2023-07-16 14:30:00	2023-07-16 14:30:00	b5f8e405-8b95-4cb2-8b3b-ee1573da4fc2	a33d441f-57a9-4618-8f46-07e7418ef3c9
2e3fc058-d77e-4743-a5ce-81cb770f367d	27000	3	2023-07-16 15:00:00	2023-07-16 15:00:00	f5c8e4be-c69f-4e74-b48a-1671cbeff9a2	f6c2a70e-32a4-4bcf-b183-8a33d97fb587
e83c30b7-0988-4fe1-a4f7-535da83bb042	59000	1	2023-07-16 15:30:00	2023-07-16 15:30:00	f5c8e4be-c69f-4e74-b48a-1671cbeff9a2	e700c4be-6e0c-40fd-bb47-2ab2b2e9270d
ef69be07-6a91-4c47-a638-027e33bda9c6	1999000	1	2023-07-16 16:00:00	2023-07-16 16:00:00	329fcafe-4e1a-475a-9526-50c2678126db	be13a617-8f0e-4806-82f7-149a6e12f1a7
b7f117e7-1283-4964-8358-fc6a438bfc7f	59000	4	2023-07-14 09:00:01	2023-07-14 09:00:01	9fde1702-08d7-407c-8e6e-65e24f6a8237	6e890e6d-df7b-4c50-8d3e-59a32c48ae51
a8ee9e47-4b30-495e-92ab-4e84903c9cfd	35000	2	2023-07-14 09:00:01	2023-07-14 09:00:01	7c5dd97a-b86b-4b7f-9da7-d6d9258f8d66	b1782c1e-8ad2-45a7-90e6-50f61c4a8de9
eeed5dbf-4ae3-4f8b-8a83-9eadd7d5364b	189000	1	2023-07-14 09:00:01	2023-07-14 09:00:02	52933c6e-b118-445f-99f1-d2e07fd1c3d0	d6c5e7d5-225f-4f6d-ba17-6f79d32726db
d1f42fa1-17e4-4082-a5e7-988f1d3a12c5	12000	2	2023-07-14 09:00:02	2023-07-14 09:00:02	dedd2a7f-56c4-45b7-a37d-efdc1d2f518d	9c2bc7ad-6f1e-491d-8d81-9ed78a805a20
e5a5a77a-aa8b-43a5-8a4e-2f9dd89831f5	99000	2	2023-07-14 09:00:02	2023-07-14 09:00:02	a03b7801-d6d9-456d-ba3e-0e73750bc6b2	5ae4a823-0076-4ae0-af49-7f3eb0002c0a
d61d2aaf-64a1-4c45-b0ea-08ad7114e27b	90000	1	2023-07-14 09:00:02	2023-07-14 09:00:02	7c5dd97a-b86b-4b7f-9da7-d6d9258f8d66	b5d2d3ad-7d92-4f17-a1e5-2260a2d69d0d
3f4c686b-54c7-4076-8e17-d48b4a4fd53e	25000	1	2023-07-14 09:00:02	2023-07-14 09:00:02	dedd2a7f-56c4-45b7-a37d-efdc1d2f518d	c28a2eaf-4d87-4f9f-ae5b-cbcf73e24253
3835b76a-77ef-4fd1-91bc-ee67065130b7	1890000	1	2023-07-14 09:00:02	2023-07-14 09:00:02	f5c8e4be-c69f-4e74-b48a-1671cbeff9a2	be07b27a-93e9-4d1a-8a54-133c0f04541e
d27c1890-ba7e-4cb3-91fb-977b0b8ff77b	399000	1	2023-07-14 09:00:02	2023-07-14 09:00:02	dedd2a7f-56c4-45b7-a37d-efdc1d2f518d	de573676-2a27-4cfa-85a1-0e9dd3ed5315
e41bcab5-b408-4428-9a5a-b6f70f6a86a9	79000	1	2023-07-14 09:00:02	2023-07-14 09:00:02	a03b7801-d6d9-456d-ba3e-0e73750bc6b2	9c6ebf9b-f666-44da-b79f-5f62517f55fc
06d69334-8003-415f-8ad9-bd78bbf25512	59000	2	2023-07-14 09:00:02	2023-07-14 09:00:02	b5f8e405-8b95-4cb2-8b3b-ee1573da4fc2	1cc006a0-82a3-4e70-8d92-974d1ea9c3af
6b344ab9-3a26-4daa-858f-2ed464a76904	9000	2	2023-07-14 09:00:02	2023-07-14 09:00:02	ae7597de-6601-4a9e-8047-9dd9f6e57e94	85fc2182-8b7f-47f1-8f3d-911e0a3c0582
9a918a82-8e1e-442f-96a5-05205199547f	79000	1	2023-07-14 09:00:02	2023-07-14 09:00:02	dedd2a7f-56c4-45b7-a37d-efdc1d2f518d	d9e3f6ae-04e5-4a7b-8c7c-2d582af08489
e593d45c-c244-4e53-92a6-33450a6d8f18	189000	1	2023-07-14 09:00:03	2023-07-14 09:00:03	7c5dd97a-b86b-4b7f-9da7-d6d9258f8d66	10f12b65-20f5-43d9-860e-faf4890e2a9e
64637bcf-531e-4569-8d5d-80801363821e	20000	4	2023-07-14 09:00:03	2023-07-14 09:00:03	f5c8e4be-c69f-4e74-b48a-1671cbeff9a2	6922d7f9-72d6-46fe-8b0e-890700aa8f13
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: jho
--

COPY public."Product" (id, name, description, category, price, stock, "createdAt", "updatedAt") FROM stdin;
f8013040-b076-4dc4-8677-11be9a17162f	랑방 샤워젤 세트	랑방의 향기로운 샤워젤 세트입니다. 피부를 부드럽게 케어하며, 향기로운 샤워 시간을 선사합니다.	BEAUTY	38000	20	2023-07-14 10:00:00	2023-07-14 10:00:00
d2ff3048-83bc-425a-8ad3-d6d9af1c7c6d	나이키 테크조그거팬츠	나이키의 테크조그거팬츠입니다. 운동이나 일상 생활에서 편안하게 착용할 수 있으며, 스타일과 기능을 모두 갖추고 있습니다.	FASHION	75000	15	2023-07-14 10:30:00	2023-07-14 10:30:00
7f70481b-784d-4b0e-bc3e-f05eefc17951	Apple AirPods 프로	Apple의 AirPods 프로는 탁월한 사운드 품질과 노이즈 캔슬링 기능을 갖춘 무선 이어폰입니다. 간편한 터치 컨트롤과 긴 배터리 수명을 제공합니다.	ELECTRONICS	320000	10	2023-07-14 11:00:00	2023-07-14 11:00:00
4e0d9424-3a16-4a5e-9725-0e9d2f9722b3	베르사체 화장품 세트	베르사체의 화장품 세트로 화려하고 특별한 분위기를 연출할 수 있습니다. 다양한 아이템으로 구성되어 있으며, 고품질 성분을 사용하여 피부에 부드럽고 안정적인 관리를 제공합니다.	BEAUTY	65000	8	2023-07-14 11:30:00	2023-07-14 11:30:00
39c3fd4a-dbd5-4ab1-8e0b-58ea31b8a2d3	아이언맨 골프 클럽 세트	아이언맨 디자인으로 유명한 골프 클럽 세트입니다. 고품질 소재와 최신 기술로 제작되어 정밀한 스윙과 멋진 샷을 도와줍니다.	SPORTS	850000	3	2023-07-14 12:00:00	2023-07-14 12:00:00
c2d4a2e3-7c2a-4f80-bff7-8ebcbacccf2c	삼성 갤럭시 S21 울트라 5G 스마트폰	삼성 갤럭시 S21 울트라 5G 스마트폰은 최신 플래그십 기술을 갖춘 뛰어난 성능을 제공합니다. 화려한 디스플레이, 고화질 카메라, 빠른 프로세서 등으로 사용자들에게 탁월한 사용자 경험을 선사합니다.	ELECTRONICS	1249000	8	2023-07-14 14:00:00	2023-07-14 14:00:00
43c62d5b-6e66-4d1c-9f47-14d1a1970fd1	LG 그램 14형 노트북	LG 그램 14형 노트북은 가볍고 휴대성이 뛰어난 디자인과 우수한 성능을 제공합니다. 긴 배터리 수명과 선명한 디스플레이로 사용자들에게 편리한 사용자 경험을 선사합니다.	ELECTRONICS	1399000	12	2023-07-14 14:30:00	2023-07-14 14:30:00
6e9d4e63-7246-4fc5-bf33-3e7f32fe9c02	나이키 에어맥스 270 운동화	나이키 에어맥스 270 운동화는 경량 디자인과 탁월한 고무 밑창으로 편안한 착용감과 훌륭한 트랙션을 제공합니다. 스포티한 디자인과 풍부한 컬러로 다양한 스타일에 어울립니다.	FASHION	169000	10	2023-07-14 15:00:00	2023-07-14 15:00:00
80e7b377-df80-4410-9a14-622ea3cc58e0	애플 맥북 프로 13형 노트북	애플 맥북 프로 13형 노트북은 탁월한 성능과 우수한 디스플레이 품질로 유명합니다. 가벼운 무게와 편리한 사용성으로 사용자들에게 탁월한 컴퓨팅 경험을 제공합니다.	ELECTRONICS	1999000	10	2023-07-14 15:30:00	2023-07-14 15:30:00
a4ff201c-48f7-4963-b317-2e9e4e3e43b7	랑방 매트 틴트	랑방 매트 틴트는 풍부한 컬러와 지속력을 제공하는 제품입니다. 입술에 부드럽게 발리며 오래 지속되는 매트한 마무리를 선사합니다.	BEAUTY	35000	20	2023-07-14 16:00:00	2023-07-14 16:00:00
c6a5975a-42e7-4f7f-8b7c-72714d59f44a	루이비통 클래식 지갑	루이비통의 클래식 지갑은 고품질 가죽과 세련된 디자인으로 제작되었습니다. 실용적인 구성과 품질로 오랜 기간 동안 사용할 수 있습니다.	FASHION	750000	15	2023-07-14 16:30:00	2023-07-14 16:30:00
a33d441f-57a9-4618-8f46-07e7418ef3c9	아이폰 13 프로 맥스 스마트폰	아이폰 13 프로 맥스는 탁월한 카메라 성능과 강력한 성능으로 유명한 스마트폰입니다. 선명한 디스플레이와 편리한 사용성을 제공합니다.	ELECTRONICS	1799000	5	2023-07-14 17:00:00	2023-07-14 17:00:00
f6c2a70e-32a4-4bcf-b183-8a33d97fb587	헤라 UV 미스트 선스틱 SPF50+ PA+++	헤라의 UV 미스트 선스틱은 SPF50+ PA+++로 강력한 자외선 차단과 함께 피부 보습에 도움을 주는 제품입니다. 휴대하기 편리한 스틱 형태로 사용이 간편합니다.	BEAUTY	28000	15	2023-07-14 17:30:00	2023-07-14 17:30:00
e700c4be-6e0c-40fd-bb47-2ab2b2e9270d	올리비아 버튼 니트	올리비아 버튼 니트는 스타일리시한 디자인과 편안한 착용감으로 유명한 제품입니다. 다양한 의상에 매치하기 좋으며, 따뜻한 니트 소재로 겨울철에도 활용할 수 있습니다.	FASHION	59000	10	2023-07-14 18:00:00	2023-07-14 18:00:00
be13a617-8f0e-4806-82f7-149a6e12f1a7	삼성 55인치 QLED 4K 스마트 TV	삼성의 55인치 QLED 4K 스마트 TV는 고품질 화질과 풍부한 컬러 표현력으로 몰입감 있는 시청 경험을 제공합니다. 스마트 기능과 음성 인식 기능을 지원하여 편리한 사용자 경험을 선사합니다.	ELECTRONICS	1999000	8	2023-07-14 18:30:00	2023-07-14 18:30:00
d3f74179-2cb5-4e51-8f3a-57f65c1d4e6e	루이스 카스텔리 미니 프라이팬	루이스 카스텔리의 미니 프라이팬은 작고 휴대하기 편한 사이즈로 다양한 요리에 활용할 수 있습니다. 내열성과 내마모성이 우수하며 손쉬운 청소가 가능합니다.	KITCHENWARE	29000	10	2023-07-15 10:00:00	2023-07-15 10:00:00
dc74c065-5237-4d5b-86d1-d4eeb8a4d1fd	델롱기 헤어 드라이어	델롱기의 헤어 드라이어는 강력한 풍력과 다양한 모드로 빠른 건조와 스타일링을 도와줍니다. 손쉬운 조작과 휴대성을 갖추고 있습니다.	ELECTRONICS	69000	15	2023-07-15 10:30:00	2023-07-15 10:30:00
93a1c570-ee10-4961-bbdf-68001efddc49	보노홈 스탠드 믹서기	보노홈의 스탠드 믹서기는 강력한 모터와 다양한 속도 조절로 원하는 믹싱과 반죽 작업을 할 수 있습니다. 내구성이 뛰어나며 안정적인 성능을 제공합니다.	KITCHENWARE	99000	8	2023-07-15 11:00:00	2023-07-15 11:00:00
d5d60337-ccf6-404f-b615-982f2b223ab3	나이키 에어 포스 1 운동화	나이키의 에어 포스 1 운동화는 클래식한 디자인과 탁월한 편안함으로 유명합니다. 내구성이 우수하며 다양한 스타일과 컬러로 선택할 수 있습니다.	FASHION	129000	12	2023-07-15 11:30:00	2023-07-15 11:30:00
209b2a1c-c6e9-4461-a17a-c8a8f141f9f9	삼성 컬러 레이저 프린터	삼성의 컬러 레이저 프린터는 고품질 컬러 출력과 빠른 인쇄 속도로 탁월한 인쇄 품질을 제공합니다. 다양한 용지 크기와 고효율 인쇄 기능을 지원합니다.	ELECTRONICS	499000	5	2023-07-15 12:00:00	2023-07-15 12:00:00
b1782c1e-8ad2-45a7-90e6-50f61c4a8de9	코멧 피크닉 매트	코멧 피크닉 매트는 내열성과 내충격성이 뛰어나며 편리한 보관과 휴대를 위한 접이식 디자인입니다. 야외 활동에 최적화되어 있습니다.	SPORTS	35000	5	2023-07-15 12:30:00	2023-07-15 12:30:00
b2593dbd-5ea3-4376-9378-6d6e7a17e232	루미에어 드라이 바디 수건	루미에어의 드라이 바디 수건은 퀵 드라이와 산뜻한 사용감을 제공하는 혁신적인 수건입니다. 속건성이 뛰어나며 휴대하기 편리합니다.	BEAUTY	19900	10	2023-07-15 13:00:00	2023-07-15 13:00:00
c28a2eaf-4d87-4f9f-ae5b-cbcf73e24253	쿠진앤에이 오믈렛 팬	쿠진앤에이의 오믈렛 팬은 오믈렛을 쉽고 빠르게 만들 수 있는 전용 팬입니다. 내열성이 뛰어나며 논스틱 처리로 편리한 사용과 청소가 가능합니다.	KITCHENWARE	25000	8	2023-07-15 13:30:00	2023-07-15 13:30:00
e48d9e8b-6712-48ed-9ea2-2f7e150a2e48	네스프레소 커피머신	네스프레소 커피머신은 간편한 사용과 다양한 커피 음료 제공으로 인기 있는 제품입니다. 커피 품질과 편리한 관리 기능을 동시에 갖추고 있습니다.	ELECTRONICS	149000	20	2023-07-15 14:00:00	2023-07-15 14:00:00
64e7c9fc-49b6-4b20-9ce3-11a9487ed1e1	스완스톤 운동 요가 매트	스완스톤의 운동 요가 매트는 편안하고 안정적인 기준면과 내충격성으로 안전한 운동 활동을 도와줍니다. 내마모성이 우수하며 휴대하기 편리합니다.	SPORTS	69000	12	2023-07-15 14:30:00	2023-07-15 14:30:00
e3f34fb9-2c4b-45c0-94b1-610e6cfe13a7	샤넬 커버 파운데이션	샤넬의 커버 파운데이션은 자연스럽게 피부를 커버하고 매끈한 마무리를 선사합니다. 오랜 지속력과 촉촉한 사용감을 제공합니다.	BEAUTY	65000	15	2023-07-15 15:00:00	2023-07-15 15:00:00
4be1e6fd-2271-4f15-96e3-577c4a057c8b	올바로 10단 스텐레스 냄비세트	올바로의 10단 스텐레스 냄비세트는 내열성과 내식성이 우수한 제품입니다. 다양한 크기와 기능으로 요리를 즐길 수 있습니다.	KITCHENWARE	179000	8	2023-07-15 15:30:00	2023-07-15 15:30:00
a4468fc1-3cfc-4c46-9ff9-2469b5f9e88a	아디다스 운동바지	아디다스의 운동바지는 신축성과 편안한 착용감으로 활동성을 높여줍니다. 퀄리티한 소재와 다양한 스타일로 선택의 폭이 넓습니다.	FASHION	59000	12	2023-07-15 16:00:00	2023-07-15 16:00:00
be07b27a-93e9-4d1a-8a54-133c0f04541e	LG 울트라 HD 4K TV	LG의 울트라 HD 4K TV는 생생하고 선명한 화질로 몰입감 있는 시청 경험을 제공합니다. 스마트 기능과 다양한 연결 옵션을 갖추고 있습니다.	ELECTRONICS	2299000	5	2023-07-15 16:30:00	2023-07-15 16:30:00
de573676-2a27-4cfa-85a1-0e9dd3ed5315	삼성 갤럭시 워치4	삼성의 갤럭시 워치4는 스타일리시한 디자인과 다양한 기능으로 탁월한 착용 경험을 선사합니다. 편리한 스마트 기능과 건강 관리 기능을 갖추고 있습니다.	ELECTRONICS	399000	5	2023-07-15 17:00:00	2023-07-15 17:00:00
9c6ebf9b-f666-44da-b79f-5f62517f55fc	나이스컷 고급 칼세트	나이스컷의 고급 칼세트는 품질 높은 강화 스테인리스 블레이드로 효율적인 커팅을 가능하게 합니다. 다양한 칼 종류로 다양한 요리를 할 수 있습니다.	KITCHENWARE	99000	5	2023-07-15 17:30:00	2023-07-15 17:30:00
17cc4f9c-1e71-4782-914a-c8a12dc6f94b	아벤크롬비 스니커즈	아벤크롬비의 스니커즈는 스포티한 디자인과 편안한 착용감으로 인기 있는 제품입니다. 고품질 소재와 세련된 스타일로 멋진 캐주얼 룩을 완성할 수 있습니다.	FASHION	89000	10	2023-07-15 18:00:00	2023-07-15 18:00:00
c1b31e2b-6d6a-4b24-b3ea-d0746f9cc6ea	피오라 러브포이즌 향수	피오라의 러브포이즌 향수는 상쾌하고 여성스러운 향기로 매력적인 분위기를 연출합니다. 오래 지속되는 향과 우아한 디자인으로 사랑받는 제품입니다.	BEAUTY	79000	8	2023-07-15 18:30:00	2023-07-15 18:30:00
5ae4a823-0076-4ae0-af49-7f3eb0002c0a	니스 퍼퓸 캔들	니스 퍼퓸의 캔들은 아로마 향으로 휴식과 힐링을 선사합니다. 품질 좋은 원료로 만들어진 캔들은 안전하고 오랜 시간 향기를 유지합니다.	HOME_INTERIOR	35000	12	2023-07-15 19:00:00	2023-07-15 19:00:00
50ce94ef-cb04-4c2f-bad4-d36b18956b9a	디젤 남성 슬림 핏 청바지	디젤의 남성 슬림 핏 청바지는 모던하고 스타일리시한 디자인으로 인기를 끄는 제품입니다. 퀄리티한 소재와 세련된 실루엣으로 완벽한 핏을 선사합니다.	FASHION	139000	15	2023-07-15 19:30:00	2023-07-15 19:30:00
d6c5e7d5-225f-4f6d-ba17-6f79d32726db	슈퍼디올 여성 선글라스	슈퍼디올의 여성 선글라스는 세련된 디자인과 탁월한 안경 렌즈로 스타일과 보호를 동시에 제공합니다. 여름 휴가나 일상적인 착용에 적합합니다.	FASHION	189000	10	2023-07-15 20:00:00	2023-07-15 20:00:00
9c2bc7ad-6f1e-491d-8d81-9ed78a805a20	보타닉 프레쉬 화장품 세트	보타닉 프레쉬의 화장품 세트는 천연 식물성 성분을 사용하여 피부에 영양과 보습을 제공합니다. 다양한 제품으로 피부 관리를 완벽하게 할 수 있습니다.	BEAUTY	99000	15	2023-07-15 20:30:00	2023-07-15 20:30:00
f8c95e63-ba05-4e2d-8a61-9e5b07d4ccdb	프라다 남성 가죽 벨트	프라다의 남성 가죽 벨트는 고품질 가죽 소재와 세련된 디자인으로 멋진 스타일링을 완성할 수 있습니다. 다양한 의상에 어울리는 제품입니다.	FASHION	249000	8	2023-07-15 21:00:00	2023-07-15 21:00:00
e6c6aeed-209d-4f3d-907e-9d208d5bcfd2	LG 스마트 인버터 에어컨	LG의 스마트 인버터 에어컨은 효율적인 냉방과 에너지 절약을 위한 기능을 갖추고 있습니다. 스마트한 제어와 시원한 바람으로 쾌적한 환경을 제공합니다.	ELECTRONICS	1399000	5	2023-07-15 21:30:00	2023-07-15 21:30:00
a81dd4df-5bc4-44b5-89a0-769a7b6d3cc0	닌텐도 스위치 라이트	닌텐도 스위치 라이트는 휴대성과 다양한 게임 플레이를 위한 제품입니다. 화질과 음질이 우수하며 다양한 게임을 즐길 수 있습니다.	ELECTRONICS	299000	5	2023-07-15 22:00:00	2023-07-15 22:00:00
6e890e6d-df7b-4c50-8d3e-59a32c48ae51	루미에어 프리미엄 베개	루미에어의 프리미엄 베개는 안락한 수면을 위한 편안한 디자인과 고품질 소재로 제작되었습니다. 적절한 지지력과 통기성을 제공합니다.	HOME_INTERIOR	59000	10	2023-07-15 22:30:00	2023-07-15 22:30:00
7a14ccf9-8b08-4e9a-8f0f-624dcf7d6d74	메종키츠네 남성 반팔 티셔츠	메종키츠네의 남성 반팔 티셔츠는 고품질 소재와 세련된 디자인으로 스타일리시한 룩을 완성할 수 있습니다. 다양한 컬러와 패턴으로 선택의 폭을 넓힐 수 있습니다.	FASHION	149000	12	2023-07-15 23:00:00	2023-07-15 23:00:00
b5d2d3ad-7d92-4f17-a1e5-2260a2d69d0d	올림포스 포터블 프린터	올림포스의 포터블 프린터는 휴대성과 편리한 사용을 제공하는 제품입니다. 다양한 용지 크기와 고품질 인쇄를 지원합니다.	ELECTRONICS	99000	10	2023-07-16 00:00:00	2023-07-16 00:00:00
3f0ccf0a-9980-4a55-9ef0-57e929fe813c	디올 애디크트 립스틱	디올의 애디크트 립스틱은 풍부한 컬러와 윤기로운 마무리를 선사합니다. 부드러운 발림성과 오랜 지속력으로 립 메이크업을 완성합니다.	BEAUTY	45000	15	2023-07-16 00:30:00	2023-07-16 00:30:00
f6a63b92-870e-4b54-8f80-7ae5e0b5be78	삼성 갤럭시 버즈 프로	삼성의 갤럭시 버즈 프로는 탁월한 음질과 노이즈 캔슬링 기능을 제공하는 무선 이어폰입니다. 스마트한 기능과 편안한 착용감을 동시에 즐길 수 있습니다.	ELECTRONICS	229000	10	2023-07-16 01:00:00	2023-07-16 01:00:00
d0ccffae-fa61-4e2f-88ff-2253e838bf2d	지오다노 남성 반팔 티셔츠	지오다노의 남성 반팔 티셔츠는 심플하면서도 스타일리시한 디자인으로 인기를 끄는 제품입니다. 퀄리티한 소재와 편안한 착용감을 제공합니다.	FASHION	29000	12	2023-07-16 01:30:00	2023-07-16 01:30:00
8a131b86-7b3e-44c2-a02b-b17c69a2c780	필립스 공기청정기	필립스의 공기청정기는 공기 중의 먼지와 유해 물질을 효과적으로 제거하여 깨끗한 공기를 유지합니다. 소음이 적고 사용이 편리합니다.	ELECTRONICS	119000	8	2023-07-16 02:00:00	2023-07-16 02:00:00
f8cb3992-c455-4c9a-9736-1f94a83b3e6f	후아유 촉촉 수분 선크림	후아유의 촉촉 수분 선크림은 가볍고 촉촉한 텍스처로 피부에 쉽게 흡수되며 자외선 차단과 피부 보호를 동시에 제공합니다.	BEAUTY	39000	15	2023-07-16 02:30:00	2023-07-16 02:30:00
78e5b047-f28e-4b3e-9c62-54c2d12565cd	조지아 아이스 커피	조지아 아이스 커피는 진하고 풍부한 커피 맛과 시원한 얼음으로 상쾌한 음료를 즐길 수 있습니다. 휴대하기 편리한 캔 형태로 제공됩니다.	HOUSEHOLD_SUPPLIES	2000	50	2023-07-16 03:00:00	2023-07-16 03:00:00
b8e3e8d9-0f39-4f2e-99a0-1c00c8f5d9e1	헤스티아 화장지	헤스티아의 화장지는 부드럽고 흡수력이 뛰어나며 피부 친화적인 소재로 만들어진 제품입니다. 편리한 사용감과 위생성을 제공합니다.	HOUSEHOLD_SUPPLIES	5000	30	2023-07-16 03:30:00	2023-07-16 03:30:00
0d8e554a-84c0-4b9c-bdc3-d04b9bbf1344	탐스킨 리뉴얼 페이셜 클렌저	탐스킨의 리뉴얼 페이셜 클렌저는 부드러운 거품과 깨끗한 세정력으로 피부를 깨끗하게 유지합니다. 피부에 자극을 주지 않는 올인원 클렌저입니다.	BEAUTY	15000	20	2023-07-16 04:00:00	2023-07-16 04:00:00
1cc006a0-82a3-4e70-8d92-974d1ea9c3af	카시오 베이비-지 시계	카시오 베이비-지 시계는 귀여운 디자인과 실용적인 기능을 가진 어린이용 시계입니다. 내추럴 라이트와 방수 기능을 갖추고 있습니다.	ELECTRONICS	59000	10	2023-07-16 04:30:00	2023-07-16 04:30:00
85fc2182-8b7f-47f1-8f3d-911e0a3c0582	홀리바나나 남성 가죽 슬리퍼	홀리바나나 남성 가죽 슬리퍼는 편안한 착용감과 세련된 디자인으로 인기를 끄는 제품입니다. 고품질 가죽 소재와 내구성을 겸비하고 있습니다.	FASHION	79000	8	2023-07-16 05:00:00	2023-07-16 05:00:00
d9e3f6ae-04e5-4a7b-8c7c-2d582af08489	티파니 실버 팔찌	티파니의 실버 팔찌는 우아하고 고급스러운 디자인으로 많은 사랑을 받는 제품입니다. 실버 소재와 섬세한 장식이 특징입니다.	FASHION	289000	5	2023-07-16 05:30:00	2023-07-16 05:30:00
10f12b65-20f5-43d9-860e-faf4890e2a9e	조던 남성 농구화	조던의 남성 농구화는 탁월한 풋워크와 스트라이드를 위한 디자인과 탁월한 지지력을 제공합니다. 전문 농구 선수들의 선택입니다.	SPORTS	189000	5	2023-07-16 06:00:00	2023-07-16 06:00:00
6922d7f9-72d6-46fe-8b0e-890700aa8f13	유니클로 남성 셔츠	유니클로의 남성 셔츠는 심플하면서도 편안한 디자인으로 인기를 끄는 제품입니다. 다양한 컬러와 스타일로 선택의 폭을 넓힐 수 있습니다.	FASHION	25000	10	2023-07-16 06:30:00	2023-07-16 06:30:00
e5d7a4f3-9e21-4125-9e1c-216d5a226b74	베리알 남성 어깨 가방	베리알의 남성 어깨 가방은 실용적인 디자인과 고품질 소재로 제작되었습니다. 여행이나 일상적인 외출에 편리한 수납 공간을 제공합니다.	FASHION	69000	8	2023-07-16 07:00:00	2023-07-16 07:00:00
f751e63f-686d-42d4-898e-3ef6d4137908	키친아트 커피머신	키친아트의 커피머신은 다양한 커피 메뉴를 즐길 수 있는 다기능 제품입니다. 간편한 조작과 풍부한 맛을 선사합니다.	KITCHENWARE	89000	5	2023-07-16 07:30:00	2023-07-16 07:30:00
1e112c02-7c92-4d52-b76e-485e41e3f64d	파나소닉 전기 면도기	파나소닉의 전기 면도기는 부드럽고 깨끗한 면도 경험을 제공합니다. 섬세한 면도와 피부 자극을 최소화합니다.	ELECTRONICS	79000	5	2023-07-16 08:00:00	2023-07-16 08:00:00
19a6ce8e-70ed-4e3c-832a-ba3541a7da15	보브의 화장 솔루션 세트	보브의 화장 솔루션 세트는 다양한 솔루션으로 메이크업을 완벽하게 지원합니다. 피부에 자연스러운 톤과 미세한 마무리를 제공합니다.	BEAUTY	39000	15	2023-07-16 02:15:00	2023-07-16 02:15:00
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: jho
--

COPY public."User" (id, email, "firstName", "lastName", address, "createdAt", "updatedAt") FROM stdin;
b8f11e76-0a9e-4b3f-bccf-8d9b4fbf331e	honggd@example.com	길동	홍	서울특별시 강남구 무실로 123번길 45-6	2023-07-16 09:00:00	2023-07-16 09:00:00
fd3ae0a5-8dd5-40b6-b8fd-48870f731db1	lee.cs@example.com	철수	이	인천광역시 남구 향교로 567번길 8-2	2023-07-16 10:00:00	2023-07-16 10:00:00
6c3a18b0-11c5-4d97-9019-9ebe3c4d1317	kimyh@example.com	영희	김	경기도 고양시 봉명로 789번길 21	2023-07-16 09:30:00	2023-07-16 09:30:00
70e1e61d-f2ae-4d7d-bf8f-d65eafdb6a45	parkjy@example.com	지영	박	대전광역시 중구 성남로 432번길 76	2023-07-16 10:30:00	2023-07-16 10:30:00
73cb9639-d8b7-4f11-9a62-53f4187f3f11	jungminsoo@example.com	민수	정	부산광역시 동래구 수림로 987번길 33-7	2023-07-16 11:00:00	2023-07-16 11:00:00
\.


--
-- Data for Name: UserPreference; Type: TABLE DATA; Schema: public; Owner: jho
--

COPY public."UserPreference" (id, "receiveEmail", "createdAt", "updatedAt", "userId") FROM stdin;
936f5ea4-6e6c-4e5e-91a3-78f5644e1f9a	t	2023-07-16 09:00:00	2023-07-16 09:00:00	b8f11e76-0a9e-4b3f-bccf-8d9b4fbf331e
e1c1e5c1-5312-4f7b-a3d6-4cbb2b4f8828	f	2023-07-16 09:30:00	2023-07-16 09:30:00	6c3a18b0-11c5-4d97-9019-9ebe3c4d1317
6c03856e-5b25-4f89-9d20-68a8f8e33c46	t	2023-07-16 10:00:00	2023-07-16 10:00:00	fd3ae0a5-8dd5-40b6-b8fd-48870f731db1
88d9c8c4-bf9d-4a40-a60a-82dc23e009b0	f	2023-07-16 10:30:00	2023-07-16 10:30:00	70e1e61d-f2ae-4d7d-bf8f-d65eafdb6a45
0b5a06cd-5d25-4b3c-bc52-b06ee7b17662	t	2023-07-16 11:00:00	2023-07-16 11:00:00	73cb9639-d8b7-4f11-9a62-53f4187f3f11
\.


--
-- Data for Name: _ProductToUser; Type: TABLE DATA; Schema: public; Owner: jho
--

COPY public."_ProductToUser" ("A", "B") FROM stdin;
7f70481b-784d-4b0e-bc3e-f05eefc17951	fd3ae0a5-8dd5-40b6-b8fd-48870f731db1
43c62d5b-6e66-4d1c-9f47-14d1a1970fd1	fd3ae0a5-8dd5-40b6-b8fd-48870f731db1
f8013040-b076-4dc4-8677-11be9a17162f	6c3a18b0-11c5-4d97-9019-9ebe3c4d1317
be13a617-8f0e-4806-82f7-149a6e12f1a7	73cb9639-d8b7-4f11-9a62-53f4187f3f11
80e7b377-df80-4410-9a14-622ea3cc58e0	fd3ae0a5-8dd5-40b6-b8fd-48870f731db1
d3f74179-2cb5-4e51-8f3a-57f65c1d4e6e	73cb9639-d8b7-4f11-9a62-53f4187f3f11
7f70481b-784d-4b0e-bc3e-f05eefc17951	6c3a18b0-11c5-4d97-9019-9ebe3c4d1317
4e0d9424-3a16-4a5e-9725-0e9d2f9722b3	6c3a18b0-11c5-4d97-9019-9ebe3c4d1317
a4ff201c-48f7-4963-b317-2e9e4e3e43b7	6c3a18b0-11c5-4d97-9019-9ebe3c4d1317
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: jho
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
4b4ca729-2701-4780-b315-a2ba67fccb54	b530ad1a0d7b8732a2bf18397f12ad7281a2cddf2b76217928cf22669d84cd3f	2023-10-17 14:46:07.726463+09	20231017054607_init	\N	\N	2023-10-17 14:46:07.721477+09	1
a326d87e-a733-4356-aeda-755c35318f3d	a3248101c10c5b32685c2b8b7094957a96b8911586661f94b887a615d1709daa	2023-10-17 15:07:14.387007+09	20231017060714_add_product_model	\N	\N	2023-10-17 15:07:14.380749+09	1
d6d91f48-7c1e-4e96-8e1b-4fc2aaaf8e14	265fcb4d628d5e3a2f7d785b35396fdd970fb9d29e65cdc1d743d0e442f0643a	2023-10-17 15:20:37.061534+09	20231017062037_add_user_age	\N	\N	2023-10-17 15:20:37.059183+09	1
6bee2f8c-75d5-46eb-8fcb-99d408f8c2bc	fbaf0098a3637e7abc84f59f95836ed6dca12fac9a4ddbb9ed729be083164d31	2023-10-17 15:24:26.91405+09	20231017062426_alter_user_age	\N	\N	2023-10-17 15:24:26.912242+09	1
7279ad4d-8a4d-4f56-be12-a345f1a32f31	1d7c130f8fc7757dc38de7b3a8e6ea800416a94a0c1b4217b47b4a3952da645c	2023-10-17 15:25:35.971814+09	20231017062535_delete_user_age	\N	\N	2023-10-17 15:25:35.969754+09	1
74b2cfec-2007-4be0-aefe-861ddcc9917e	7653edd0921d7c6b17d5be300d28d860596156b2a3254417707d05b27e7c0d23	2023-11-30 19:24:38.307428+09	20231130102438_add_user_preference_order_order_item_models	\N	\N	2023-11-30 19:24:38.294952+09	1
c8b9535a-55c8-4d48-91a4-2c8be44980a8	f7f57c14a5b0e970f05a89d2d0f29a8f026dd80861dea05368cf208faa7c2fdf	2023-11-30 19:30:01.638874+09	20231130103001_add_user_order_relation	\N	\N	2023-11-30 19:30:01.635244+09	1
59041a58-5286-4bba-928a-f9fcfeccd3ba	a32b851889ee2d097a40e700956b066fe259a66f8d2077fcbda1dda024b73ef9	2023-11-30 20:29:40.547811+09	20231130112940_add_order_order_item_and_order_item_product_relations	\N	\N	2023-11-30 20:29:40.543902+09	1
f3745a91-5c28-4097-a6bb-e2a449965af6	748af93b94bce20a8ff50f969197ab792984f2b0bde849e31e80d608f58422f1	2023-11-30 20:46:40.997906+09	20231130114640_add_user_user_preference_and_user_product_relations	\N	\N	2023-11-30 20:46:40.99078+09	1
538b4ba8-8271-40a1-80d5-8a6a465aa618	7235a86540dbd81c300c148eaca3ace187f4c6135b339185a6491e52e1bd5154	2023-11-30 20:56:29.825464+09	20231130115629_change_on_delete_constraints	\N	\N	2023-11-30 20:56:29.821492+09	1
7de8a4d4-aed6-413c-9e22-cb81be3c1841	4ae44839ba14417acd6b5bf2bec104e1e8ba6668a45d458704a145d0277ad17e	2023-11-30 21:16:36.361212+09	20231130121636_change_on_delete_constraints	\N	\N	2023-11-30 21:16:36.354396+09	1
\.


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: UserPreference UserPreference_pkey; Type: CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."UserPreference"
    ADD CONSTRAINT "UserPreference_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: UserPreference_userId_key; Type: INDEX; Schema: public; Owner: jho
--

CREATE UNIQUE INDEX "UserPreference_userId_key" ON public."UserPreference" USING btree ("userId");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: jho
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: _ProductToUser_AB_unique; Type: INDEX; Schema: public; Owner: jho
--

CREATE UNIQUE INDEX "_ProductToUser_AB_unique" ON public."_ProductToUser" USING btree ("A", "B");


--
-- Name: _ProductToUser_B_index; Type: INDEX; Schema: public; Owner: jho
--

CREATE INDEX "_ProductToUser_B_index" ON public."_ProductToUser" USING btree ("B");


--
-- Name: OrderItem OrderItem_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: OrderItem OrderItem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Order Order_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: UserPreference UserPreference_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."UserPreference"
    ADD CONSTRAINT "UserPreference_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProductToUser _ProductToUser_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."_ProductToUser"
    ADD CONSTRAINT "_ProductToUser_A_fkey" FOREIGN KEY ("A") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ProductToUser _ProductToUser_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jho
--

ALTER TABLE ONLY public."_ProductToUser"
    ADD CONSTRAINT "_ProductToUser_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

