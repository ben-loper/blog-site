
-- Switch to the system (aka master) database
USE master;
GO

-- Delete the Pagila Database (IF EXISTS)
IF EXISTS(select * from sys.databases where name='BlogDB')
DROP DATABASE BlogDB;
GO

-- Create a new BlogDB Database
CREATE DATABASE BlogDB;
GO

-- Switch to the BlogDB Database
USE BlogDB
GO

BEGIN TRANSACTION;

CREATE TABLE categories (
    id int IDENTITY,
	name VARCHAR(64) NOT NULL UNIQUE,
	description VARCHAR(600) NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (id)
);

CREATE TABLE blog (
    id int IDENTITY,
	category_id int NOT NULL,
    title VARCHAR(50) NOT NULL,
	summary VARCHAR(600) NOT NULL,
	article VARCHAR(6000) NOT NULL,
    CONSTRAINT blog_pk PRIMARY KEY (id),
	CONSTRAINT blog_category_fk FOREIGN KEY (category_id) REFERENCES categories(id)
);


INSERT INTO categories(name, description)
VALUES ('Pets', 'Andouille kevin strip steak, bacon sirloin chicken meatball landjaeger. Jowl venison porchetta swine chuck prosciutto pork loin pancetta spare ribs corned beef ball tip cow meatball. Sirloin beef ribs swine strip steak boudin cow doner, kielbasa turducken shank t-bone venison hamburger tri-tip. Tri-tip burgdoggen swine, pastrami ground round cupim pork loin. Shankle kielbasa pig turducken doner capicola.'),
		('Technology', 'Tail shankle t-bone pastrami, burgdoggen alcatra kevin capicola landjaeger. Drumstick leberkas frankfurter, shoulder fatback ham hock kevin meatball capicola boudin hamburger prosciutto alcatra beef ribs tenderloin. Ground round alcatra tri-tip jowl biltong bresaola turducken andouille kevin brisket. Filet mignon sausage chicken alcatra buffalo, swine rump cow.'),
		('Cooking', 'Ham hock picanha tongue pork chop prosciutto, chicken beef. Fatback short ribs picanha beef ribs turducken bacon alcatra meatball buffalo kielbasa t-bone tri-tip spare ribs sausage. Ribeye sirloin flank pork belly, rump drumstick tail venison strip steak. Ground round drumstick pork belly, shankle beef turkey short ribs kielbasa fatback.'),
		('Gaming', 'Ground round tenderloin flank shoulder boudin jerky pastrami tail salami. Cupim alcatra ham hock bacon, doner turkey pork belly sirloin. Jowl meatball ribeye, ground round pork belly fatback ham shoulder. Landjaeger brisket tenderloin filet mignon shank pork loin, beef ribs jerky jowl. Kielbasa chuck meatloaf biltong doner spare ribs turducken landjaeger burgdoggen ribeye. Ball tip corned beef brisket spare ribs capicola turkey shank tri-tip alcatra meatball.'),
		('Parenting', 'Andouille kevin strip steak, bacon sirloin chicken meatball landjaeger. Jowl venison porchetta swine chuck prosciutto pork loin pancetta spare ribs corned beef ball tip cow meatball. Sirloin beef ribs swine strip steak boudin cow doner, kielbasa turducken shank t-bone venison hamburger tri-tip. Tri-tip burgdoggen swine, pastrami ground round cupim pork loin. Shankle kielbasa pig turducken doner capicola.'),
		('Do-it-yourself', 'Bacon ham hock tenderloin strip steak swine corned beef chicken spare ribs, sirloin ham tongue bresaola pork chop short ribs. Tongue bacon turkey pig ribeye. Prosciutto cupim ham, beef ribs pork cow tongue leberkas. Rump fatback flank short loin pig tri-tip pork belly pastrami sirloin bresaola. Biltong spare ribs salami cupim chuck ham tongue brisket.'),
		('Oddly Satisfying', 'Filet mignon capicola short ribs tongue meatloaf ham bacon ball tip. Beef ribs frankfurter pancetta, alcatra ham hock doner pig short ribs ground round brisket cupim jerky. Boudin chuck biltong drumstick buffalo picanha tri-tip. Chuck fatback corned beef picanha spare ribs leberkas buffalo meatball ball tip porchetta. Venison doner sirloin, ribeye tail tri-tip cow pastrami.'),
		('Professional Developement', 'Spicy jalapeno bacon ipsum dolor amet chuck leberkas sirloin, doner turkey pork loin drumstick jerky fatback. Biltong sausage pork meatball burgdoggen pork belly andouille kevin, jowl capicola beef cupim alcatra. Shank spare ribs chicken picanha porchetta pancetta andouille burgdoggen tongue frankfurter jowl meatloaf. Corned beef prosciutto meatloaf, turducken pork loin shank ham hock alcatra. Ribeye tri-tip beef drumstick spare ribs pork chop prosciutto strip steak short ribs flank pork.')




INSERT INTO blog(category_id, title, summary, article)
VALUES ((Select id FROM categories WHERE name = 'Pets'), 'Why dogs and cats do not get along', 'Tail shankle t-bone pastrami, burgdoggen alcatra kevin capicola landjaeger. Drumstick leberkas frankfurter, shoulder fatback ham hock kevin meatball capicola boudin hamburger prosciutto alcatra beef ribs tenderloin. Ground round alcatra tri-tip jowl biltong bresaola turducken andouille kevin brisket. Filet mignon sausage chicken alcatra buffalo, swine rump cow. Tail shankle t-bone pastrami, burgdoggen alcatra kevin capicola landjaeger. Drumstick leberkas frankfurter, shoulder fatback ham hock kevin meatball capicola boudin hamburger prosciutto alcatra beef ribs tenderloin.', 'Spicy jalapeno bacon ipsum dolor amet chuck leberkas sirloin, doner turkey pork loin drumstick jerky fatback. Biltong sausage pork meatball burgdoggen pork belly andouille kevin, jowl capicola beef cupim alcatra. Shank spare ribs chicken picanha porchetta pancetta andouille burgdoggen tongue frankfurter jowl meatloaf. Corned beef prosciutto meatloaf, turducken pork loin shank ham hock alcatra. Ribeye tri-tip beef drumstick spare ribs pork chop prosciutto strip steak short ribs flank pork.

Andouille kevin strip steak, bacon sirloin chicken meatball landjaeger. Jowl venison porchetta swine chuck prosciutto pork loin pancetta spare ribs corned beef ball tip cow meatball. Sirloin beef ribs swine strip steak boudin cow doner, kielbasa turducken shank t-bone venison hamburger tri-tip. Tri-tip burgdoggen swine, pastrami ground round cupim pork loin. Shankle kielbasa pig turducken doner capicola.

Ham hock fatback pig frankfurter, cupim meatball turducken short loin biltong pork filet mignon short ribs sausage t-bone. Picanha spare ribs tail alcatra, swine jerky frankfurter sausage shankle bacon biltong corned beef. Sausage andouille tail pancetta pastrami picanha, sirloin fatback kielbasa swine strip steak t-bone boudin. Turducken hamburger flank tenderloin salami bacon prosciutto meatloaf kielbasa turkey pork chop rump frankfurter bresaola. Hamburger porchetta chuck, kielbasa ham hock pork belly meatball sausage.

Tail shankle t-bone pastrami, burgdoggen alcatra kevin capicola landjaeger. Drumstick leberkas frankfurter, shoulder fatback ham hock kevin meatball capicola boudin hamburger prosciutto alcatra beef ribs tenderloin. Ground round alcatra tri-tip jowl biltong bresaola turducken andouille kevin brisket. Filet mignon sausage chicken alcatra buffalo, swine rump cow.

Pork pig t-bone ground round porchetta chuck ham hock ham burgdoggen frankfurter bresaola tenderloin. Pork belly ham tail, pastrami meatloaf cupim t-bone chicken jowl landjaeger capicola. Rump flank ball tip meatball picanha kielbasa boudin ribeye fatback sausage bacon swine chicken. Tri-tip pork chop ground round tongue kielbasa burgdoggen boudin flank, ribeye andouille sirloin.

Ham hock picanha tongue pork chop prosciutto, chicken beef. Fatback short ribs picanha beef ribs turducken bacon alcatra meatball buffalo kielbasa t-bone tri-tip spare ribs sausage. Ribeye sirloin flank pork belly, rump drumstick tail venison strip steak. Ground round drumstick pork belly, shankle beef turkey short ribs kielbasa fatback.

Ground round tenderloin flank shoulder boudin jerky pastrami tail salami. Cupim alcatra ham hock bacon, doner turkey pork belly sirloin. Jowl meatball ribeye, ground round pork belly fatback ham shoulder. Landjaeger brisket tenderloin filet mignon shank pork loin, beef ribs jerky jowl. Kielbasa chuck meatloaf biltong doner spare ribs turducken landjaeger burgdoggen ribeye. Ball tip corned beef brisket spare ribs capicola turkey shank tri-tip alcatra meatball.

Pig beef ribs jowl pancetta beef boudin, turkey ground round landjaeger pork belly. Short loin tongue capicola sirloin, tri-tip tenderloin venison. Corned beef tri-tip pork meatloaf venison. Drumstick shoulder filet mignon meatball capicola pork belly rump beef pork fatback prosciutto hamburger turducken alcatra. Rump fatback doner, pork loin bresaola chuck shank shoulder strip steak burgdoggen leberkas chicken. Leberkas alcatra t-bone pastrami tongue shank ribeye tri-tip spare ribs tail meatloaf.')



COMMIT;