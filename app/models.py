"""
ISI Coding test: Product Reviews backend
Models.py defines the tables as models using SQLAlchemy
Tables are already create in Postgres manually

Author: Manasi Godse
Date: May 7th, 2021
"""

from app import db
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.inspection import inspect

class Serializer(object):
    """ This class serializes the output of the GET request so that it can work with jsonify"""

    def serialize(self):
        return {c: getattr(self, c) for c in inspect(self).attrs.keys()}

    @staticmethod
    def serialize_list(l):
        return [m.serialize() for m in l]

db.Model.metadata.reflect(db.engine)

class Products(db.Model, Serializer):
    """ Represents the products table """
    __table__ = db.Model.metadata.tables['products']


class Users(db.Model, Serializer):
    """ Represents the user table"""
    __table__ = db.Model.metadata.tables['users']


class Reviews(db.Model, Serializer):
    """ Represents the Reviews table"""

    __table__ = db.Model.metadata.tables['reviews']

    """ Construction defined as Insertion happens via ORM """

    def __init__(self, user_id, product_id, review, rating):
        self.user_id = user_id
        self.product_id = product_id
        self.review = review
        self.rating = rating


def save(self):
    db.session.add(self)
    db.session.commit()


def delete(self):
    db.session.delete(self)
    db.session.commit()
