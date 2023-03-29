import * as React from 'react'
import { useLocation } from 'react-router'
import { Link } from 'react-router-dom'
import BookClubInfo from '../bookclub/BookClubInfo'

import { Grid, Paper, MenuList, MenuItem, Tooltip } from '@mui/material'

const BookclubMenu = ({ user, bookclub }) => {
  let location = useLocation()

  return (
    <Paper sx={{ p: 4 }}>
      <Grid
        container
        item
        flexDirection='column'
        wrap='nowrap'
        alignItems='center'
        justifyContent='center'>
        <BookClubInfo name={bookclub.name} members={bookclub.users} />
      </Grid>

      <Grid item>
        <MenuList className='side-menu'>
          <MenuItem
            className={
              location.pathname.includes('current-book') ? 'active' : null
            }>
            <Link to={`/bookclub/${bookclub.id}/current-book`}>
              Currently Reading
            </Link>
          </MenuItem>
          <MenuItem
            className={
              location.pathname.includes('wishlist') ? 'active' : null
            }>
            <Link to={`/bookclub/${bookclub.id}/wishlist`}>Book Wishlist</Link>
          </MenuItem>

          <MenuItem
            className={location.pathname.includes('history') ? 'active' : null}>
            <Link to={`/bookclub/${bookclub.id}/history`}>Book History</Link>
          </MenuItem>

          {user && bookclub && user.id === bookclub.admin.id && (
            <Tooltip
              title='edit book club users and info'
              placement='bottom-end'>
              <MenuItem
                className={
                  location.pathname.includes('admin-dashboard')
                    ? 'active'
                    : null
                }>
                <Link to={`/bookclub/${bookclub.id}/admin-dashboard`}>
                  Book Club Settings
                </Link>
              </MenuItem>
            </Tooltip>
          )}
        </MenuList>
      </Grid>
    </Paper>
  )
}

export default BookclubMenu
