from datetime import datetime

from sqlalchemy import ForeignKey, String, DateTime, Text
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column


class Base(DeclarativeBase):
    pass


class Region(Base):
    __tablename__ = "region"

    id: Mapped[int] = mapped_column(primary_key=True)
    nombre: Mapped[str] = mapped_column(String(200))


class Comuna(Base):
    __tablename__ = "comuna"

    id: Mapped[int] = mapped_column(primary_key=True)
    nombre: Mapped[str] = mapped_column(String(200))
    region_id: Mapped[int] = mapped_column(ForeignKey("region.id"))


class Ave(Base):
    __tablename__ = "ave"

    id: Mapped[int] = mapped_column(primary_key=True)
    nombre: Mapped[str] = mapped_column(String(80))


class Voluntario(Base):
    __tablename__ = "voluntario"

    id: Mapped[int] = mapped_column(primary_key=True)
    nombre: Mapped[str] = mapped_column(String(255))
    email: Mapped[str] = mapped_column(String(80))
    telefono: Mapped[str] = mapped_column(String(15))
    fecha_registro: Mapped[datetime] = mapped_column(DateTime)
    comuna_id: Mapped[int] = mapped_column(ForeignKey("comuna.id"))


class Avistamiento(Base):
    __tablename__ = "avistamiento"

    id: Mapped[int] = mapped_column(primary_key=True)
    voluntario_id: Mapped[int] = mapped_column(ForeignKey("voluntario.id"))
    ave_id: Mapped[int] = mapped_column(ForeignKey("ave.id"))
    fecha_hora: Mapped[datetime] = mapped_column(DateTime)
    lugar: Mapped[str] = mapped_column(String(200))
    descripcion: Mapped[str | None] = mapped_column(Text, nullable=True)


class Registro(Base):
    __tablename__ = "registro"

    id: Mapped[int] = mapped_column(primary_key=True)
    ruta_archivo: Mapped[str] = mapped_column(String(300))
    nombre_archivo: Mapped[str] = mapped_column(String(300))
    avistamiento_id: Mapped[int] = mapped_column(
        ForeignKey("avistamiento.id")
    )