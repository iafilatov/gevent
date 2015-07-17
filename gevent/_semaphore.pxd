cdef class Semaphore:
    cdef public int counter
    cdef readonly object _links
    cdef readonly object _notifier
    cdef public int _dirty

    cpdef bint locked(self)
    cpdef int release(self)
    cpdef rawlink(self, object callback)
    cpdef unlink(self, object callback)
    cpdef int wait(self, object timeout=*)
    cpdef bint acquire(self, int blocking=*, object timeout=*)
    cpdef __enter__(self)
    cpdef __exit__(self, object t, object v, object tb)

cdef class BoundedSemaphore(Semaphore):
    cdef readonly int _initial_value

    cpdef int release(self)
