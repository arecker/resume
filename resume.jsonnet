local Workplace(name='', location='', role='', start='', end=null, achievements=[]) = (
  assert name != '' : 'name must be set!';
  assert location != '' : 'location must be set!';

  {
    name: name,
    location: location,
    role: role,
    start: start,
    end: end,
    achievements: achievements,
  }
);

local School(name='', location='', duration='', achievements=[]) = (
  {
    name: name,
    location: location,
    duration: duration,
    achievements: achievements,
  }
);

local Achievement(description) = (
  assert std.type(description) == 'string' : 'description should be a string!';
  assert std.endsWith(description, '.') : 'description should end in a period!';

  description
);

local capitalizeWord(str) =
  std.asciiUpper(str[0]) + str[1:];

local transformSkills(mp) =
  std.map(function(x) { topic: capitalizeWord(x), items: std.join(', ', mp[x]) }, std.objectFields(mp));

{
  info: {
    name: 'Alex Recker',
    location: 'Schaumburg, IL',
    phone: '(847) 833-1235',
    email: 'alex@reckerfamily.com',
    website: 'www.alexrecker.com',
    github: 'arecker',
  },
  skills: transformSkills({
    programming: [
      'python',
      'ruby',
      'bash',
      'golang',
      'lisp',
    ],
    systems: [
      'aws',
      'kubernetes',
      'linux',
      'istio',
      'gcp',
      'consul',
      'vault',
      'jenkins',
      'spinnaker',
      'github actions',
    ],
    infra: [
      'chef',
      'ansible',
      'terraform',
      'cloudformation',
      'packer',
    ],
    configuration: [
      'json',
      'yaml',
      'dhall',
      'jsonnet',
      'helm',
    ],
    content: [
      'documentation',
      'runbooks',
      'tutorials',
      'diagrams',
      'screencasts',
      'html/css',
      'markdown',
    ],
    process: [
      'agile',
      'scrum',
      'post mortems',
      'code screens',
      'pair programming',
    ],
  }),
  schools: [
    School(
      name='Wheaton College',
      location='Wheaton, IL',
      duration='2009 - 2013',
      achievements=[
	Achievement('Received Bernard Nelson Scholarship Award for best in upper level Organic Chemistry.'),
	Achievement('Worked as a teaching assistant, lab assistant, and research assistant in Organic Chemistry.'),
	Achievement('Earned a BS in Chemistry with an ACS certification in Analytical techniques.'),
      ]
    ),
  ],
  workplaces: [
    Workplace(
      name='Zendesk',
      location='Madison, WI',
      role='Staff Software Engineer',
      start='2016-09',
      end='present',
      achievements=[
	Achievement('Led a project to rewrite our foundation infrastructure tooling while moving four of our application partitions in Amazon Web Services.  Worked with teams to convert their virtual machines into autoscaling groups  managed by CloudFormation.'),
	Achievement('Conducted technical interviews and code screens for teams across engineering.  Gave workshops showing engineers how to evaluate candidates fairly.  Presented at company conference on how to perform effectively in code screens.'),
	Achievement('Assisted in engineer onboarding as a rotating presenter, giving regular training sessions to help new hires understand our architecture.'),
	Achievement('Improved the stability of our high-availability Consul service discovery clusters by redesigning the cloud architecture.  Conducted a global migration onto new architecture with zero downtime.'),
	Achievement('Led a team of three interns in building a serverless disaster recovery trigger for our global Hashicorp Vault.'),
	Achievement('Led a team of four interns in the design, implementation, testing, and rollout of a kubernetes container sidecar for managing secrets.'),
	Achievement('Assisted as an on-call engineer in outages involving Vault, Consul service discovery, and Istio service mesh.  Documented and presented lessons from these outages in formal post mortems and implemented remediations in the form of improved runbooks and automation.'),
      ],
    ),
    Workplace(
      name='Healthgrades',
      location='Middleton, WI',
      role='Software Engineer',
      start='2015-04',
      end='2016-09',
      achievements=[
	Achievement('Led a project to port over 500 ColdFusion routines to Django/SQLAlchemy without breaking REST API compatibility.'),
	Achievement('Used an in-house postgresql reporting framework to write custom reports to help medical provider assistants visualize patient data.'),
	Achievement('Contributed to the backend, frontend, and deployment tooling of our product.  Used Saltstack, Django, SqlAlchemy, and AngularJS to enhance the flagship application.'),
      ]
    ),
    Workplace(
      name='Practice Velocity',
      location='Rockford, IL',
      role='Software Engineer',
      start='2013-06',
      end='2015-04',
      achievements=[
	Achievement('Helped the company migrate all version control from SVN to Git.  Collaborated on replacement workflows for tooling, conducted developer workshops, and wrote tooling to convert git history into release notes for stakeholders.'),
	Achievement('Wrote and disemminated a standard for JavaScript best practices at the company.  Used testing, refactoring, and continuous development to improve feature velocity in our legacy web application.'),
	Achievement('Gathered requirements for custom reports and wrote SQL to help executive stakeholders monitor company growth.'),
	Achievement('Collaborated on a grass-roots internal tool for support engineers to easily validate and import existing patient data for new clients.'),
      ]
    ),
  ],
}
