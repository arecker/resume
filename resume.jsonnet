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
      'jsonnet',
    ],
    systems: [
      'aws',
      'linux',
      'argo',
      'spinnaker',
      'jenkins',
      'github actions',
    ],
    containerization: [
      'docker',
      'kubernetes',
      'istio',
    ],
    iac: [
      'cloudformation',
      'terraform',
      'ansible',
      'packer',
      'chef',
      'saltstack',
      'packer',
      'git',
    ],
    content: [
      'screencast',
      'diagramming',
      'html',
      'css',
      'markdown',
      'static content management',
    ],
    security: [
      'vault',
      'iam',
      'soc2',
    ],
    monitoring: [
      'datadog',
      'cloudwatch',
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
        Achievement('Awarded the Bernard Nelson Scholarship for academic excellence in Organic Chemistry.'),
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
        Achievement('Led a project to rewrite foundational infrastructure tooling while migrating the stack to AWS.'),
        Achievement('Automated provisioning of VPCs and cloud networks using Argo, integrating AWS IPAM.'),
        Achievement('Designed and implemented automation for full mesh Transit Gateway networks, delivering under budget.'),
        Achievement('Contributed as an on-call network engineer with Istio service mesh, performing upgrades and debugging.'),
        Achievement('Developed tooling to route edge traffic around impaired AWS zones, mitigating customer impact.'),
        Achievement('Presented training sessions for new engineers and led co-op intern teams on impactful projects.'),
        Achievement('Led a project to re-architect Consul servers for improved stability, achieving zero downtime during the transition.'),
      ],
    ),
    Workplace(
      name='Healthgrades',
      location='Middleton, WI',
      role='Software Engineer',
      start='April 2015',
      end='September 2016',
      achievements=[
        Achievement('Ported 500+ ColdFusion routines to Django/SQLAlchemy while maintaining API compatibility.'),
        Achievement('Enhanced backend, frontend, and deployment tooling using Saltstack, Django, and AngularJS.'),
      ]
    ),
    Workplace(
      name='Practice Velocity',
      location='Rockford, IL',
      role='Software Engineer',
      start='June 2013',
      end='April 2015',
      achievements=[
        Achievement('Migrated version control from SVN to Git, conducting workshops and creating tooling.'),
        Achievement('Wrote SQL reports to help stakeholders monitor company growth.'),
        Achievement('Authored a JavaScript standard to establish best practices, collaborating with the team and securing approval through a consensus-driven process.'),
      ]
    ),
  ],
}
