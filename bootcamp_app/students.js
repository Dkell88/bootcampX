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
const cohortDate =  `%${process.argv[2]}%`;
const limit = process.argv[3] || 5;
console.log(cohortDate);
console.log(typeof(cohortDate));
client.query(`
SELECT students.id, students.name as name , cohorts.name as cohort
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;`, [cohortDate, limit])
  .then(res => {
    res.rows.forEach(student => {
      console.log(`${student.name} has an id of ${student.id} and was in the ${student.cohort} cohort`);
    });
  });