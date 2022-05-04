const { Pool } = require('pg');

const config = {
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
};

const client = new Pool(config);

client.connect(() => {
  console.log('Connected');
});
const cohortInput = process.argv[2];
client.query(`SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name LIKE $1
  ORDER BY teacher;`, [cohortInput])
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`${teacher.teacher}: ${teacher.cohort}`);
    });
  });