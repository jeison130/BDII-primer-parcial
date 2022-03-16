select Matriculates.academicPeriodGroupId,
       CONCAT('(',AcademicPeriodGroups.journeyId ,')', ' ', journey.name) as JORNADA,
       CONCAT('(',degree.levelId ,')', ' ', l.name) as GRADO,
       CONCAT('(',AcademicPeriodGroups.degreeId ,')', ' ', degree.name) as GRADO,
       CONCAT('(',AcademicPeriodGroups.groupId ,')', ' ', `group`.name) as GRUPO,
       coalesce(AcademicPeriodGroups.quota, 'SIN ASIGNAR') AS CUPO_DISPONIBLE,
       count(Matriculates.id) as CANTIDAD_ESTUDIANTES,
       degree.createdAt AS 'degree.createdAt' , degree.updatedAt AS 'degree.updatedAt' , degree.id AS 'degree.id' , degree.levelId AS 'degree.levelId' , degree.name AS 'degree.name' , degree.abbreviation AS 'degree.abbreviation' ,
       l.createdAt AS 'degree.level.createdAt' , l.updatedAt AS 'degree.level.updatedAt' , l.id AS 'degree.level.id' , l.name AS 'degree.level.name' , l.abbreviation AS 'degree.level.abbreviation' ,
       journey.createdAt AS 'journey.createdAt' , journey.updatedAt AS 'journey.updatedAt' , journey.id AS 'journey.id' , journey.name AS 'journey.name' , journey.abbreviation AS 'journey.abbreviation' ,
       group.createdAt AS 'group.createdAt' , group.updatedAt AS 'group.updatedAt' , group.id AS 'group.id' , group.name AS 'group.name' , group.abbreviation AS 'group.abbreviation'
from AcademicPeriodGroups
         left join Matriculates
                    on Matriculates.academicPeriodGroupId = AcademicPeriodGroups.id
         inner join Journeys as journey on AcademicPeriodGroups.journeyId = journey.id
         inner join Degrees as degree on AcademicPeriodGroups.degreeId = degree.id
         inner join Levels as l on degree.levelId = l.id
         inner join `Groups` as `group` on `group`.id = AcademicPeriodGroups.groupId
group by AcademicPeriodGroups.id
limit 10
