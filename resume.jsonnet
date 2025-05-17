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
      'istio',
      'kubernetes',
      'cloudflare',
      'linux',
      'consul',
      'vault',
      'jenkins',
      'spinnaker',
      'argo',
      'github actions',
    ],
    infra: [
      'terraform',
      'cloudformation',
      'kubernetes operators',
      'chef',
      'ansible',
      'packer',
    ],
    content: [
      'documentation',
      'runbooks',
      'tutorials',
      'diagrams',
      'screencasts',
      'html/css',
      'markdown',
      'plantuml',
      'jsonnet',
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
        Achievement('Worked as a teaching assistant, lab assistant, and research assistant in Organic Chemistry.'),
        Achievement('Earned a BS in Chemistry with an ACS certification in Analytical techniques.'),
      ]
    ),
  ],
  workplaces: [
    Workplace(
      name='Zendesk',
      location='Remote',
      role='Staff Software Engineer',
      start='September 2016',
      end='present',
      achievements=[
        Achievement('Led a project to rewrite our foundation infrastructure tooling while moving our entire stack to AWS.  Built out the foundational network while working with teams to convert their virtual machines into autoscaling groups with CloudFormation.'),
        Achievement('Assisted in engineer onboarding as a rotating presenter, giving regular training sessions to help new hires understand our architecture.  Independently led teams of co-op interns to deliver and present impactful projects.'),
        Achievement('Assisted with a project to improve Internet resiliency from our customers to our services with Datadog and Ripe Atlas.'),
        Achievement('Contributed as an on-call network engineer with Istio service mesh.  Performed upgrades, debugged customer issues, and assisted with outages.'),
        Achievement('Worked closely with external customers to debug webhook integration issues between our networks.'),
        Achievement('Wrote automation to route edge traffic around impaired AWS availability zones that was successfully used to mitigate the effects of AWS outages on our customers.'),
        Achievement('Led a project to automate provisioning of our VPCs and cloud networks with Argo.  Delievered on time while meeting a stretch-goal of migrating the process to AWS IPAM.'),
        Achievement('Led a project to design new automation for our full mesh Transit Gateway network.  Delivered a solution undertime and underbudget, then presented at an all engineering meeting.'),
      ],
    ),
    Workplace(
      name='Healthgrades',
      location='Middleton, WI',
      role='Software Engineer',
      start='April 2015',
      end='September 2016',
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
      start='June 2013',
      end='April 2015',
      achievements=[
        Achievement('Helped the company migrate all version control from SVN to Git.  Collaborated on replacement workflows for tooling, conducted developer workshops, and wrote tooling to convert git history into release notes for stakeholders.'),
        Achievement('Wrote and disemminated a standard for JavaScript best practices at the company.  Used testing, refactoring, and continuous development to improve feature velocity in our legacy web application.'),
        Achievement('Gathered requirements for custom reports and wrote SQL to help executive stakeholders monitor company growth.'),
        Achievement('Collaborated on a grass-roots internal tool for support engineers to easily validate and import patient data.'),
      ]
    ),
  ],
}
