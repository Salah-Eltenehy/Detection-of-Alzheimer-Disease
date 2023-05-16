CREATE DATABASE alzheimer;
USE alzheimer;

CREATE TABLE users (
  -- id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  email VARCHAR(255) NOT NULL ,
  phone VARCHAR(13) NOT NULL,
  password VARCHAR(40) NOT NULL, description TEXT,
  is_doctor TINYINT(1) DEFAULT 0,
  PRIMARY KEY (email)
);
DROP TABLE users;
INSERT INTO users (user_name, email, phone, password, description, is_doctor) VALUES ('John Doe', 'johndoe@example.com', '1234567890', 'password123', 'I am a software engineer.', 0);

INSERT INTO users (user_name, email, phone, password, description, is_doctor) VALUES ('Jane Smith', 'janesmith@example.com', '0987654321', 'pass123word', 'I am a nurse.', 1);

INSERT INTO users (user_name, email, phone, password, description, is_doctor) VALUES ('Bob Johnson', 'bjohnson@example.com', '5554443333', 'secret123', 'I am a doctor specializing in cardiology.', 1);

INSERT INTO users (user_name, email, phone, password, description, is_doctor) VALUES ('Alice Green', 'agreen@example.com', '7778889999', 'mypassword', 'I work in healthcare administration.', 0);

INSERT INTO users (user_name, email, phone, password, description, is_doctor) VALUES ('Mark Lee', 'mlee@example.com', '1112223333', 'letmein123', 'I am a medical student studying to become a surgeon.', 0);
SELECT email, password FROM users WHERE email = 'johndoe@example.com';
INSERT INTO users (user_name, email, password, phone, description, is_doctor) VALUES
        ('salah', 'johsndoe@example.com', 'password123', '+201021890205', 'sasasasasasas', 0);
INSERT INTO users (user_name, email, password, phone, description, is_doctor) VALUES
('sala2222h', 'johsnddasdhoe@example.com', 'password123', '+201021890205', 'sasasasasasas', 0);
-- DROP TABLE users; 
CREATE TABLE label_info (
  label VARCHAR(255) NOT NULL PRIMARY KEY,
  description TEXT
);
-- DROP TABLE label_info; 
INSERT INTO label_info (label, description) VALUES
(
'MildDemented', 
"Mild cognitive impairment (MCI) is a condition characterized by a slight but noticeable decline in cognitive abilities, such as memory and thinking skills. MCI can be a precursor to dementia, including Alzheimer's disease, but not everyone with MCI will develop dementia.
When a patient is diagnosed with MCI, it is important to monitor their symptoms and cognitive abilities over time. Early intervention and management of underlying conditions that may be contributing to cognitive decline, such as hypertension or depression, may help slow the progression of cognitive decline and delay the onset of dementia.
Additionally, there are several lifestyle modifications that may help improve cognitive function and overall health in individuals with MCI. These may include engaging in regular exercise, maintaining a healthy diet, staying socially active, and engaging in mentally stimulating activities, such as reading or playing games.
In some cases, medications such as cholinesterase inhibitors or memantine may be prescribed to help manage symptoms of MCI or delay the onset of dementia.
It is important for individuals with MCI to work closely with their healthcare provider to develop a personalized treatment plan that takes into account their unique needs and goals. With proper management and care, many individuals with MCI are able to maintain their cognitive function and quality of life for years to come."
);
INSERT INTO label_info (label, description) VALUES
(
'VeryMildDemented', 
"Very mild dementia is a term used to describe individuals who are experiencing early stages of cognitive decline, which may be indicative of Alzheimer's disease or another form of dementia. At this stage, individuals may experience mild memory loss, difficulty with problem-solving or decision-making, and changes in mood or behavior.
It is important for individuals with very mild dementia to receive a comprehensive medical evaluation, including cognitive testing and brain imaging, to determine the underlying cause of their symptoms and rule out other potential causes of cognitive impairment.
While there is currently no cure for dementia, there are several medications and non-pharmacological interventions that may help manage symptoms and slow the progression of the disease. For example, cholinesterase inhibitors, which work by increasing levels of acetylcholine in the brain, may help improve memory and cognitive function in some individuals with very mild dementia.
In addition to medications, non-pharmacological interventions such as cognitive training, physical exercise, and social engagement may also be beneficial in managing symptoms and improving quality of life for individuals with very mild dementia.
It is important for individuals with very mild dementia to work closely with their healthcare provider to develop a personalized treatment plan that takes into account their unique needs and goals. With proper management and care, many individuals with very mild dementia are able to maintain their cognitive function and quality of life for an extended period."
)
,
(
'ModerateDemented', 
"Moderate dementia is a term used to describe individuals who are experiencing a more advanced stage of cognitive decline, typically as a result of Alzheimer's disease or another form of dementia. At this stage, individuals may experience significant memory loss, difficulty with communication, changes in mood or behavior, and challenges with daily activities such as dressing, bathing, and eating.
It is important for individuals with moderate dementia to receive a comprehensive medical evaluation and ongoing care from a healthcare provider experienced in managing dementia. Treatment options for moderate dementia may include medications to manage symptoms such as agitation or depression, as well as non-pharmacological interventions such as occupational therapy to assist with activities of daily living and improve quality of life.
In addition, caregivers and family members of individuals with moderate dementia may benefit from support and education on how to manage the challenges associated with caring for someone with dementia. This may include resources such as respite care, support groups, and counseling.
While there is currently no cure for dementia, proper management and care can help improve quality of life for individuals with moderate dementia and their caregivers. Ongoing monitoring and assessment of symptoms, as well as regular adjustments to treatment plans as needed, can help individuals with moderate dementia maintain their cognitive function and quality of life for as long as possible."
)
,
(
'NonDemented', 
"When a patient is diagnosed as non-demented, it means that they are currently not experiencing any significant cognitive impairment or decline. This is a positive diagnosis, indicating that the individual's cognitive abilities are within a normal range for their age and other factors.
While a diagnosis of non-demented does not necessarily mean that an individual is free from all cognitive or neurological conditions, it does indicate that they are currently not experiencing significant symptoms of dementia or other cognitive impairments.\n
To maintain optimal cognitive health and reduce the risk of future cognitive decline, individuals who are non-demented can take several steps. These may include engaging in regular physical exercise, maintaining a healthy diet, staying socially engaged, and engaging in mentally stimulating activities such as reading, solving puzzles, or learning a new skill.
In addition, it is important to manage any underlying health conditions that may contribute to cognitive decline, such as hypertension, high cholesterol, or diabetes. Regular medical check-ups and screenings can help detect these conditions early and allow for prompt treatment.
Overall, a diagnosis of non-demented is a positive outcome, indicating that an individual's cognitive health is within normal limits. However, it is still important to maintain a healthy lifestyle and manage any underlying health conditions to promote optimal cognitive health and reduce the risk of future cognitive decline."
)
;


CREATE TABLE recommendation_info (
  label VARCHAR(255) NOT NULL PRIMARY KEY,
  description TEXT
);
-- DROP TABLE recommendation_info;
INSERT INTO recommendation_info (label, description) VALUES 
(
'MildDemented',
"Maintain cognitive function: Individuals with mild dementia can benefit from engaging in mentally stimulating activities such as reading, writing, or playing games that challenge the brain. This can help maintain cognitive function and delay further decline.
Exercise regularly: Regular exercise can help improve mood, cognitive function, and overall health for individuals with mild dementia. This may include activities such as walking, swimming, or gentle yoga.
Manage other health conditions: Individuals with mild dementia may have other health conditions that can contribute to cognitive decline, such as hypertension, high cholesterol, or diabetes. It is important to manage these conditions through regular medical check-ups and appropriate treatment.
Stay socially engaged: Social engagement can help improve mood and cognitive function for individuals with mild dementia. This may include participating in social activities, attending community events, or spending time with friends and family.
Use memory aids: Memory aids such as calendars, reminder notes, and pill organizers can help individuals with mild dementia remember important information and stay on track with their daily routines.
Simplify the environment: Individuals with mild dementia may benefit from a simplified living environment that is free from clutter and distractions. This can help reduce confusion and anxiety and make it easier for them to navigate their surroundings.
Seek support from healthcare professionals: Individuals with mild dementia and their caregivers may benefit from ongoing support and care from healthcare professionals experienced in managing dementia. This may include regular check-ups, medication management, and counseling or support groups."),
(
'VeryMildDemented',
"Maintain cognitive function: Engaging in mentally stimulating activities such as reading, writing, or playing games that challenge the brain can help maintain cognitive function and delay further decline.
Stay physically active: Regular exercise can help improve mood, cognitive function, and overall health for individuals with very mild dementia. This may include activities such as walking, swimming, or gentle yoga.
Practice good sleep hygiene: Getting enough restful sleep is important for maintaining cognitive function. Practicing good sleep hygiene, such as going to bed and waking up at the same time each day and avoiding stimulating activities before bedtime, can help improve sleep quality.
Stay socially engaged: Social engagement can help improve mood and cognitive function for individuals with very mild dementia. This may include participating in social activities, attending community events, or spending time with friends and family.
Use memory aids: Memory aids such as calendars, reminder notes, and pill organizers can help individuals with very mild dementia remember important information and stay on track with their daily routines.
Seek support from healthcare professionals: Individuals with very mild dementia and their caregivers may benefit from ongoing support and care from healthcare professionals experienced in managing dementia. This may include regular check-ups, medication management, and counseling or support groups.
Plan for the future: Individuals with very mild dementia and their caregivers should consider planning for the future, such as discussing advance care planning and legal arrangements. This can help ensure that the individual's wishes are respected and that appropriate care is provided in the event of further cognitive decline."
),
(
'ModerateDemented',
"Create a structured routine: Establishing a daily routine can help provide structure and stability for individuals with moderate dementia. This may include regular mealtimes, bedtime routines, and daily activities that are familiar and enjoyable.
Simplify the environment: Individuals with moderate dementia may benefit from a simplified living environment that is free from clutter and distractions. This can help reduce confusion and anxiety and make it easier for them to navigate their surroundings.
Provide assistance with daily tasks: Individuals with moderate dementia may require assistance with daily tasks such as dressing, bathing, and eating. Caregivers should provide assistance in a compassionate and patient manner, allowing the individual to maintain as much independence as possible.
Use memory aids: Memory aids such as calendars, reminder notes, and pill organizers can help individuals with moderate dementia remember important information and stay on track with their daily routines.
Stay socially engaged: Social engagement can help improve mood and cognitive function for individuals with moderate dementia. This may include activities such as attending social events, participating in group activities, or spending time with friends and family.
Consider occupational therapy: Occupational therapy can help individuals with moderate dementia maintain their independence and improve their ability to perform daily tasks. An occupational therapist can provide personalized recommendations and support to help the individual maintain their cognitive function and quality of life.
Seek support from healthcare professionals: Individuals with moderate dementia and their caregivers may benefit from ongoing support and care from healthcare professionals experienced in managing dementia. This may include regular check-ups, medication management, and counseling or support groups."
),
(
'NonDemented',
"Engage in mentally stimulating activities: Engaging in mentally stimulating activities such as reading, puzzles, learning a new skill or language, or playing games can help maintain cognitive function and improve brain health.
Eat a healthy diet: Eating a diet that is rich in fruits, vegetables, lean protein, and healthy fats can help promote brain health and cognitive function.
Exercise regularly: Regular exercise can help improve mood, cognitive function, and overall health. This may include activities such as walking, running, biking, or swimming.
Manage stress: Chronic stress can negatively impact brain health and cognitive function. Practicing stress-reduction techniques such as mindfulness, meditation, or yoga can help promote relaxation and reduce stress.
Get enough restful sleep: Getting enough restful sleep is important for maintaining cognitive function. Practicing good sleep hygiene, such as going to bed and waking up at the same time each day and avoiding stimulating activities before bedtime, can help improve sleep quality.
Stay socially engaged: Social engagement can help improve mood and cognitive function. This may include participating in social activities, attending community events, or spending time with friends and family.
Manage other health conditions: Managing other health conditions such as hypertension, high cholesterol, or diabetes can help promote brain health and cognitive function.");


