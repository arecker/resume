#!./venv/bin/python
import base64
import collections
import datetime
import json
import json
import pathlib

import jinja2


def main():
    result = load_template().render(d=load_data(), avatar=load_avatar(), css=load_css())
    print(result)


Info = collections.namedtuple('Info', [
    'name',
    'location',
    'email',
    'phone',
    'website',
    'github',
])


School = collections.namedtuple('School', [
    'name',
    'location',
    'duration',
    'achievements',
])

Skills = collections.namedtuple('Skills', [
    'programming',
    'systems',
    'infra',
    'configuration',
    'content',
    'process',
])

Workplace = collections.namedtuple('Workplace', [
    'name',
    'location',
    'role',
    'start',
    'end',
    'achievements',
])


def new_workplace(data: dict) -> Workplace:
    kwargs = data.copy()

    def format_date(datestr) -> datetime.datetime:
        d = datetime.datetime.strptime(datestr, '%Y-%m')
        return d.strftime('%B %Y')

    kwargs['start'] = format_date(kwargs['start'])
    if end := kwargs['end']:
        kwargs['end'] = format_date(end)

    return Workplace(**kwargs)


Data = collections.namedtuple('Data', [
    'info',
    'schools',
    'workplaces',
    'skills',
])


def load_data() -> Data:
    expected_file = pathlib.Path('./resume.json')
    assert expected_file.is_file()

    kwargs = {}
    with expected_file.open('r') as f:
        data = json.load(f)
        kwargs['info'] = Info(**data['info'])
        kwargs['schools'] = [School(**d) for d in data['schools']]
        kwargs['workplaces'] = [new_workplace(d) for d in data['workplaces']]
        kwargs['skills'] = Skills(**data['skills'])

    return Data(**kwargs)


def load_template() -> jinja2.Template:
    expected_file = pathlib.Path('./resume.html.j2')
    assert expected_file.is_file()

    with expected_file.open('r') as f:
        return jinja2.Template(f.read())


def load_avatar() -> str:
    expected_file = pathlib.Path('./avatar.jpg')
    assert expected_file.is_file()

    with expected_file.open('rb') as f:
        return base64.b64encode(f.read()).decode('utf-8')


def load_css() -> str:
    expected_file = pathlib.Path('./resume.css')
    assert expected_file.is_file()

    with expected_file.open('r') as f:
        return f.read()


if __name__ == '__main__':
    main()
