import * as React from 'react'
import '../../css/Form.css'
import { useNavigate } from 'react-router'
import {
  Button,
  Alert,
  Stack,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
} from '@mui/material'
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos'

const FormAddToWishlist = ({ bookclubs, book }) => {
  let navigate = useNavigate()

  const [bookClubId, setBookClubId] = React.useState(null)
  const [errors, setErrors] = React.useState([])
  const [updated, setUpdated] = React.useState(false)
  const [loading, setLoading] = React.useState(false)

  const handleSubmit = (e) => {
    e.preventDefault()
    setErrors([])
    setUpdated(false)
    setLoading(true)

    fetch(`/api/books/`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      body: JSON.stringify({
        title: book.title,
        series: book.series,
        author: book.author.name,
        pages: book.pages,
        description: book.description,
        publicationDate: book.publicationDate,
        imageURL: book.imageURL,
        genres: book.genres,
        bookclub_id: bookClubId,
        status: 'Not Started',
      }),
    }).then((response) => {
      setLoading(false)
      if (response.ok) {
        response.json().then((data) => {
          setUpdated(true)
        })
      } else {
        response.json().then((err) => {
          setErrors(err.errors || [err.error])
        })
      }
    })
  }

  return (
    <form onSubmit={handleSubmit} className='form'>
      <FormControl>
        <InputLabel id='user-bookclubs'>Your Book Clubs</InputLabel>
        <Select
          labelId='user-bookclubs'
          onChange={(e) => setBookClubId(e.target.value)}
          value={bookClubId}>
          {bookclubs.map((club) => (
            <MenuItem value={club.id} key={club.id} sx={{ pt: 3 }}>
              {club.name}
            </MenuItem>
          ))}
        </Select>
      </FormControl>

      {!updated && (
        <Button
          type='submit'
          variant='contained'
          className='b-radius btn btn-lg'
          color='primary'>
          Add To Wishlist
        </Button>
      )}

      <Stack
        sx={{ width: '70%', margin: 'auto' }}
        spacing={2}
        className='padding-top'>
        {errors.map((error) => (
          <Alert severity='error' variant='filled' key={error}>
            {error}
          </Alert>
        ))}
        {loading && (
          <Alert severity='info' variant='filled'>
            Updating... Do Not Refresh Page
          </Alert>
        )}

        {updated && (
          <>
            <Alert severity='success' variant='filled'>
              Book Added To Wishlist.
            </Alert>
            <Button
              variant='outlined'
              color='primary'
              // sx={{ color: brown[900], p: 2 }}
              className='btn b-radius btn-lg'
              endIcon={<ArrowForwardIosIcon />}
              onClick={() => navigate(`/bookclub/${bookClubId}/wishlist`)}>
              View Wishlist
            </Button>
          </>
        )}
      </Stack>
    </form>
  )
}

export default FormAddToWishlist
